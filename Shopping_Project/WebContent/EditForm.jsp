<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h4>상품 정보를 수정하신 뒤 수정 버튼을 눌러주세요.</h4>
	
	<form action=Update.jsp method=post>
		상품 ID : <input type="text" name=p_id size=8 value='${P_ID}' READONLY=TRUE><br>
		상 품 명   : <input type="text" name=name size=20 value='${NAME}'><br>
		단     가   : <input type="text" name=price size=10 value='${PRICE}'><br>
		재     고   : <input type="text" name=stock size=10 value='${STOCK}'><br>
		<input type = "submit" value='수정'>
	</form>
</body>
</html>