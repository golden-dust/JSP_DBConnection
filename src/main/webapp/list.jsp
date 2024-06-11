<%@ page import="com.goldendust.dto.MemberDto"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List Page</title>
</head>
<body>
	<h2>list of all members</h2>
	<hr>
	<%
		String sql = "SELECT * FROM member_tbl";
	
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/member_db";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;  // select문 실행시 DB에서 반환되는 데이터를 받아주는 객체
		
		try {
			Class.forName(driverName);  // jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);  // DB 연동 커넥션 생성
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			// DB에서 보내주는 select문의 실행결과 데이터를 ResultSet 클래스로 만든 rs 객체로 받아줌
			
			List<MemberDto> members = new ArrayList<>();
			
			while(rs.next()) {
				int mnum = rs.getInt("member_num");
				String mname = rs.getString("member_name");
				String memail = rs.getString("member_email");
				String mdate = rs.getString("member_signuptime");
				
				// MemberDto memberDto = new MemberDto(mnum, mname, memail, mdate);
				MemberDto memberDto = new MemberDto();
				memberDto.setMember_num(mnum);
				memberDto.setMember_name(mname);
				memberDto.setMember_email(memail);
				memberDto.setMember_signuptime(mdate);
				
				members.add(memberDto);
				
				for (int i=0; i < members.size(); i++) {
					out.println(members.get(i).getMember_num() + " / ");
					out.println(members.get(i).getMember_name() + " / ");
					out.println(members.get(i).getMember_email() + " / ");
					out.println(members.get(i).getMember_signuptime() + "<br>");


				}
			}
			
		} catch (Exception e) {
			out.println("DB connection Error!");
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>