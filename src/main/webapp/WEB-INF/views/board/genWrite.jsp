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
				<input type="file" name="imageFiles" id="imageFiles"  accept="image/*"  multiple onchange="previewImages()">
				<div class="image-preview" id="imagePreview"></div><br>
				<input type="submit" value="전송"><br>
			</form>
		</div>
	<%@ include file="../default/footer.jsp" %>
</body>

</html>