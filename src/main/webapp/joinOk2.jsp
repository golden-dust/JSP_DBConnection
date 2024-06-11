<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign up validation</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mname = request.getParameter("memberName");
		String memail = request.getParameter("memberEmail");
		
		//String sql = "INSERT member_tbl(member_name, member_email) VALUES('"+mname+"', '"+memail+"')";
		String sql = "INSERT member_tbl(member_name, member_email) VALUES(?, ?)";
		
		String driverName = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/member_db";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driverName);  // jdbc 드라이버 불러오기
			conn = DriverManager.getConnection(url, username, password);  // DB 연동 커넥션 생성
			//stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mname);
			pstmt.setString(2, memail);
			
			int success = pstmt.executeUpdate();  // sql문 실행 -> 1 반환되면 실행 성공
			if (success == 1) {
				out.println(mname + ", your sign up process completed!");
			} else {
				out.println("Sign up failed");
			}
		} catch (Exception e) {
			out.println("DB connection Error!");
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
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