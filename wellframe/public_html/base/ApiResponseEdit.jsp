<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">
<script type="text/javascript" src="../_js/base.js"></script>
<script type="text/javascript" src="../_js/calendar.js"></script>

<FORM ACTION="../base/performSearchApiResponse.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditApiResponse.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchApiResponse.do">Search</A>
</UL>

<zl:form action="/saveApiResponse" onsubmit="setMultivalue('VO_FORM', '~');">
<zl:errors />
<table>
  <tr> 
    <td class="tableHeading" colspan="2">Edit ApiResponse</td>
  </tr>
   <tr><td class="tableLabel">Response</td><td><zl:text property="vo(response)" zlIsRequired="true" size="30"/></td></tr>
   <tr><td class="tableLabel">Date Created</td><td><zl:text property="vo(dateCreated)" zlDateFormat="MM/dd/yyyy hh:mm aa"  size="30" /><a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['VO_FORM'].elements['vo(dateCreated)'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a></td></tr>
   <tr><td></td><td><input type="submit" value="Save"></td></tr>
</table>
</zl:form>

<merge:flushDebugLogs />
