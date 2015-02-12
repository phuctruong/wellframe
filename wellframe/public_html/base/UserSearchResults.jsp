<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/pager.js"></script>

<FORM ACTION="../base/performSearchUser.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditUser.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchUser.do">Search</A>
</UL>

<form action="../base/displaySearchResultsUser.do" name="search_results_info">
   <bean:write name="searchResults" property="postString" filter="false"/>
   <input type="hidden" name="search_results_page" value="../base/displaySearchResultsUser.do">
</form>
<font class="content">
<script type="text/javascript">writeSearchResultsSummary('search_results_info');</script>
</font><BR>
<script type="text/javascript">writePageNav('search_results_info');</script>
<table>
   <tr bgcolor="lightblue">
      <td>User Key</td>
      <td>Username</td>
      <td>Date Created</td>
      <TD ALIGN="LEFT">Details</TD>
      <TD ALIGN="LEFT">Edit</TD>
      <TD ALIGN="LEFT">Ajax</TD>
      <TD ALIGN="LEFT">Delete</TD>
   </tr>

<logic:iterate name="searchResults" property="currentPageObjects" id="user">
   <tr valign="top">
      <td><zl:write name="user" property="userKey" /></td>
      <td><zl:write name="user" property="username" /></td>
      <td><zl:write name="user" property="dateCreated" format="MM/dd/yyyy K:mm a" /></td>
      <zl:replace name="user" property="userKey" replaceText="123">
      <TD ALIGN="LEFT"><A HREF="../base/displayUser.do?id=123">Details</A></TD>
      <TD ALIGN="LEFT"><A HREF="../base/displayEditUser.do?id=123">Edit</A></TD>
      <TD ALIGN="LEFT"><A HREF="../base/displayAjaxEditUser.do?id=123">Ajax</A></TD>
      <TD ALIGN="LEFT">
      <zl:replace name="searchResults" property="getString" replaceText="search_info">
      <A HREF="javascript: if (confirm('Are you sure you want to delete this item?')) {document.location='../base/deleteUser.do?id=123&search_info';}">Delete</A>      
      </zl:replace>
      </TD>
      </zl:replace>
   </tr>
</logic:iterate>
</table>

<merge:flushDebugLogs />
