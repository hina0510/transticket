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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/calendar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/modify_calendar.js"></script>
</head>
<body>
<%@ include file="../../default/header.jsp" %>
	modify_exhibition_form
	<div class="con01">
		<div class="con02">
			<div class="con03">
				<form action="write_concert_Save">
					<table>
						<tr>
							<td>
								<b>제목 : </b>
							</td>
							<td><input type="text" name="title" value="${edto.title }"></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>공연 타입 : </b>
							</td>
							<td><input type="text" name="type" readonly value="exhibition"></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>작성자 : </b>
							</td>
							<td><input type="text" name="comname" readonly value="${edto.comname}"></td>
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
									          <input type="text" id="check_in_day" name="startDate" value="${cdto.con_stDate}">
									        </p>
									        <p class="space">~</p>
									        <p>
									          <input type="text" id="check_out_day" name="endDate" value="${cdto.con_endDate}">
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
								<input type="text" readonly id = "addr1" placeholder="우편번호">
								<button type="button" onclick="daumPost()">위치 찾기</button><br>
							    <input type="text" readonly id = "addr2" name="con_place" placeholder="주소"><br>
							    <input type="text" id="addr3" name="con_place" placeholder="상세주소"><br>
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td>
								<b>가격 : </b>
							</td>
							<td>
								<input type="number" name="price" min="0" max="1000000">
							</td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td colspan="2"><textarea rows="25" cols="80" name="content" id="content">${edto.content}</textarea></td>
						</tr>
						<tr style="height: 20px;">
						</tr>
						<tr>
							<td colspan="2">
								<table style="margin: auto">
									<tr>
										<td>
											<c:choose>
						                		<c:when test="${edto.imageName1 != 'nan' }">
						                			<input type="file" id="img1" name="imageName1"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img1Pre', 'image1')">
									    			<label for="img1">
						                				<img src="imgView?name=${edto.imageName1 }" id="img1Pre" onclick="" width="100" height="100" alt="없음">
						                				<input type="hidden" name="image1" id="image1" value="${edto.imageName1 }">
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
						                		<c:when test="${edto.imageName2 != 'nan' }">
						                			<input type="file" id="img2" name="imageName2"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img2Pre', 'image2')">
									    			<label for="img2">
						                				<img src="imgView?name=${edto.imageName2 }" id="img2Pre" onclick="" width="100" height="100" alt="없음">
						                				<input type="hidden" name="image2" id="image2" value="${edto.imageName2 }">
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
							               		<c:when test="${edto.imageName3 != 'nan' }">
							               			<input type="file" id="img3" name="imageName3"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img3Pre', 'image3')">
									    			<label for="img3">
							               				<img src="imgView?name=${edto.imageName3 }" id="img3Pre" onclick="" width="100" height="100" alt="없음">
							               				<input type="hidden" name="image3" id="image3" value="${edto.imageName3 }">
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
							               		<c:when test="${edto.imageName4 != 'nan' }">
							               			<input type="file" id="img4" name="imageName4"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img4Pre', 'image4')">
									    			<label for="img4">
							               				<img src="imgView?name=${edto.imageName4 }" id="img4Pre" onclick="" width="100" height="100" alt="없음">
							               				<input type="hidden" name="image4" id="image4" value="${edto.imageName4 }">
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
							               		<c:when test="${edto.imageName5 != 'nan' }">
							               			<input type="file" id="img5" name="imageName5"  style="display: none;" accept="image/*" onchange="imgChg(this, 'img5Pre', 'image5')">
									    			<label for="img5">
							               				<img src="imgView?name=${edto.imageName5 }" id="img5Pre" onclick="" width="100" height="100" alt="없음">
							               				<input type="hidden" name="image5" id="image5" value="${edto.imageName5 }">
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
									<button class="custom-btn btn-3" onclick="location.href='concert_board'"><span>목록</span></button>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
<%@ include file="../../default/footer.jsp" %>
</body>
</html>