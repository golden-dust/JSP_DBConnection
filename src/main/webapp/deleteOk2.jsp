<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Member Page</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mnum = request.getParameter("memberNum");
		
		String sql = "DELETE FROM member_tbl WHERE member_num = ?";

		String driverName = "com.mysql.jdbc.Driver";
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
			
			pstmt.setString(1, mnum);
			
			int success = pstmt.executeUpdate();  // sql문 실행 -> 1 반환되면 실행 성공
			if (success == 1) {
				out.println("Your account was deleted!");
			} else {
				out.println("We failed to delete your account");
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