<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		  
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');

		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');

		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })

		})
</script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	modify_concert_form
	<div class="con01">
		<div class="con02">
			<div class="con03">
				<form action="write_concert_Save">
					<table>
						<tr>
							<td>
								<b>제목 : </b>
							</td>
							<td><textarea cols="80" rows="1" name="title"></textarea></td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>작성자 : </b>
							</td>
							<td><textarea cols="80" rows="1" readonly name="name"></textarea></td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>내용 : </b>
							</td>
							<td><textarea cols="80" rows="5" name="title"></textarea></td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>파일 : </b>
							</td>
							<td><input type="file" name="file"></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td colspan="2">
								<div class="container">
								  <ul class="tabs">
								    <label for="tab1"><li class="tab-link current" data-tab="tab-1"><input type="radio" name="tab" id="tab1"> tab1</li></label>
								    <label for="tab2"><li class="tab-link" data-tab="tab-2"><input type="radio" name="tab" id="tab2"> tab2</li></label>
								    <label for="tab3"><li class="tab-link" data-tab="tab-3"><input type="radio" name="tab" id="tab3"> tab3</li></label>
								  </ul>
								
								  <div id="tab-1" class="tab-content current"><%@ include file="write_concert_form01.jsp" %></div>
								  <div id="tab-2" class="tab-content"><%@ include file="write_concert_form02.jsp" %></div>
								  <div id="tab-3" class="tab-content"><%@ include file="write_concert_form03.jsp" %></div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="frame">
									<button class="custom-btn btn-3" type="submit" onclick="location.href='concert_board'"><span>전송</span></button>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<div class="frame">
					<button class="custom-btn btn-3" onclick="location.href='concert_board'"><span>목록</span></button>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>