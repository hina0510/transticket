<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	write_exhibition_form
	<div class="con01">
		<div class="con02">
			<div class="con03">
				<form action="write_exhibition_save" method="post" enctype="multipart/form-data">
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
								<b>공연 타입 : </b>
							</td>
							<td><input type="text" name="type" readonly value="exhibition"></td>
						</tr>
						<tr style="height: 10px;">
						<tr>
							<td>
								<b>작성자 : </b>
							</td>
							<td><input type="text" name="comname" readonly value="${clogin}"></td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>공연 일시 : </b>
							</td>
							<td>
								<input type="date" id="firstDate">
								<div id="betweenDate">~</div>
           						<input type="date" id="secondDate">
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>공연장 : </b>
							</td>
							<td>
								<input type="text" readonly id = "addr1" placeholder="우편번호">
								<button type="button" onclick="daumPost()">위치 찾기</button><br>
							    <input type="text" readonly id = "addr2" name="con_place" placeholder="주소"><br>
							    <input type="text" id="addr3" name="con_place" placeholder="상세주소"><br>
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>내용 : </b>
							</td>
							<td><textarea cols="80" rows="5" name="content"></textarea></td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>사진 : </b>
							</td>
							<td>
								<div class="imgs">
									<div class="img01"><input type="file" name="file_name" onchange="readURL(this)"></div>
									<div class="img02"><img id="preview" width="100" height="100" alt="선택없음"></div>
								</div>
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td colspan="2">
								<div class="frame">
									<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<div class="frame">
					<button class="custom-btn btn-3" onclick="location.href='exhibition_board'"><span>목록</span></button>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/resources/js/writeFormScript.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>