<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ sessionScope.memberDTO.name != null }" >${ sessionScope.memberDTO.name }</c:if>
<c:if test="${ sessionScope.memberDTO.name == null }" >fail</c:if>