<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
///   <token name="className" replaceText="entity" replaceTextPattern="JAVA" />
////--%>
<%@ include file="/template/includes.jsp" %>
<c:if test="${empty _hideAjaxDiv}"><div id="ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />"></c:if>
<span onclick="$('#ajax_entity_<zl:write name="entity" property="entityKey" />_<zl:write name="_fieldName" />').load('base/ajax-edit-entity.do?id=<zl:write name="entity" property="entityKey" />&_fieldName=<zl:write name="_fieldName" />')">
<c:choose>
<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="dataType=string || integer || long || entity || date || float || short || boolean || file || vector || foreignVector">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="dateFormat" replaceText=" format=&quot;&quot;" replaceTextPattern=" format=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="convert" replaceText=" convert=&quot;&quot;" replaceTextPattern=" convert=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
    <c:when test="${_fieldName == 'integerValue'}"><zl:write name="entity" property="integerValue" zlSelectOptionsList="" format="" convert="" ifNull="-" /></c:when>
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
</c:choose>
</span>
<c:if test="${empty _hideAjaxDiv}"></div></c:if>
<%-- ////
/// </foreachEntityProperty>
//// --%>

