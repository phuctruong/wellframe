<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
///   <token name="className" replaceText="entity" replaceTextPattern="JAVA" />
///   <token name="fileUploadSupport" replaceText=" enctype=&quot;multipart/form-data&quot;" replaceTextPattern=" enctype=&quot;multipart/form-data&quot;" replaceTextIfNullValue=""/>
////--%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/calendar.js"></script>

<FORM ACTION="../base/performSearchDao.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditDao.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchDao.do">Search</A>
</UL>

<zl:form action="/saveDao" enctype="multipart/form-data" onsubmit="setMultivalue('VO_FORM', '~');">
<zl:errors />
<table>
<%-- ////
    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="LongValue" />
//// --%>
  <tr> 
    <td class="tableHeading" colspan="2">Edit Dao</td>
  </tr>
<%-- ////
    /// </foreachEntityProperty>
//// --%>

<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType!=date">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputValidate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRequired" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">integer_field</td><td><zl:text property="vo(integerValue)" zlIsRequired="" zlValidate="" size="" maxlength=""/></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="inputType=textarea, dataType!=date">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputValidate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRows" replaceText=" rows=&quot;&quot;" replaceTextPattern=" rows=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputCols" replaceText=" cols=&quot;&quot;" replaceTextPattern=" cols=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRequired" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">integer_field</td><td><zl:textarea property="vo(integerValue)" zlIsRequired="" zlValidate="" rows="" cols="" size="" maxlength=""/></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= FILE TYPE =======================================
    /// <foreachEntityProperty where="inputType=file">
    ///   <token name="functionName" replaceText="filesystemFile" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputValidate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRequired" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="filesystem_file_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">filesystem_file_field</td><td><html:file property="vo(filesystemFile)" zlIsRequired="" zlValidate="" size="" /></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= DATE TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType=date, javascriptCalendar=basic">
    ///   <token name="functionName" replaceText="dateValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="dateFormat" replaceText=" zlDateFormat=&quot;&quot;" replaceTextPattern=" zlDateFormat=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRequired" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputValidate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">date_field</td><td><zl:text property="vo(dateValue)" zlDateFormat="" zlIsRequired="" zlValidate=""  size="" maxlength="" /><a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['VO_FORM'].elements['vo(dateValue)'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= DATE TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType=date, javascriptCalendar=null">
    ///   <token name="functionName" replaceText="dateValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="dateFormat" replaceText=" zlDateFormat=&quot;&quot;" replaceTextPattern=" zlDateFormat=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRequired" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMaxlength" replaceText=" maxlength=&quot;&quot;" replaceTextPattern=" maxlength=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputValidate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="dateFormat" replaceText="(date_format)" replaceTextIfNullField="" replaceTextPattern="(TOKEN)" />
//// --%>  
   <tr><td class="tableLabel">date_field (date_format)</td><td><zl:text property="vo(dateValue)" zlDateFormat="" zlIsRequired="" zlValidate=""  size="" maxlength="" /></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= SELECT LIST TYPES =======================================
    /// <foreachEntityProperty where="inputType=select">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="prependOptions" replaceText=" zlPrependOptions=&quot;&quot;" replaceTextPattern=" zlPrependOptions=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="defaultSelectOptions" replaceText=" zlDefaultSelectedOptions=&quot;&quot;" replaceTextPattern=" zlDefaultSelectedOptions=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputMultiple" replaceText=" multiple=&quot;&quot;" replaceTextPattern=" multiple=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputRequired" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="inputValidate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">integer_field</td><td><zl:select property="vo(integerValue)" zlIsRequired="" zlSelectOptionsList="" zlDefaultSelectedOptions="" zlPrependOptions="" size="" multiple="" /></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
   <tr><td></td><td><input type="submit" value="Save"></td></tr>
</table>
</zl:form>

<merge:flushDebugLogs />
<%-- ////
/// </foreachEntityProperty>
//// --%>

