<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.do"><span>G</span>oodJob</a>
			</div>
			<div class="navbar-collapse collapse ">
				<ul class="nav navbar-nav">
					<li><a href="home.do">Home</a></li>
					<li><a href="user-getAllJobPostingList.do">채용정보</a>
					<li><a href="user-portfolioAllList.do">인재검색</a></li>
					<li><a href="user-allCompanyInfo.do">기업정보</a></li>
					<c:choose>
						<c:when test="${empty sessionScope.mvo}">
							<li><a href="user-loginForm.do">로그인</a></li>
							<li><a href="user-registerNormalMemberForm.do">회원가입</a>						
						</c:when>
						<c:otherwise>
							<li>
								<c:if test="${mvo.memberType == 1 }">
									<a href="normal_mypage.do">마이페이지</a>
								</c:if>
								<c:if test="${mvo.memberType == 3 }">
									<a href="company_mypage.do">마이페이지</a>
								</c:if>
							</li>
							<li><a href="logout.do">로그아웃</a></li>							
						</c:otherwise>
					</c:choose>					
				</ul>
			</div>
			<c:if test="${!empty sessionScope.mvo}">
				<div align="right">${mvo.name}님 환영합니다</div>
			</c:if>
		</div>
	</div>
</header>