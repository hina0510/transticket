<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style01.css">
<script type="text/javascript">
	function contentView(){
		href="musical_content"//musical_content?writeNo=${dto.writeNo }
	}
</script>
</head>
<body>
	<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>뮤지컬</strong>
		        </div>
		    </div>
			<div class="container">
				<c:choose>
					<c:when test="${list.size()==0}">
						작성된 글이 없습니다
					</c:when>
					<c:otherwise>
						<c:set var="mdto" value="${list}" />
						<c:forEach var="i" begin="0" end="${list.size()-1}">
							<c:if test="${i%3==0}">
								<div class="row">
							</c:if>
							<div class="col-4">
								<div class="card">
						            <a href="musical_content?writeNo=${mdto[i].writeNo }">
						            	<img src="download?file=${mdto[i].imageName1 }" class="card-img-top" alt="card">
						            </a>
						            <div class="card-body">
						              <a href="musical_content?writeNo=${mdto[i].writeNo }">
						              	<dt class="card-title">${mdto[i].title}</dt>
						              </a>
						              <dd>${mdto[i].mu_place}</dd>
						              <dd>${mdto[i].mu_stDate} ~ ${mdto[i].mu_endDate}</dd>
						            </div>
								</div>
					        </div>
					        <c:if test="${i%3==2}">
					    </div>
						<div style="height: 20px;"></div>    	
					        </c:if>
					        <c:if test="${i==list.size()-1}">
					    </div>   	
					        </c:if>
					    </c:forEach>
					</c:otherwise>
				</c:choose>
				<div class="container">
					<br>
					<button class="custom-btn6" onclick="">&lt;</button>
					<c:forEach var="n" begin="1" end="${repeat }">
						<button class="custom-btn6" onclick="location.href='concert_board?num=${n }'">${n }</button>
					</c:forEach>
					<button class="custom-btn6" onclick="">&gt;</button>
					<br><br>
					<c:if test="${clogin!=null}">	
						<button class="custom-btn btn-3" onclick="location.href='write_musical_form'"><span>글 작성</span></button>
					</c:if>
				</div>
				<br><br>
			</div>
		</div>
	</div>
	
<%@ include file="../../default/footer.jsp" %>
</body>
</html>