<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/calendar.js"></script>

<FORM ACTION="../base/performSearchUser.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditUser.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchUser.do">Search</A>
</UL>

<zl:form action="/performSearchUser" onsubmit="setMultivalue('VO_SEARCH_FORM', '~');">
<zl:errors />
<table>
    <TR VALIGN="top"><TD CLASS="tableHeading" colspan=2>User Search:</TD></TR>
   <tr><td class="tableLabel"></td><td class="tableLabel"><input type="submit" value="Search"></td></tr>
   <tr><td class="tableLabel">Username</td><td><zl:text property="vo(username)" zlSearchType="TextLike" /></td></tr>
   <tr><td class="tableLabel">Password</td><td><zl:text property="vo(password)" zlSearchType="TextLike" /></td></tr>
   <tr><td></td><td><input type="submit" value="Search"></td></tr>
</table>
</zl:form>

<merge:flushDebugLogs />
