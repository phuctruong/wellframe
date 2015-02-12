<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">

<FORM ACTION="../base/performSearchApiResponse.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="../base/displayEditApiResponse.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="../base/displaySearchApiResponse.do">Search</A>
</UL>

<table>
  <tr> 
    <td class="tableHeading" colspan="2">ApiResponse</td>
  </tr>
   <tr><td class="tableLabel">Api Response Key</td><td><zl:write name="apiResponse" property="apiResponseKey" /></td></tr>
   <tr><td class="tableLabel">Api Request Key</td><td><zl:write name="apiResponse" property="apiRequestKey" /></td></tr>
   <tr><td class="tableLabel">Response</td><td><zl:write name="apiResponse" property="response" /></td></tr>
   <tr><td class="tableLabel">Last Updated</td><td><zl:write name="apiResponse" property="lastUpdated" format="MM/dd/yyyy K:mm a" /></td></tr>
   <tr><td class="tableLabel">Date Created</td><td><zl:write name="apiResponse" property="dateCreated" format="MM/dd/yyyy hh:mm aa" /></td></tr>

</table>

<merge:flushDebugLogs />
