<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:set var="result" value="${ requestScope.result }" />
<c:out value="${ result }"/> --%>
<c:if test="${ result }">exist</c:if>
<c:if test="${ not result }">nonExist</c:if>