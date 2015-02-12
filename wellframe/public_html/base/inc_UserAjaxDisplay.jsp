<%@ include file="/template/includes.jsp" %>
<c:if test="${empty _hideAjaxDiv}"><div id="ajax_user_<zl:write name="user" property="userKey" />_<zl:write name="_fieldName" />"></c:if>
<span onclick="$('#ajax_user_<zl:write name="user" property="userKey" />_<zl:write name="_fieldName" />').load('base/ajax-edit-user.do?id=<zl:write name="user" property="userKey" />&_fieldName=<zl:write name="_fieldName" />')">
<c:choose>
    <c:when test="${_fieldName == 'userKey'}"><zl:write name="user" property="userKey" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'username'}"><zl:write name="user" property="username" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'password'}"><zl:write name="user" property="password" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'dateCreated'}"><zl:write name="user" property="dateCreated" format="MM/dd/yyyy K:mm a" ifNull="-" /></c:when>
</c:choose>
</span>
<c:if test="${empty _hideAjaxDiv}"></div></c:if>
