<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../resources/js/toolbar.js"></script>
<script src="../resources/js/img_view.js"></script>
<script src="https://cdn.tiny.cloud/1/p7nrha7bnxiiydg98puzjwfijyui35ns1hd90lfpwxju9p9o/tinymce/6/tinymce.min.js" 
			referrerpolicy="origin"></script>
<script>
        document.getElementById('imageFiles').addEventListener('change', function() {
            const files = this.files;
            if (files.length > 5) {
                alert('최대 5개의 이미지만 선택할 수 있습니다.');
                this.value = ''; // 이미지 선택 취소
            }
        });
</script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	write_concert_form
	<div class="con01">
		<div class="con02">
			<div class="con03">
				<form action="write_concert_save" method="post" enctype="multipart/form-data">
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
							<td><input type="text" name="type" readonly value="concert"></td>
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
								<input type="date" name="startDate">
								<div id="betweenDate">~</div>
           						<input type="date" name="endDate">
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
							<td colspan="2"><textarea rows="25" cols="80" name="content" id="content"></textarea></td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td colspan="2">
								<input type="file" name="file_name" id="imageFiles" multiple onchange="previewImages()">
								<div class="image-preview" id="imagePreview"></div>
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr><!-- 폼 탭 -->
							<td colspan="2">
								<div class="container">
								  <ul class="tabs">
								    <label for="form1"><li class="tab-link current" data-tab="tab-1"><label><input type="radio" name="form" id="form1" value="form1"> form01</label></li>
								    <label for="form2"><li class="tab-link" data-tab="tab-2"><label><input type="radio" name="form" id="form2" value="form2"> form02</label></li>
								    <label for="form3"><li class="tab-link" data-tab="tab-3"><input type="radio" name="form" id="form3" value="form3"> form03</li></label>
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
									<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
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
	<script src="<%=request.getContextPath() %>/resources/js/writeFormScript.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>