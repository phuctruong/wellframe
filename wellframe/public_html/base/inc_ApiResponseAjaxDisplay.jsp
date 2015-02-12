<%@ include file="/template/includes.jsp" %>
<c:if test="${empty _hideAjaxDiv}"><div id="ajax_apiResponse_<zl:write name="apiResponse" property="apiResponseKey" />_<zl:write name="_fieldName" />"></c:if>
<span onclick="$('#ajax_apiResponse_<zl:write name="apiResponse" property="apiResponseKey" />_<zl:write name="_fieldName" />').load('base/ajax-edit-apiResponse.do?id=<zl:write name="apiResponse" property="apiResponseKey" />&_fieldName=<zl:write name="_fieldName" />')">
<c:choose>
    <c:when test="${_fieldName == 'apiResponseKey'}"><zl:write name="apiResponse" property="apiResponseKey" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'apiRequestKey'}"><zl:write name="apiResponse" property="apiRequestKey" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'response'}"><zl:write name="apiResponse" property="response" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'lastUpdated'}"><zl:write name="apiResponse" property="lastUpdated" format="MM/dd/yyyy K:mm a" ifNull="-" /></c:when>
    <c:when test="${_fieldName == 'dateCreated'}"><zl:write name="apiResponse" property="dateCreated" format="MM/dd/yyyy hh:mm aa" ifNull="-" /></c:when>
</c:choose>
</span>
<c:if test="${empty _hideAjaxDiv}"></div></c:if>
