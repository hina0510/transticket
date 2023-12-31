<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/calendar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/modify_calendar.js"></script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	<div class="con01">
		<div class="con02">
			<div class="board_wrap">
        		<div class="board_title">
        			<strong>뮤지컬 게시글 수정</strong>
		        </div>
		    </div>
			<div class="con05">
				<form action="modify_musical?writeNo=${mdto.writeNo}"  method="post" enctype="multipart/form-data">
					<table>
						<tr>
							<td>
								<b>제목 : </b>
							</td>
							<td><input type="text" name="title" value="${mdto.title }"></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>공연 타입 : </b>
							</td>
							<td><input type="text" name="type" readonly value="musical"></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>작성자 : </b>
							</td>
							<td><input type="text" name="comname" readonly value="${mdto.comname}"></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>공연 일시 : </b>
							</td>
							<td>
								<div class="calendar-wrap">
								    <div class="calendar-middle-wrap">
								      <div class="cal_nav">
								        <a href="javascript:;" class="nav-btn go-prev"></a>
								        <span class="year-month start-year-month"></span>
								        <a href="javascript:;" class="nav-btn go-next"></a>
								      </div>
								      <div class="cal_wrap">
								        <div class="days">
								          <div class="day">일</div>
								          <div class="day">월</div>
								          <div class="day">화</div>
								          <div class="day">수</div>
								          <div class="day">목</div>
								          <div class="day">금</div>
								          <div class="day">토</div>
								        </div>
								        <div class="dates start-calendar"></div>
								      </div>
								    </div>
								
								    <div class="calendar-middle-wrap" style="display:none">
								      <div class="cal_nav">
								        <a href="javascript:;" class="nav-btn go-prev"></a>
								        <span class="year-month last-year-month"></span>
								        <a href="javascript:;" class="nav-btn go-next"></a>
								      </div>
								      <div class="cal_wrap">
								        <div class="days">
								          <div class="day">일</div>
								          <div class="day">월</div>
								          <div class="day">화</div>
								          <div class="day">수</div>
								          <div class="day">목</div>
								          <div class="day">금</div>
								          <div class="day">토</div>
								        </div>
								        <div class="dates last-calendar"></div>
								      </div>
								    </div>
								
								    <div class="checkInOutInfo" style="display:none">
								    	<div>
									        <p>
									          <input type="text" id="check_in_day" name="startDate" value="${mdto.mu_stDate}">
									        </p>
									        <p class="space">~</p>
									        <p>
									          <input type="text" id="check_out_day" name="endDate" value="${mdto.mu_endDate}">
									        </p>
									    </div>
								    </div>
								</div>
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>공연장 : </b>
							</td>
							<td>
								<input type="text" readonly id="addr1" placeholder="우편번호">
								<button class="custom-btn btn-3" type="button" onclick="daumPost()"><span>위치 찾기</span></button><br>
								<input type="text" readonly id="addr2" name="con_place" placeholder="주소" value="${fn:split(mdto.mu_place, '/')[0]}"><br>
							    <input type="text" id="addr3" name="con_place" placeholder="상세주소" value="${fn:split(mdto.mu_place, '/')[1]}"><br>
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>가격 : </b>
							</td>
							<td>
								<input type="number" name="price" min="0" max="1000000" value="${mdto.price}">
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td colspan="2"><textarea rows="25" cols="80" name="content" id="content">${mdto.content}</textarea></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td colspan="2">
								<table style="margin: auto">
									<tr>
										<td>
											<c:choose>
						                		<c:when test="${mdto.imageName1 != 'nan' }">
						                			<input type="file" id="img1" name="imageName1"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img1Pre', 'image1')">
									    			<label for="img1">
						                				<img src="download?file=${mdto.imageName1 }" id="img1Pre" onclick="" width="100" height="100" alt="없음">
						                				<input type="hidden" name="image1" id="image1" value="${mdto.imageName1 }">
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
						                		<c:when test="${mdto.imageName2 != 'nan' }">
						                			<input type="file" id="img2" name="imageName2"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img2Pre', 'image2')">
									    			<label for="img2">
						                				<img src="download?file=${mdto.imageName2 }" id="img2Pre" onclick="" width="100" height="100" alt="없음">
						                				<input type="hidden" name="image2" id="image2" value="${mdto.imageName2 }">
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
							               		<c:when test="${mdto.imageName3 != 'nan' }">
							               			<input type="file" id="img3" name="imageName3"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img3Pre', 'image3')">
									    			<label for="img3">
							               				<img src="download?file=${mdto.imageName3 }" id="img3Pre" onclick="" width="100" height="100" alt="없음">
							               				<input type="hidden" name="image3" id="image3" value="${mdto.imageName3 }">
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
							               		<c:when test="${mdto.imageName4 != 'nan' }">
							               			<input type="file" id="img4" name="imageName4"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img4Pre', 'image4')">
									    			<label for="img4">
							               				<img src="download?file=${mdto.imageName4 }" id="img4Pre" onclick="" width="100" height="100" alt="없음">
							               				<input type="hidden" name="image4" id="image4" value="${mdto.imageName4 }">
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
							               		<c:when test="${mdto.imageName5 != 'nan' }">
							               			<input type="file" id="img5" name="imageName5"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img5Pre', 'image5')">
									    			<label for="img5">
							               				<img src="download?file=${mdto.imageName5 }" id="img5Pre" onclick="" width="100" height="100" alt="없음">
							               				<input type="hidden" name="image5" id="image5" value="${mdto.imageName5 }">
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
											<button class="custom-btn btn-3" type="button" onclick="deleteImage('img1Pre', 'image1')"><span>삭제</span></button>
										</td>
										
										<td>
											<button class="custom-btn btn-3" type="button" onclick="deleteImage('img2Pre', 'image2')"><span>삭제</span></button>
										</td>
										
										<td>
											<button class="custom-btn btn-3" type="button" onclick="deleteImage('img3Pre', 'image3')"><span>삭제</span></button>
										</td>
										
										<td>
											<button class="custom-btn btn-3" type="button" onclick="deleteImage('img4Pre', 'image4')"><span>삭제</span></button>
										</td>
										
										<td>
											<button class="custom-btn btn-3" type="button" onclick="deleteImage('img5Pre', 'image5')"><span>삭제</span></button>
										</td>
									</tr>					
								</table>
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td colspan="2">
								<div class="container">
								  <ul class="tabs">
								    <label for="form1"><li class="tab-link current" data-tab="tab-1"><input type="radio" name="form" id="form1" value="form1"> form01</li></label>
								    <label for="form2"><li class="tab-link" data-tab="tab-2"><input type="radio" name="form" id="form2" value="form2"> form02</li></label>
								    <label for="form3"><li class="tab-link" data-tab="tab-3"><input type="radio" name="form" id="form3" value="form3"> form03</li></label>
								  </ul>
								
								  <div id="tab-1" class="tab-content current"><%@ include file="write_musical_form01.jsp" %></div>
								  <div id="tab-2" class="tab-content"><%@ include file="write_musical_form02.jsp" %></div>
								  <div id="tab-3" class="tab-content"><%@ include file="write_musical_form03.jsp" %></div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="container">
									<button class="custom-btn btn-3" type="submit"><span>전송</span></button>
								</div>
							</td>
						</tr>
					</table>
				</form>
				<div class="container">
					<button class="custom-btn btn-3" onclick="location.href='musical_board'"><span>목록</span></button>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>