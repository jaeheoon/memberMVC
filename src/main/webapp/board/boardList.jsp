<%@ page contentType="application/json; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
{
    "totalNum": "${totalNum}",
    "paging": "${paging}",
    "list": [
        <c:forEach var="board" items="${list}" varStatus="status">
            {
                "seq": "${board.seq}",
                "subject": "${fn:escapeXml(board.subject)}",
                "id": "${fn:escapeXml(board.name)}",
                "hit": "${board.hit}",
                "logtime": "<fmt:formatDate value='${ board.logtime }' dateStyle='default'/>"
            }
            <c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ]
}