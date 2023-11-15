<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<style type="text/css">
      img {width: 100%; height: 300px;}
      section {margin: 0% 20% ;padding: 1%;}
      .button{background: skyblue; text-align: right; width: 100%; font-size: small; }
      .board {font-family: 'omyu_pretty';}
      @font-face {
      font-family: 'omyu_pretty';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
      font-weight: normal;
      font-style: normal;
  }
</style>

</head>
<body>
<%@ include file="./default/header.jsp" %>
	<section>
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="images/01서울.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/02대구.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/03오사카.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/04중국.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/05영국.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/06이탈리아.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/07스위스.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
          <img src="images/08캐나다.jpg" class="d-block w-100" alt="...">
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </section>
<%@ include file="./default/footer.jsp" %>
</body>
</html>