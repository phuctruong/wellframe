<%@ include file="/template/includes.jsp" %>
<c:if test="${empty _hideAjaxDiv}"><div id="ajax_apiRequest_<zl:write name="apiRequest" property="apiRequestKey" />_<zl:write name="_fieldName" />"></c:if>
<span onclick="$('#ajax_apiRequest_<zl:write name="apiRequest" property="apiRequestKey" />_<zl:write name="_fieldName" />').load('base/ajax-edit-apiRequest.do?id=<zl:write name="apiRequest" property="apiRequestKey" />&_fieldName=<zl:write name="_fieldName" />')">
<c:choose>
    <c:when test="${_fieldName == 'apiRequestKey'}"><zl:write name="apiRequest" property="apiRequestKey" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'version'}"><zl:write name="apiRequest" property="version" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'maxWait'}"><zl:write name="apiRequest" property="maxWait" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'request'}"><zl:write name="apiRequest" property="request" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'lastUpdated'}"><zl:write name="apiRequest" property="lastUpdated" format="MM/dd/yyyy K:mm a" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'dateCreated'}"><zl:write name="apiRequest" property="dateCreated" format="MM/dd/yyyy hh:mm aa" ifNull="-" /></c:when>
</c:choose>
</span>
<c:if test="${empty _hideAjaxDiv}"></div></c:if>
