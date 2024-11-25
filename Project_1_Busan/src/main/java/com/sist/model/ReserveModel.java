package com.sist.model;

import java.util.*;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.ExDAO;
import com.sist.dao. ReserveDAO;
import com.sist.vo.ExVO;
import com.sist.vo.ReserveInfoVO;
import com.sist.*;


public class  ReserveModel {
	@RequestMapping("reserve/reserve_main.do")
	public String reserve_main(HttpServletRequest request,
			HttpServletResponse response)
	{
		String eno=request.getParameter("eno");
		System.out.println(eno);
		return "../reserve/reserve_main.jsp";
	}
	@RequestMapping("reserve/ex_date.do")
	public String diary(HttpServletRequest request,
			HttpServletResponse response)
	{
		String eno=request.getParameter("eno");
		System.out.println(eno);
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-M-d");
		String today=sf.format(new Date());
		StringTokenizer st=new StringTokenizer(today,"-");
		String y=st.nextToken();
		String m=st.nextToken();
		String d=st.nextToken();

		int year=Integer.parseInt(y);
		int month=Integer.parseInt(m);
		int day=Integer.parseInt(d);

		String[] strWeek= {"일","월","화","수","목","금","토"};
		Calendar cal=Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1); //
		cal.set(Calendar.DATE, 1); //시작일 설정

		//요일 구하기
		int week=cal.get(Calendar.DAY_OF_WEEK); //1~7
		int lastday=cal.getActualMaximum(Calendar.DATE);
		week=week-1;//배열인덱스로 쓰려면 0~6 

		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		request.setAttribute("strWeek", strWeek);

		//예약 가능한 날짜
		ReserveDAO dao= ReserveDAO.newInstance();
		String rdays=dao.reserveDays(Integer.parseInt(eno));
		int rday[]=new int[32];
		st=new StringTokenizer(rdays,",");
		while(st.hasMoreTokens())
		{
			int a=Integer.parseInt(st.nextToken());
			if(a>=day)
			{
				rday[a]=1; //오늘보다 큰 날짜는 예약 가능 1
			}
		}
		request.setAttribute("rday", rday);
		return "../reserve/ex_date.jsp";
	}
	@RequestMapping("reserve/ex_ename.do")
	public void  ex_ename (HttpServletRequest request,
			HttpServletResponse response)
	{
		// DB연동 
		//1. 요청값 받기
		String eno=request.getParameter("eno");

		ExDAO dao=new ExDAO();
		ExVO vo=dao.exDetailData(Integer.parseInt(eno));
		String ename=vo.getEname();

		try {
			PrintWriter pw=response.getWriter();
			pw.write(URLEncoder.encode(ename,"UTF-8"));
		}catch(Exception e) {e.printStackTrace();}
	}
	@RequestMapping("reserve/ex_time.do")
	public String time(HttpServletRequest request,
			HttpServletResponse response)
	{
		String day=request.getParameter("day");
		System.out.println(day);
		 ReserveDAO dao= ReserveDAO.newInstance();
		String rtime=dao.reserveDateTime(Integer.parseInt(day));
		System.out.println(rtime);
		StringTokenizer st=new StringTokenizer(rtime,",");
		List<String> list=new ArrayList<String>();
		while(st.hasMoreTokens())
		{
			int ftno=Integer.parseInt(st.nextToken());
			System.out.println(ftno);
			String time=dao.reserveTime(ftno);
			System.out.println(time);
			list.add(time);

		}
		request.setAttribute("list", list);
		return "../reserve/ex_time.jsp";
	}

	@RequestMapping("reserve/ex_inwon.do")
	public String inwon(HttpServletRequest request,
			HttpServletResponse response)
	{
		return "../reserve/ex_inwon.jsp";
	}


	@RequestMapping("reserve/reserve_ok.do")
	public String reserve_ok(HttpServletRequest request,
			HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		}catch(Exception e) {}
		String no=request.getParameter("no");
		String rday=request.getParameter("rday");
		String rtime=request.getParameter("rtime");
		String rinwon=request.getParameter("rinwon");
		System.out.println(no+" "+rday+" "+rtime+" "+rinwon);
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		 ReserveInfoVO vo=new  ReserveInfoVO();
		vo.setNo(Integer.parseInt(no));
		vo.setDay(rday);
		vo.getMvo().setId(id);
		vo.setInwon((rinwon));
		vo.setTime(rtime);
		 ReserveDAO dao= ReserveDAO.newInstance();
		dao.reserveInsertData(vo);
		
		return "redirect:../mypage/myReserv.do";
	}
}


