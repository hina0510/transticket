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
<style>
        /* 중앙 정렬을 위한 CSS 스타일 */
       #writeForm {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        form {
            text-align: center;
        }
        .image-preview {
            display: flex;
            flex-wrap: wrap;
        }
        .image-preview img {
            width: 100px;
            height: 100px;
            margin: 5px;
        }
</style>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
		<div id="writeForm">
			<form action="genWriteSave" method="post" enctype="multipart/form-data">
				<select name="category">
					<option value="공지">공지</option>
					<option value="자유">자유</option>
				</select>
				제목 : <input type="text" name="title">
				작성자 : <input type="text" name="id"><br>
				<textarea rows="25" cols="80" name="content" id="content"></textarea><br>
				<div style="text-align: center;">
					<table style="margin: auto">
						<tr>
							<td>
	                			<input type="file" id="img1" name="imageName1"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img1Pre', 'image1')">
				    			<label for="img1">
	                				<img src="<%=request.getContextPath() %>/resources/images/1.png" id="img1Pre" onclick="" width="100" height="100" alt="없음">
	                				<input type="hidden" name="image1" id="image1" value="${dto.imageName1 }">
	                			</label>
							</td>
							
							<td>
	                			<input type="file" id="img2" name="imageName2"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img2Pre', 'image2')">
				    			<label for="img2">
	                				<img src="<%=request.getContextPath() %>/resources/images/2.png" id="img2Pre" onclick="" width="100" height="100" alt="없음">
	                				<input type="hidden" name="image2" id="image2" value="${dto.imageName2 }">
	                			</label>
							</td>
							
							<td>
		               			<input type="file" id="img3" name="imageName3"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img3Pre', 'image3')">
				    			<label for="img3">
		               				<img src="<%=request.getContextPath() %>/resources/images/3.png" id="img3Pre" onclick="" width="100" height="100" alt="없음">
		               				<input type="hidden" name="image3" id="image3" value="${dto.imageName3 }">
		               			</label>
							</td>
							
							<td>
		               			<input type="file" id="img4" name="imageName4"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img4Pre', 'image4')">
				    			<label for="img4">
		               				<img src="<%=request.getContextPath() %>/resources/images/4.png" id="img4Pre" onclick="" width="100" height="100" alt="없음">
		               				<input type="hidden" name="image4" id="image4" value="${dto.imageName4 }">
		               			</label>
							</td>
							
							<td>
		               			<input type="file" id="img5" name="imageName5"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img5Pre', 'image5')">
				    			<label for="img5">
		               				<img src="<%=request.getContextPath() %>/resources/images/5.png" id="img5Pre" onclick="" width="100" height="100" alt="없음">
		               				<input type="hidden" name="image5" id="image5" value="${dto.imageName5 }">
		               			</label>
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="button" onclick="deleteImage('img1Pre', 'image1')" value="삭제">
							</td>
							
							<td>
								<input type="button" onclick="deleteImage('img2Pre', 'image2')" value="삭제">
							</td>
							
							<td>
								<input type="button" onclick="deleteImage('img3Pre', 'image3')" value="삭제">
							</td>
							
							<td>
								<input type="button" onclick="deleteImage('img4Pre', 'image4')" value="삭제">
							</td>
							
							<td>
								<input type="button" onclick="deleteImage('img5Pre', 'image5')" value="삭제">
							</td>
						</tr>					
					</table>
				</div>
				<div class="image-preview" id="imagePreview"></div><br>
				<input type="submit" value="전송"><br>
			</form>
		</div>
	<%@ include file="../default/footer.jsp" %>
</body>

</html>