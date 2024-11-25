package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.sist.dbcp.CreateDBCPConnection;
import java.util.*;
import com.sist.model.BusanListModel;
import com.sist.vo.*;

import java.sql.*;
public class HeartDAO {
	   private Connection conn; //데이터베이스 연결
	   private PreparedStatement ps;//SQL전송 , 결과값 
	   private static HeartDAO dao;
	   // DBCP라이브러리 
	   private CreateDBCPConnection dbconn=
			        new CreateDBCPConnection();
	   
	   public static HeartDAO newInstance() {
		   if (dao==null)
			   dao = new HeartDAO();
			return dao;		   
	   }
	   
	   /*
			SELECT j.jno, tour.poster, tour.TITLE, j.no 
			FROM user_ u 
			JOIN Heart j ON u.id = j.id 
			JOIN tour ON j.no = tour.NO 
			WHERE u.id = 'yeon' 
			ORDER BY j.jno DESC;
	    * 
	    */
	// 찜한 명소,축제,맛집,체험 목록 -> 마이페이지
	public List<HeartVO> busanHeartListData(String id,String tab,int cateno) {
		List<HeartVO> list = new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT h.hno, "+tab+".poster, "+tab+".TITLE, h.no "
					+ "FROM user_ u "
					+ "JOIN Heart h ON u.id = h.id "
					+ "JOIN "+tab+" ON h.no = "+tab+".NO "
					+ "WHERE u.id=? AND h.CATENO = "+cateno
					+ " ORDER BY h.jno DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				HeartVO vo = new HeartVO();
				vo.setHno(rs.getInt(1));
				vo.getBvo().setPoster(rs.getString(2));
				vo.getBvo().setTitle(rs.getString(3));
				vo.setNo(rs.getInt(4));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	// 찜한 전시회 목록 -> 마이페이지
	public List<HeartVO> exHeartListData(String id) {
		List<HeartVO> list = new ArrayList<>();
		try {
			conn=dbconn.getConnection();
			String sql="SELECT h.hno, e.poster, e.ename, e.eno "
					+ "FROM user_ u "
					+ "JOIN Heart h ON u.id = h.id "
					+ "JOIN EXHIBITION e ON h.no = e.eNO "
					+ "WHERE u.id=? AND j.CATENO = 5 "
					+ "ORDER BY h.hno DESC";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				HeartVO vo = new HeartVO();
				vo.setHno(rs.getInt(1));
				vo.getEvo().setPoster(rs.getString(2));
				vo.getEvo().setEname(rs.getString(3));
				vo.setNo(rs.getInt(4));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int heartCount(String id,int cateno,int no)
	{
		int count=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT count(*) FROM Heart "
					+ "WHERE id=? AND cateno=? AND no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, cateno);
			ps.setInt(3, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			ps.close();
			if(count==0)
			{
				count=0;
			}else {
				count=1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return count;
		
	}
	public String heartUpdate(String id,int cateno,int no)
	{
		String result="";
		try {
			conn=dbconn.getConnection();
			String sql="SELECT count(*) FROM Heart"
					+ " WHERE id=? AND cateno=? AND no=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setInt(2, cateno);
			ps.setInt(3, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			ps.close();
			
			if(count!=1)
			{
				sql="INSERT INTO Heart "
						+ "VALUES((SELECT NVL(MAX(hno)+1,1) FROM Heart),"
						+ "?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, cateno);
				ps.setInt(3, no);
				ps.executeUpdate();
				result="ok";			
			}
			else {
				sql="DELETE FROM Heart "
						+ "WHERE id=? AND CATENO=? AND NO=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setInt(2, cateno);
				ps.setInt(3, no);
				ps.executeUpdate();
				result="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return result;
	}
	public int heartTotalCount(int cateno,int no)
	{
		int count=0;
		try {
			conn=dbconn.getConnection();
			String sql="SELECT count(*) FROM Heart "
					+ "WHERE cateno=? AND no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cateno);
			ps.setInt(2, no);
			ResultSet rs=ps.executeQuery();
			rs.next();
			count=rs.getInt(1);
			rs.close();
			ps.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.disConnection(conn, ps);
		}
		return count;
		
	}
	
}
