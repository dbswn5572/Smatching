<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script>
	
</script>
<!-- 메뉴바 -->
<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- 로고 영역 -->
		<div class="navbar-header" style='height=80px;'>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span>	
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<!-- //반응형 메뉴 버튼 -->
			<!-- 로고 -->
			
			<a class="navbar-brand" href="${pageContext.request.contextPath}/bbs/document_list.do?category=gallery">
				<img src="${pageContext.request.contextPath}/assets/img/main-image.png" style='width:180px; height:80px;'>
			</a>
		</div>
		<!-- //로고 영역 -->
		<!-- 메뉴 영역 -->
		<div class="navbar-collapse collapse">
			<!-- 사이트 메뉴 -->
			<ul class="nav navbar-nav" style='float:right;width:100px;height:80px;'>
				<li><a href="${pageContext.request.contextPath}/content/introduce.do">
				<img src="${pageContext.request.contextPath}/assets/img/question.png" style='width:30px; height:30px;margin-left:10px;padding-bottom:3px;'>
				</a></li>
				
			</ul>
			<!-- //사이트 메뉴 -->
			<!-- 로그인 메뉴 -->
			<c:choose>
				<c:when test="${loginInfo==null }">
					<form class="navbar-form navbar-right" method="post" 
					action="${pageContext.request.contextPath}/member/login_ok.do">
						<div class="form-group">
							<input type="text" name="user_id" placeholder="User Id" 
							class="form-control">			
						</div>
						<div class="form-group">
							<input type="password" name="user_pw" placeholder="Password" 
							class="form-control">			
						</div>
						<button type="submit" class="btn btn-success">
							<i class="glyphicon glyphicon-user"></i>
						</button>
						<a href="${pageContext.request.contextPath}/member/join.do" class="btn btn-warning">
						<i class="glyphicon glyphicon-plus"></i></a>
						<a href="${pageContext.request.contextPath}/member/find_pw.do" class="btn btn-info">
						<i class="glyphicon glyphicon-search"></i></a>
					</form>
				</c:when>
				<c:otherwise>
					<!-- 로그인 된 경우 -->
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							style="padding:5px;">
							<!-- 쿠키값에 따른 프로필 이미지 표시 -->
							<c:if test="${cookie.profileThumbnail!=null}">
								<img src="${pageContext.request.contextPath}/
								download.do?file=${cookie.profileThumbnail.value}" class="img-circle"/>
							</c:if>
							<!-- 쿠키값에 따른 프로필 이미지 표시 끝 -->
							${loginInfo.name}님 <span class="caret"></span>
							</a>
							<!-- 로그인 한 경우 표시될 메뉴 -->
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
								<li><a href="${pageContext.request.contextPath}/member/edit.do">회원정보 수정</a></li>
								<li><a href="${pageContext.request.contextPath}/member/out.do">회원탈퇴</a></li>
							</ul>
						</li>
					</ul>
					<!-- //로그인 된 경우 -->
				</c:otherwise>
			</c:choose>
		</div>
		<!-- //메뉴 영역 -->
	</div>
</div>
<!-- //메뉴바 -->