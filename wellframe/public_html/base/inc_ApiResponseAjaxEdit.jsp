<%@ include file="/template/includes.jsp" %>
<form action="base/ajax-save-apiResponse.do" name="apiResponse" method="post">
    <input type="hidden" name="id" value="<zl:write name="apiResponse" property="apiResponseKey" />" />
    <input type="hidden" name="_fieldName" value="<zl:write name="_fieldName" />" />
    <c:choose>
        <c:when test="${_fieldName == 'response'}">
            <input type="text" id="response" name="response" value="<zl:write name="apiResponse" property="response" />"  size="30" />
            <input type="button" onclick="reloadSectionWithForm('ajax_apiResponse_<zl:write name="apiResponse" property="apiResponseKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
        <c:when test="${_fieldName == 'integerValue'}">
            <input type="text" name="integerValue" value="<zl:write name="apiResponse" property="integerValue" format="MM/dd/yyyy hh:mm aa" />"  size="30" />
            <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['apiResponse'].elements['integerValue'], 'images/')"><IMG SRC="images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
            <input type="button" onclick="reloadSectionWithForm('ajax_apiResponse_<zl:write name="apiResponse" property="apiResponseKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>

    </c:choose>
    <logic:present name="ajaxErrorMessage"><span style="color: red"><bean:write name="ajaxErrorMessage" /></span>
    </logic:present>
</form>
