<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
///   <token name="className" replaceText="entity" replaceTextPattern="JAVA" />
///   <token name="fileUploadSupport" replaceText=" enctype=&quot;multipart/form-data&quot;" replaceTextPattern=" enctype=&quot;multipart/form-data&quot;" replaceTextIfNullValue=""/>
////--%>
<%@ include file="/template/includes.jsp" %>
<form action="base/ajax-save-entity.do" enctype="multipart/form-data" name="entity" method="post">
    <input type="hidden" name="id" value="<zl:write name="entity" property="entityKey" />" />
    <input type="hidden" name="_fieldName" value="<zl:write name="_fieldName" />" />
    <c:choose>
<%-- //// ============================= TEXT INPUT TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType!=date">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
//// --%>  
        <c:when test="${_fieldName == 'integerValue'}">
            <input type="text" id="integerValue" name="integerValue" value="<zl:write name="entity" property="integerValue" />"  size="" maxlength="" />
            <input type="button" onclick="reloadSectionWithForm('ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= TEXTAREA TYPES =======================================
    /// <foreachEntityProperty where="inputType=textarea, dataType!=date">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRows" replaceText=" rows=&quot;&quot;" replaceTextPattern=" rows=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputCols" replaceText=" cols=&quot;&quot;" replaceTextPattern=" cols=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
//// --%>  
        <c:when test="${_fieldName == 'integerValue'}">
            <textarea name="integerValue" rows="" cols="" size="" maxlength=""><zl:write name="entity" property="integerValue" /></textarea>
            <input type="button" onclick="reloadSectionWithForm('ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= DATE TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType=date, javascriptCalendar=basic">
    ///   <token name="functionName" replaceText="dateValue" replaceTextPattern="JAVA" />
    ///   <token name="dateFormat" replaceText=" format=&quot;&quot;" replaceTextPattern=" format=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
//// --%>  
        <c:when test="${_fieldName == 'integerValue'}">
            <input type="text" name="integerValue" value="<zl:write name="entity" property="integerValue" format="" />"  size="" maxlength="" />
            <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['entity'].elements['integerValue'], 'images/')"><IMG SRC="images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
            <input type="button" onclick="reloadSectionWithForm('ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= DATE TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType=date, javascriptCalendar=null">
    ///   <token name="functionName" replaceText="dateValue" replaceTextPattern="JAVA" />
    ///   <token name="dateFormat" replaceText=" format=&quot;&quot;" replaceTextPattern=" format=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
//// --%>  
        <c:when test="${_fieldName == 'dateValue'}">
            <input type="text" name="dateValue" value="<zl:write name="entity" property="dateValue" format="" />"  size="" maxlength="" />
            <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['entity'].elements['dateValue'], 'images/')"><IMG SRC="images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
            <input type="button" onclick="reloadSectionWithForm('ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= SELECT LIST TYPES =======================================
    /// <foreachEntityProperty where="inputType=select">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText="LIST_NAME" />
//// --%>  
        <c:when test="${_fieldName == 'integerValue'}">
            <select name="integerValue" onchange="reloadSectionWithForm('ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />', this.form)" ><option value=""></option><%= SelectOptionsFactory.optionList("LIST_NAME", pageContext, "entity", "integerValue") %></select>
            <input type="button" onclick="reloadSectionWithForm('ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />', this.form)" value="update" />
        </c:when>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>

    </c:choose>
    <logic:present name="ajaxErrorMessage"><span style="color: red"><bean:write name="ajaxErrorMessage" /></span>
    </logic:present>
</form>
<%-- ////
/// </foreachEntityProperty>
//// --%>

