<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!-- 검색폼 + 글 쓰기 버튼 시작 -->
<div class="clearfix">
    <!-- 검색 폼 -->
    <div class="pull-left">
		<form method="get" action="${pageContext.request.contextPath}/bbs/document_list.do" style="width: 200px">
			<input type="hidden" name="category" value="${category}" />
			<div class="input-group">
				<input type="text" name="keyword" class="form-control" 
					placeholder="제목,내용 검색"  value="${keyword}"/>
				<span class="input-group-btn">
					<button class="btn btn-success" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</span>
			</div>
		</form>
	</div>
	    
    <!-- 글 쓰기 버튼 -->
    <div class="pull-right">
        <a href="${pageContext.request.contextPath}/bbs/document_write.do?category=${category}" class="btn btn-primary">
        	<i class="glyphicon glyphicon-pencil"></i>
        </a>
	</div>
</div>
<!--// 검색폼 + 글 쓰기 버튼 끝 -->


	
	
	