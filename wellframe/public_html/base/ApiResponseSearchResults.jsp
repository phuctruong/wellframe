<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/pager.js"></script>

<FORM ACTION="../base/performSearchApiResponse.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditApiResponse.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchApiResponse.do">Search</A>
</UL>

<form action="../base/displaySearchResultsApiResponse.do" name="search_results_info">
   <bean:write name="searchResults" property="postString" filter="false"/>
   <input type="hidden" name="search_results_page" value="../base/displaySearchResultsApiResponse.do">
</form>
<font class="content">
<script type="text/javascript">writeSearchResultsSummary('search_results_info');</script>
</font><BR>
<script type="text/javascript">writePageNav('search_results_info');</script>
<table>
   <tr bgcolor="lightblue">
      <td>Api Response Key</td>
      <td>Api Request Key</td>
      <td>Response</td>
      <td>Last Updated</td>
      <td>Date Created</td>
      <TD ALIGN="LEFT">Details</TD>
      <TD ALIGN="LEFT">Edit</TD>
      <TD ALIGN="LEFT">Ajax</TD>
      <TD ALIGN="LEFT">Delete</TD>
   </tr>

<logic:iterate name="searchResults" property="currentPageObjects" id="apiResponse">
   <tr valign="top">
      <td><zl:write name="apiResponse" property="apiResponseKey" /></td>
      <td><zl:write name="apiResponse" property="apiRequestKey" /></td>
      <td><zl:write name="apiResponse" property="response" /></td>
      <td><zl:write name="apiResponse" property="lastUpdated" format="MM/dd/yyyy K:mm a" /></td>
      <td><zl:write name="apiResponse" property="dateCreated" format="MM/dd/yyyy hh:mm aa" /></td>
      <zl:replace name="apiResponse" property="apiResponseKey" replaceText="123">
      <TD ALIGN="LEFT"><A HREF="../base/displayApiResponse.do?id=123">Details</A></TD>
      <TD ALIGN="LEFT"><A HREF="../base/displayEditApiResponse.do?id=123">Edit</A></TD>
      <TD ALIGN="LEFT"><A HREF="../base/displayAjaxEditApiResponse.do?id=123">Ajax</A></TD>
      <TD ALIGN="LEFT">
      <zl:replace name="searchResults" property="getString" replaceText="search_info">
      <A HREF="javascript: if (confirm('Are you sure you want to delete this item?')) {document.location='../base/deleteApiResponse.do?id=123&search_info';}">Delete</A>      
      </zl:replace>
      </TD>
      </zl:replace>
   </tr>
</logic:iterate>
</table>

<merge:flushDebugLogs />
