<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">

<FORM ACTION="../base/performSearchUser.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditUser.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchUser.do">Search</A>
</UL>

<table>
  <tr> 
    <td class="tableHeading" colspan="2">User</td>
  </tr>
   <tr><td class="tableLabel">User Key</td><td><zl:write name="user" property="userKey" /></td></tr>
   <tr><td class="tableLabel">Username</td><td><zl:write name="user" property="username" /></td></tr>
   <tr><td class="tableLabel">Password</td><td><zl:write name="user" property="password" /></td></tr>
   <tr><td class="tableLabel">Date Created</td><td><zl:write name="user" property="dateCreated" format="MM/dd/yyyy K:mm a" /></td></tr>

</table>

<merge:flushDebugLogs />
