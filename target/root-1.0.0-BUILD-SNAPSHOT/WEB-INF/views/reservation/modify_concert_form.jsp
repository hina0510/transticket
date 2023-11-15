<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
</head>
<body>
<%@ include file="../default/header.jsp" %>
	modify_concert_form
	<div class="con01">
		<div class="con02">
			<form action="modify_concert_Save">
				<table>
					<tr>
						<th>
							제목 : 
						</th>
						<td><textarea cols="50" rows="1" name="title"></textarea></td>
					</tr>
					<tr>
						<th>
							작성자 : 
						</th>
						<td><textarea cols="50" rows="1" readonly name="name"></textarea></td>
					</tr>
					<tr>
						<th>
							내용 : 
						</th>
						<td><textarea cols="50" rows="5" name="title"></textarea></td>
					</tr>
					<tr>
						<th>
							파일 : 
						</th>
						<td><input type="file" name="file"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="container">
							  <ul class="tabs">
							    <li class="tab-link current" data-tab="tab-1" name="tab1">tab1</li>
							    <li class="tab-link" data-tab="tab-2" name="tab2">tab2</li>
							    <li class="tab-link" data-tab="tab-3" name="tab3">tab3</li>
							  </ul>
							
							  <div id="tab-1" class="tab-content current"><%@ include file="write_concert_form01.jsp" %></div>
							  <div id="tab-2" class="tab-content"><%@ include file="write_concert_form02.jsp" %></div>
							  <div id="tab-3" class="tab-content"><%@ include file="write_concert_form03.jsp" %></div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<input type="submit" value="전송">
							<button type="button" onclick="location.href='concert_board'">목록</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
<%@ include file="../default/footer.jsp" %>
</body>
</html>