package board3.dao;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import board3.dto.Board3Dto;

public class Board3Dao {
	Connection conn;
	public Board3Dao() throws Exception
	{
		String db = "jdbc:mysql://localhost:3306/first?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
		conn = DriverManager.getConnection(db,"root","chang1267");
	}
	public void write(HttpServletRequest request) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
		String sql = "insert into board2(name, title, content, pwd, writeday) values(?,?,?,?,now())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, content);
		pstmt.setString(4, pwd);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	public ArrayList<Board3Dto> list() throws Exception
	{
		String sql = "select * from board2 order by id desc";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		ArrayList<Board3Dto> list = new ArrayList<Board3Dto>();
		while(rs.next())
		{
			Board3Dto dto = new Board3Dto();
			dto.setId(rs.getInt("id"));
			dto.setName(rs.getString("name"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setPwd(rs.getString("pwd"));
			dto.setReadnum(rs.getInt("readnum"));
			dto.setWriteday(rs.getString("writeday"));
			
			list.add(dto);
		}
		return list;
	}
	public void readnum(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "update board2 set readnum=readnum+1 where id ="+id;
		Statement stmt = conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
	}
	public Board3Dto content(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "select * from board2 where id="+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		Board3Dto dto = new Board3Dto();
		dto.setId(rs.getInt("id"));
		dto.setName(rs.getString("name"));
		dto.setTitle(rs.getString("title"));
		dto.setContent(rs.getString("content"));
		dto.setPwd(rs.getString("pwd"));
		dto.setReadnum(rs.getInt("readnum"));
		dto.setWriteday(rs.getString("writeday"));
		return dto;
	}
	public int delete(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String sql2 = "select pwd from board2 where id="+id;
		Statement stmt2 = conn.createStatement();
		ResultSet rs = stmt2.executeQuery(sql2);
		rs.next();
		int chk=0;
		if(pwd.equals(rs.getString("pwd")))
		{
			String sql = "delete from board2 where id="+id;
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		}
		else
		{
			chk = 1;
		}
		return chk;
	}
	public Board3Dto update(HttpServletRequest request) throws Exception
	{
		String id = request.getParameter("id");
		String sql = "select * from board2 where id="+id;
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		Board3Dto dto = new Board3Dto();
		dto.setId(rs.getInt("id"));
		dto.setName(rs.getString("name"));
		dto.setTitle(rs.getString("title"));
		dto.setContent(rs.getString("content"));
		dto.setPwd(rs.getString("pwd"));
		dto.setReadnum(rs.getInt("readnum"));
		dto.setWriteday(rs.getString("writeday"));
		return dto;
	}
	public int update_ok(HttpServletRequest request) throws Exception
	{
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String sql2 = "select pwd from board2 where id="+id;
		Statement stmt2 = conn.createStatement();
		ResultSet rs = stmt2.executeQuery(sql2);
		rs.next();
		int chk=0;
		if (pwd.equals(rs.getString("pwd")))
		{
			String sql = "update board2 set name=?, title=?, content=? where id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, id);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}
		else
		{
			chk = 1;
		}
		return chk;
	}
}
