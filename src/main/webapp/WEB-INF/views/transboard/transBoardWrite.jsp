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
</style>
</head>
<body>
	<%@ include file="../default/header.jsp" %>
		<div id="writeForm">
			<form action="transWriteSave" method="post" enctype="multipart/form-data">
				<select name="category">
					<option value="공지">공지</option>
					<option value="자유">자유</option>
				</select>
				제목 : <input type="text" name="title">
				작성자 :<input type="text" readonly name="id" value="${genId }"><br>
				<textarea rows="25" cols="80" name="content" id="content"></textarea><br>
				<input type="submit" value="전송"><br>
			</form>
		</div>
	<%@ include file="../default/footer.jsp" %>
</body>

</html>