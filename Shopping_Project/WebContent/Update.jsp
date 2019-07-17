<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>

<%  String product_id = request.getParameter("p_id");
	String product_name = request.getParameter("name");
	String price = request.getParameter("price");
	String stock = request.getParameter("stock");
	
	Connection conn = null;
	Statement stmt = null;
	
	try{ Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall?useSSL=false","manager", "hamee");
		 
		 if(conn==null) throw new Exception("DB연결 실패");
		 
		 stmt = conn.createStatement();
		 stmt.executeUpdate("update product_info set product_id='"+product_id+"', product_name='"+product_name+"', price='"+price+"', stock='"+stock+"';");
	} finally {
		try { stmt.close(); } catch(Exception ignored) {}
		try { conn.close(); } catch(Exception ignored) {}
		response.sendRedirect("UpdaterResult.jsp?p_id="+product_id);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>