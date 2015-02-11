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
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/pager.js"></script>

<FORM ACTION="../base/performSearchDao.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditDao.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchDao.do">Search</A>
</UL>

<form action="../base/displaySearchResultsDao.do" name="search_results_info">
   <bean:write name="searchResults" property="postString" filter="false"/>
   <input type="hidden" name="search_results_page" value="../base/displaySearchResultsDao.do">
</form>
<font class="content">
<script type="text/javascript">writeSearchResultsSummary('search_results_info');</script>
</font><BR>
<script type="text/javascript">writePageNav('search_results_info');</script>
<table>
   <tr bgcolor="lightblue">
<%-- //// ============================= LINK TO URL TYPES =======================================
    /// <foreachEntityProperty where="searchDisplayInResults=true, searchDisplayImage!=true, searchLinkToUrl!=null">
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
      <td>integer_field</td>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="searchDisplayInResults=true, searchDisplayImage!=true, searchLinkToUrl=null">
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
      <td>integer_field</td>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= IMAGE FILE TYPES =======================================
    /// <foreachEntityProperty where="searchDisplayInResults=true, searchDisplayImage=true">
    ///   <token name="label" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
//// --%>  
      <td>integer_field</td>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
      <TD ALIGN="LEFT">Details</TD>
      <TD ALIGN="LEFT">Edit</TD>
      <TD ALIGN="LEFT">Ajax</TD>
      <TD ALIGN="LEFT">Delete</TD>
   </tr>

<logic:iterate name="searchResults" property="currentPageObjects" id="entity">
   <tr valign="top">
<%-- //// ============================= LINK TO URL TYPES =======================================
    /// <foreachEntityProperty where="searchDisplayInResults=true, searchDisplayImage!=true, searchLinkToUrl!=null">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="dateFormat" replaceText=" format=&quot;&quot;" replaceTextPattern=" format=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="searchLinkToUrl" replaceText="link_url" />
//// --%>        
      <td>
      <zl:replace name="entity" property="integerValue" replaceText="123">
      <a href="link_url?id=123"><zl:write name="entity" property="integerValue" format="" zlSelectOptionsList="" /></a>
      </zl:replace>
      </td>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
<%-- //// ============================= BASIC TYPES =======================================
    /// <foreachEntityProperty where="searchDisplayInResults=true, searchDisplayImage!=true, searchLinkToUrl=null">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
    ///   <token name="dateFormat" replaceText=" format=&quot;&quot;" replaceTextPattern=" format=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
    ///   <token name="selectOptionsList" replaceText=" zlSelectOptionsList=&quot;&quot;" replaceTextPattern=" zlSelectOptionsList=&quot;TOKEN&quot;" replaceTextIfNullValue="" />
//// --%>        
      <td><zl:write name="entity" property="integerValue" format="" zlSelectOptionsList="" /></td>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= IMAGE FILE TYPES =======================================
    /// <foreachEntityProperty where="searchDisplayInResults=true, searchDisplayImage=true">
    ///   <token name="functionName" replaceText="integerValue" replaceTextPattern="JAVA" />
//// --%>        
      <td>
      <logic:notEmpty name="entity" property="integerValueUrl">
      <zl:replace name="entity" property="integerValueUrl" replaceText="imageUrl">
      <img src="imageUrl" border=1>
      </zl:replace>
      </logic:notEmpty>
      </td>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= ACTION LINKS =======================================    
    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="longValue" replaceTextPattern="JAVA"/>
    ////--%>
      <zl:replace name="entity" property="longValue" replaceText="123">
      <TD ALIGN="LEFT"><A HREF="../base/displayDao.do?id=123">Details</A></TD>
      <TD ALIGN="LEFT"><A HREF="../base/displayEditDao.do?id=123">Edit</A></TD>
      <TD ALIGN="LEFT"><A HREF="../base/displayAjaxEditDao.do?id=123">Ajax</A></TD>
      <TD ALIGN="LEFT">
      <zl:replace name="searchResults" property="getString" replaceText="search_info">
      <A HREF="javascript: if (confirm('Are you sure you want to delete this item?')) {document.location='../base/deleteDao.do?id=123&search_info';}">Delete</A>      
      </zl:replace>
      </TD>
      </zl:replace>
<%-- //// ==================================================================================
    /// </foreachEntityProperty>    
//// --%>
   </tr>
</logic:iterate>
</table>

<merge:flushDebugLogs />
<%-- ////
/// </foreachEntityProperty>
//// --%>

