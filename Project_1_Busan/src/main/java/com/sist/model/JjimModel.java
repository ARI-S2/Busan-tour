package com.sist.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.JjimDAO;

public class JjimModel {
   @RequestMapping("busan/jjim.do")
	public void busan_jjim(HttpServletRequest request, HttpServletResponse response)
	{
	   try {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception e) {e.printStackTrace();}
	   String no=request.getParameter("no");
	   String cateno=request.getParameter("cateno");
	   String tab=request.getParameter("tab");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   JjimDAO dao=JjimDAO.newInstance();
	   String res=dao.jjimUpdate(id, Integer.parseInt(cateno), Integer.parseInt(no),tab);
	   
	   try {
		   PrintWriter out=response.getWriter();
		   out.write(res);
	   }catch(Exception e) {e.printStackTrace();}
	}
   

   @RequestMapping("busan/ex_jjim.do")
 	public void ex_busan_jjim(HttpServletRequest request, HttpServletResponse response)
 	{
 	   try {
 		   request.setCharacterEncoding("UTF-8");
 		   
 	   }catch(Exception e) {e.printStackTrace();}
 	   String eno=request.getParameter("eno");
 	   String cateno=request.getParameter("cateno");
 	   System.out.println(eno+" "+"cateno");
 	   HttpSession session=request.getSession();
 	   String id=(String)session.getAttribute("id");
 	   JjimDAO dao=JjimDAO.newInstance();
 	   String res=dao.jjimexUpdate(id, Integer.parseInt(cateno), Integer.parseInt(eno),"EXHIBITION");
 	   
 	   try {
 		   PrintWriter out=response.getWriter();
 		   out.write(res);
 	   }catch(Exception e) {e.printStackTrace();}
 	}
   
   @RequestMapping("busan/checklogin.do")
	public void checklogin(HttpServletRequest request, HttpServletResponse response)
	{
	   try {
		   request.setCharacterEncoding("UTF-8");
		   
	   }catch(Exception e) {e.printStackTrace();}
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   System.out.println(id);
	   String res="no";
	   if(id==null)
		   res="no";
	   else
		   res="yes";   
	   try {
		   PrintWriter out=response.getWriter();
		   out.write(res);
	   }catch(Exception e) {e.printStackTrace();}
	}

   
    
}
