<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
///   <token name="className" replaceText="entity" replaceTextPattern="JAVA" />
////--%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<html>
<head>
    <%
	String base = request.getScheme() + "://" + request.getServerName();
    if (request.getServerPort() != 80) base += ":" + request.getServerPort();
    base += request.getContextPath() + "/";
    %>
    <base href="<%= base %>" />

    <link rel="stylesheet" href="_css/javawriter.css" type="text/css">
    <script type="text/javascript" src="_js/base.js"></script> 
    <script type="text/javascript" src="_js/jquery-1.7.1.min.js"></script> 
</head>
<body>

<FORM ACTION="base/performSearchDao.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="base/displayEditDao.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="base/displaySearchDao.do">Search</A>
</UL>

<table>
<%-- ////
    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="LongValue" />
//// --%>
  <tr> 
    <td class="tableHeading" colspan="2">Dao</td>
  </tr>
<%-- ////
    /// </foreachEntityProperty>
//// --%>
<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="inputType=text || textarea || select, dataType=string || integer || long || entity || date || float || short || boolean || file || vector || foreignVector">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="dateFormat" replaceText=" format=&quot;&quot;" replaceTextPattern=" format=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
    <tr><td class="tableLabel">integer_field</td>
	   <td>
	      <bean:define id="_fieldName" value="integerValue" /><%@ include file="/base/inc_DaoAjaxDisplay.jsp" %>
		</td>
    </tr>
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="dataType=filesystemFile">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">integer_field</td><td>
	   <bean:define id="_fieldName" value="integerValue" /><%@ include file="/base/inc_DaoAjaxDisplay.jsp" %>
      </td></tr>
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>

</table>

<merge:flushDebugLogs />

</body>
</html>
<%-- ////
/// </foreachEntityProperty>
//// --%>

