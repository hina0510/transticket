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
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/imgchg_delete.js"></script>
<script src="https://cdn.tiny.cloud/1/p7nrha7bnxiiydg98puzjwfijyui35ns1hd90lfpwxju9p9o/tinymce/6/tinymce.min.js" 
			referrerpolicy="origin"></script>
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
							    <input type="text" readonly id = "addr2" name="ex_place" placeholder="주소"><br>
							    <input type="text" id="addr3" name="con_place" placeholder="상세주소"><br>
							</td>
						</tr>
						<tr style="height: 10px;">
						</tr>
						<tr>
							<td>
								<b>가격 : </b>
							</td>
							<td>
								<input type="number" name="price" min="0" max="1000000">
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
								<table style="margin: auto">
									<tr>
										<td>
				                			<input type="file" id="img1" name="imgN1"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img1Pre', 'image1')">
							    			<label for="img1">
				                				<img src="<%=request.getContextPath() %>/resources/images/1.png" id="img1Pre" width="100" height="100" alt="없음">
				                				<input type="hidden" name="image1" id="image1" value="0">
				                			</label>
										</td>
										
										<td>
				                			<input type="file" id="img2" name="imgN2"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img2Pre', 'image2')">
							    			<label for="img2">
				                				<img src="<%=request.getContextPath() %>/resources/images/2.png" id="img2Pre" width="100" height="100" alt="없음">
				                				<input type="hidden" name="image2" id="image2" value="0">
				                			</label>
										</td>
										
										<td>
					               			<input type="file" id="img3" name="imgN3"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img3Pre', 'image3')">
							    			<label for="img3">
					               				<img src="<%=request.getContextPath() %>/resources/images/3.png" id="img3Pre" width="100" height="100" alt="없음">
					               				<input type="hidden" name="image3" id="image3" value="0">
					               			</label>
										</td>
										
										<td>
					               			<input type="file" id="img4" name="imgN4"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img4Pre', 'image4')">
							    			<label for="img4">
					               				<img src="<%=request.getContextPath() %>/resources/images/4.png" id="img4Pre" width="100" height="100" alt="없음">
					               				<input type="hidden" name="image4" id="image4" value="0">
					               			</label>
										</td>
										
										<td>
					               			<input type="file" id="img5" name="imgN5"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img5Pre', 'image5')">
							    			<label for="img5">
					               				<img src="<%=request.getContextPath() %>/resources/images/5.png" id="img5Pre" width="100" height="100" alt="없음">
					               				<input type="hidden" name="image5" id="image5" value="0">
					               			</label>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr><!-- 폼 -->
							<td colspan="2">
								<input type="hidden" name="form" value="form1">
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
					<button class="custom-btn btn-3" onclick="location.href='exhibition_board'"><span>목록</span></button>
				</div>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath() %>/resources/js/writeFormScript.js"></script>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>