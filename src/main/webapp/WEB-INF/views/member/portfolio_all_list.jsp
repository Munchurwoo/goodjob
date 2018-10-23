<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("input[name='recruitCatNumList']")
								.change(
										function() {
											$("#empTypeArea").html('');
											var dataString = '';
											$
													.ajax({
														type : "get",
														url : "user-DevCatVOListAjax.do",
														dataType : "json",
														data : $(
																"#portfolioSearchList")
																.serialize(),
														success : function(
																catList) {
															var catListString = '';
															for (var i = 0; i < catList.length; i++) {
																for (var j = 0; j < catList[i].length; j++) {
																	catListString += '<input type="checkbox" class = "recruit" id="devCatNumList" name="devCatNumList" value="'+catList[i][j].devCatNum+'">'
																			+ catList[i][j].devCatName
																			+ '&nbsp;';
																}
																catListString += '<br>';
															}
															$("#empTypeArea")
																	.html(
																			$(
																					"#empTypeArea")
																					.html()
																					+ catListString);
														}//success					
													});//ajax 			
										});//change

						$("#SearchBtn").click(
								function() {
									$("input[name=locCatNumList]:checked")
											.each(function() {
												var test = $(this).val();
												console.log(test);
											});
									$("input[name=acaCatNumList]:checked")
											.each(function() {
												var test = $(this).val();
												console.log(test);
											});
									$("input[name=empTypeCatNumList]:checked")
											.each(function() {
												var test = $(this).val();
												console.log(test);
											});
									$("input[name=recruitCatNumList]:checked")
											.each(function() {
												var test = $(this).val();
												console.log(test);
											});
									$("input[name=devCatNumList]:checked")
											.each(function() {
												var test = $(this).val();
												console.log(test);
											});
									$("#portfolioSearchList").submit();
								});

					});
	//ready
</script>

<div class="cta-text">
	<h2>
		<span>인재 상세</span> 검색하기
	</h2>
</div>
<div class="container"
	style="padding-left: 120px; padding-right: 120px;">
	<form action="user-portfolioSearchList.do" method="get"
		id="portfolioSearchList">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">지역</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.locCatList}" var="locCat"
					varStatus="i">
					<input type="checkbox" id="locCatNumList" name="locCatNumList"
						value="${locCat.locNum}">${locCat.locName}&nbsp;
				</c:forEach>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">학력</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.acaCatList}" var="acaCat"
					varStatus="i">
					<input type="checkbox" id="acaCatNumList" name="acaCatNumList"
						value="${acaCat.academicNum}" required="required">${acaCat.academicName}&nbsp;
	</c:forEach>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">고용 형태</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.empTypeCatList}" var="empTypeCat"
					varStatus="i">
					<input type="checkbox" name="empTypeCatNumList"
						id="empTypeCatNumList" value="${empTypeCat.empTypeNum}">${empTypeCat.empTypeName}&nbsp;
	</c:forEach>
			</div>
		</div>

		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">모집 직군</h3>
			</div>
			<div class="panel-body">
				<c:forEach items="${requestScope.recruitCatList}" var="recruitCat"
					varStatus="i">
					<input type="checkbox" class="recruit" name="recruitCatNumList"
						id="recruitCatNumList" value="${recruitCat.rcNum}">${recruitCat.rcName}  &thinsp;&thinsp;
			<c:if test="${(i.index+1)%3==0}">
						<br>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">개발 분야</h3>
			</div>
			<div class="panel-body">
				<input type="hidden" name="a" value="b">
				<div id="empTypeArea"></div>

			</div>
		</div>


	</form>

	<span id="enter"></span>
	<div class="cta-text">
		<button type="reset" class="btn btn-default">초기화</button>

		<button type="submit" id="SearchBtn" class="btn btn-default">상세
			검색</button>
		<button type="reset" onclick="location.href='home.do'"
			class="btn btn-default">홈으로</button>
	</div>
</div>

<hr>
<!-- 검색 리스트 -->
<h4 class="heading">
	<div class="cta-text">
		<h2>
			<span>GoodJob</span> 인재 정보
		</h2>
	</div>
</h4>


<c:forEach items="${list}" var="list" varStatus="status">
	<div class="media">
		<a class="pull-left" href="#"> <img class="media-object"
			src="${pageContext.request.contextPath}/
									resources/upload/memberPicture/${povo[status.index].picturePath}"
			width="130px" height="130px">
		</a>
		<div class="media-body">
			<h4 class="media-heading">${list.name}</h4>
			<h5>${povo[status.index].title}</h5>
			<h6>${povo[status.index].content}</h6>
			<!-- Nested media object -->
			<div class="media">
				<a
					href="user-normalDetailPortfolioList.do?normalId=${list.normalId }">
					개발분야 : ${devCatList[status.index].devCatName} -> 인재상세 보기 </a>
			</div>
		</div>
	</div>
	<hr>
</c:forEach>


