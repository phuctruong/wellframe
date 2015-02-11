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
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/calendar.js"></script>

<FORM ACTION="../base/performSearchDao.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditDao.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchDao.do">Search</A>
</UL>

<zl:form action="/performSearchDao" onsubmit="setMultivalue('VO_SEARCH_FORM', '~');">
<zl:errors />
<table>
    <TR VALIGN="top"><TD CLASS="tableHeading" colspan=2>Dao Search:</TD></TR>
   <tr><td class="tableLabel"></td><td class="tableLabel"><input type="submit" value="Search"></td></tr>
<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="inputType = text || textarea, searchType != null, dataType != date">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchRequired" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchType" replaceText=" zlSearchType=&quot;&quot;" replaceTextPattern=" zlSearchType=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="validate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">integer_field</td><td><zl:text property="vo(integerValue)" zlIsRequired="" zlSearchType="" zlValidate="" /></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= DATE TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType=date, searchType != null, javascriptCalendar=basic">
    ///   <token name="functionName" replaceText="dateValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="dateFormat" replaceText=" zlDateFormat=&quot;&quot;" replaceTextPattern=" zlDateFormat=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="isRequiredForSearch" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchType" replaceText=" zlSearchType=&quot;&quot;" replaceTextPattern=" zlSearchType=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="validate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">date_field</td><td>
      <zl:text property="vo(dateValue)" zlIsRequired="" zlUniqueId="after" zlDateFormat="" zlSearchType="DateFrom"/>
      <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['VO_SEARCH_FORM'].elements['vo(UID_after_dateValue)'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
      to
      <zl:text property="vo(dateValue)" zlIsRequired="" zlUniqueId="before" zlDateFormat="" zlSearchType="DateTo" />
      <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['VO_SEARCH_FORM'].elements['vo(UID_before_dateValue)'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
      </td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= DATE TYPES =======================================
    /// <foreachEntityProperty where="inputType=text, dataType=date, searchType != null, javascriptCalendar=null">
    ///   <token name="functionName" replaceText="dateValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="dateFormat" replaceText=" zlDateFormat=&quot;&quot;" replaceTextPattern=" zlDateFormat=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="isRequiredForSearch" replaceText=" zlIsRequired=&quot;&quot;" replaceTextPattern=" zlIsRequired=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchType" replaceText=" zlSearchType=&quot;&quot;" replaceTextPattern=" zlSearchType=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="validate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="dateFormat" replaceText="(date_format)" replaceTextIfNullField="" replaceTextPattern="(TOKEN)" />
//// --%>  
   <tr><td class="tableLabel">date_field (date_format)</td><td>
      <zl:text property="vo(dateValue)" zlIsRequired="" zlUniqueId="after" zlDateFormat="" zlSearchType="DateFrom"/>
      to
      <zl:text property="vo(dateValue)" zlIsRequired="" zlUniqueId="before" zlDateFormat="" zlSearchType="DateTo" />
      </td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= SELECT LIST TYPES =======================================
    /// <foreachEntityProperty where="inputType=select, searchType != null, selectOptionsList!=null">
    ///   <token name="functionName" replaceText="longValue" replaceTextPattern="JAVA" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="prependOptions" replaceText=" zlPrependOptions=&quot;&quot;" replaceTextPattern=" zlPrependOptions=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="defaultSelectOptions" replaceText=" zlDefaultSelectedOptions=&quot;&quot;" replaceTextPattern=" zlDefaultSelectedOptions=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="validate" replaceText=" zlValidate=&quot;&quot;" replaceTextPattern=" zlValidate=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchSize" replaceText=" size=&quot;&quot;" replaceTextPattern=" size=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchType" replaceText=" zlSearchType=&quot;&quot;" replaceTextPattern=" zlSearchType=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="label" replaceText="long_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
   <tr><td class="tableLabel">long_field</td><td><zl:select property="vo(longValue)" multiple="true" size="" zlSelectOptionsList="" zlPrependOptions="" zlSearchType="" zlDefaultSelectedOptions=""/></td></tr>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
   <tr><td></td><td><input type="submit" value="Search"></td></tr>
</table>
</zl:form>

<merge:flushDebugLogs />
<%-- ////
/// </foreachEntityProperty>
//// --%>

