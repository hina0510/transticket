<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/toolbar.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/img_view.js"></script>
<script src="https://cdn.tiny.cloud/1/p7nrha7bnxiiydg98puzjwfijyui35ns1hd90lfpwxju9p9o/tinymce/6/tinymce.min.js" 
			referrerpolicy="origin"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/imgchg_delete.js"></script>
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
	<div class="con01">
		<div class="con02">
			<div class="con03">
			<form action="genModifySave?writeNo=${dto.writeNo }" method="post" enctype="multipart/form-data">
				<select name="category">
					<c:choose>
						<c:when test="${admin == 'admin' }">
							<option value="공지">공지</option>
							<option value="자유">자유</option>
						</c:when>
						<c:otherwise>
							<option value="자유">자유</option>
						</c:otherwise>
					</c:choose>
				</select>
				제목 : <input type="text" name="title" value = ${dto.title }>
				작성자 : <input type="text" name="id" value="${dto.id }" readonly><br><br>
				<textarea rows="25" cols="80" name="content" id="content">${dto.content }</textarea><br>
				
				<div style="text-align: center;">
					<table style="margin: auto">
						<tr>
							<td>
								<c:choose>
			                		<c:when test="${dto.imageName1 != 'nan' }">
			                			<input type="file" id="img1" name="imageName1"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img1Pre', 'image1')">
						    			<label for="img1">
			                				<img src="imgView?name=${dto.imageName1 }" id="img1Pre" onclick="" width="100" height="100" alt="없음">
			                				<input type="hidden" name="image1" id="image1" value="${dto.imageName1 }">
			                			</label>
			                		</c:when>
			                		<c:otherwise>
			                			<input type="file" id="img1" name="imageName1"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img1Pre', 'image1')">
						    			<label for="img1">
			                				<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img1Pre" width="100" height="100" alt="없음" >
			                				<input type="hidden" name="image1" id="image1" value="nan">
			                			</label>
			                		</c:otherwise>
				                </c:choose>
							</td>
							
							<td>
								<c:choose>
			                		<c:when test="${dto.imageName2 != 'nan' }">
			                			<input type="file" id="img2" name="imageName2"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img2Pre', 'image2')">
						    			<label for="img2">
			                				<img src="imgView?name=${dto.imageName2 }" id="img2Pre" onclick="" width="100" height="100" alt="없음">
			                				<input type="hidden" name="image2" id="image2" value="${dto.imageName2 }">
			                			</label>
			                		</c:when>
			                		<c:otherwise>
			                			<input type="file" id="img2" name="imageName2"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img2Pre', 'image2')">
						    			<label for="img2">
			                				<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img2Pre" width="100" height="100" alt="없음" >
			                				<input type="hidden" name="image2" id="image2" value="nan">
			                			</label>
			                		</c:otherwise>
			               		</c:choose>
							</td>
							
							<td>
								<c:choose>
				               		<c:when test="${dto.imageName3 != 'nan' }">
				               			<input type="file" id="img3" name="imageName3"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img3Pre', 'image3')">
						    			<label for="img3">
				               				<img src="imgView?name=${dto.imageName3 }" id="img3Pre" onclick="" width="100" height="100" alt="없음">
				               				<input type="hidden" name="image3" id="image3" value="${dto.imageName3 }">
				               			</label>
				               		</c:when>
				               		<c:otherwise>
				               			<input type="file" id="img3" name="imageName3"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img3Pre', 'image3')">
						    			<label for="img3">
				               				<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img3Pre" width="100" height="100" alt="없음" >
				               				<input type="hidden" name="image3" id="image3" value="nan">
				               			</label>
				               		</c:otherwise>
			                	</c:choose>
							</td>
							
							<td>
								<c:choose>
				               		<c:when test="${dto.imageName4 != 'nan' }">
				               			<input type="file" id="img4" name="imageName4"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img4Pre', 'image4')">
						    			<label for="img4">
				               				<img src="imgView?name=${dto.imageName4 }" id="img4Pre" onclick="" width="100" height="100" alt="없음">
				               				<input type="hidden" name="image4" id="image4" value="${dto.imageName4 }">
				               			</label>
				               		</c:when>
				               		<c:otherwise>
				               			<input type="file" id="img4" name="imageName4"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img4Pre', 'image4')">
						    			<label for="img4">
				               				<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img4Pre" width="100" height="100" alt="없음" >
				               				<input type="hidden" name="image4" id="image4" value="nan">
				               			</label>
				               		</c:otherwise>
			                	</c:choose>
							</td>
							
							<td>
								<c:choose>
				               		<c:when test="${dto.imageName5 != 'nan' }">
				               			<input type="file" id="img5" name="imageName5"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img5Pre', 'image5')">
						    			<label for="img5">
				               				<img src="imgView?name=${dto.imageName5 }" id="img5Pre" onclick="" width="100" height="100" alt="없음">
				               				<input type="hidden" name="image5" id="image5" value="${dto.imageName5 }">
				               			</label>
				               		</c:when>
				               		<c:otherwise>
				               			<input type="file" id="img5" name="imageName5"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img5Pre', 'image5')">
						    			<label for="img5">
				               				<img src="<%=request.getContextPath() %>/resources/images/nan.png" id="img5Pre" width="100" height="100" alt="없음" >
				               				<input type="hidden" name="image5" id="image5" value="nan">
				               			</label>
				               		</c:otherwise>
			                	</c:choose>
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
					<br>
					<button class="custom-btn btn-3" type="submit"><span>전송</span></button><br>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="../default/footer.jsp" %>
</body>
</html>