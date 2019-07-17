<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%	String p_id = request.getParameter("p_id");
		
		if (p_id == null) {
			throw new Exception("상품 코드를 입력하세요."); }
			Connection conn = null;
			Statement stmt = null;
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingmall","manager", "hamee");
			
			if (conn==null)
				throw new Exception("DB연결 실패");
			
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from product_info where product_id = '"+p_id+"';");
			
			if(!rs.next()) throw new Exception("해당 아이디에 해당하는 물품이 없습니다."); 
			
			String name = rs.getString("product_name");
			int price = rs.getInt("price");
			int stock = rs.getInt("stock");
			
			request.setAttribute("P_ID", p_id);
			request.setAttribute("NAME", name);
			request.setAttribute("PRICE", new Integer(price));
			request.setAttribute("STOCK", new Integer(stock));
			
			} finally{
				try{
					stmt.close();
				} catch(Exception ignored){}
				try {
					conn.close();	
				} catch(Exception ignored) { }
			}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("EditForm.jsp");
		dispatcher.forward(request, response);
	%>


</body>
</html>