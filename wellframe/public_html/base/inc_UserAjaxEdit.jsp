<%@ include file="/template/includes.jsp" %>
<form action="base/ajax-save-user.do" name="user" method="post">
    <input type="hidden" name="id" value="<zl:write name="user" property="userKey" />" />
    <input type="hidden" name="_fieldName" value="<zl:write name="_fieldName" />" />
    <c:choose>
        <c:when test="${_fieldName == 'username'}">
            <input type="text" id="username" name="username" value="<zl:write name="user" property="username" />"  size="30" />
            <input type="button" onclick="reloadSectionWithForm('ajax_user_<zl:write name="user" property="userKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
        <c:when test="${_fieldName == 'password'}">
            <input type="text" id="password" name="password" value="<zl:write name="user" property="password" />"  size="30" />
            <input type="button" onclick="reloadSectionWithForm('ajax_user_<zl:write name="user" property="userKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>

    </c:choose>
    <logic:present name="ajaxErrorMessage"><span style="color: red"><bean:write name="ajaxErrorMessage" /></span>
    </logic:present>
</form>
