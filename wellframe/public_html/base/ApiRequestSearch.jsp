<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/calendar.js"></script>

<FORM ACTION="../base/performSearchApiRequest.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditApiRequest.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchApiRequest.do">Search</A>
</UL>

<zl:form action="/performSearchApiRequest" onsubmit="setMultivalue('VO_SEARCH_FORM', '~');">
<zl:errors />
<table>
    <TR VALIGN="top"><TD CLASS="tableHeading" colspan=2>ApiRequest Search:</TD></TR>
   <tr><td class="tableLabel"></td><td class="tableLabel"><input type="submit" value="Search"></td></tr>
   <tr><td class="tableLabel">Version</td><td><zl:text property="vo(version)" zlSearchType="TextLike" /></td></tr>
   <tr><td class="tableLabel">Max Wait</td><td><zl:text property="vo(maxWait)" zlSearchType="TextLike" /></td></tr>
   <tr><td class="tableLabel">Request</td><td><zl:text property="vo(request)" zlSearchType="TextLike" /></td></tr>
   <tr><td class="tableLabel">Date Created</td><td>
      <zl:text property="vo(dateCreated)" zlUniqueId="after" zlDateFormat="MM/dd/yyyy hh:mm aa" zlSearchType="DateFrom"/>
      <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['VO_SEARCH_FORM'].elements['vo(UID_after_dateCreated)'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
      to
      <zl:text property="vo(dateCreated)" zlUniqueId="before" zlDateFormat="MM/dd/yyyy hh:mm aa" zlSearchType="DateTo" />
      <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['VO_SEARCH_FORM'].elements['vo(UID_before_dateCreated)'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
      </td></tr>
   <tr><td></td><td><input type="submit" value="Search"></td></tr>
</table>
</zl:form>

<merge:flushDebugLogs />
