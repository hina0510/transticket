<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	if(localStorage.getItem('seatList')){
		var data = localStorage.getItem('seatList');//�¼� ����Ʈ ���
		document.getElementById("data").innerHTML=data;
	}
</script>
</head>
<body>
	<div id="data"></div>
</body>
</html>