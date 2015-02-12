<%@ include file="/template/includes.jsp" %>
<form action="base/ajax-save-apiRequest.do" name="apiRequest" method="post">
    <input type="hidden" name="id" value="<zl:write name="apiRequest" property="apiRequestKey" />" />
    <input type="hidden" name="_fieldName" value="<zl:write name="_fieldName" />" />
    <c:choose>
        <c:when test="${_fieldName == 'version'}">
            <input type="text" id="version" name="version" value="<zl:write name="apiRequest" property="version" />"  size="30" />
            <input type="button" onclick="reloadSectionWithForm('ajax_apiRequest_<zl:write name="apiRequest" property="apiRequestKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
        <c:when test="${_fieldName == 'maxWait'}">
            <input type="text" id="maxWait" name="maxWait" value="<zl:write name="apiRequest" property="maxWait" />"  size="30" />
            <input type="button" onclick="reloadSectionWithForm('ajax_apiRequest_<zl:write name="apiRequest" property="apiRequestKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
        <c:when test="${_fieldName == 'request'}">
            <input type="text" id="request" name="request" value="<zl:write name="apiRequest" property="request" />"  size="30" />
            <input type="button" onclick="reloadSectionWithForm('ajax_apiRequest_<zl:write name="apiRequest" property="apiRequestKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
        <c:when test="${_fieldName == 'integerValue'}">
            <input type="text" name="integerValue" value="<zl:write name="apiRequest" property="integerValue" format="MM/dd/yyyy hh:mm aa" />"  size="30" />
            <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['apiRequest'].elements['integerValue'], 'images/')"><IMG SRC="images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
            <input type="button" onclick="reloadSectionWithForm('ajax_apiRequest_<zl:write name="apiRequest" property="apiRequestKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>

    </c:choose>
    <logic:present name="ajaxErrorMessage"><span style="color: red"><bean:write name="ajaxErrorMessage" /></span>
    </logic:present>
</form>
