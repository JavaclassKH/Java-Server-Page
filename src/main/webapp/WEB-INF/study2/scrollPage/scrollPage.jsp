<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />

<c:forEach var="vo" items="${vos}" varStatus="st">
	<div class="card">
		<div class="card-body">
			${curScrStartNo}. &nbsp;<img src="${ctp}/images/7.jpg" width="140px" />
		</div>
		<div class="card-footer">
			<h3>${vo.title}</h3>
			<div><p>${fn:substring(vo.wDate,0,11)}</p></div>
		</div>
	</div>
	<br/>
	<c:set var="curScrStartNo" value="${curScrStartNo-1}"></c:set>
	<c:if test="${curScrStartNo < 1}"><h4 class="text-center text-warning"><strong>더 이상 표시할 게시물이 없습니다</strong></h4></c:if>
</c:forEach>
