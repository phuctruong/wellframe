<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/zl.tld" prefix="zl" %>
<%@ taglib uri="/WEB-INF/zoomlane.tld" prefix="merge" %>
<html>
<head>
    <%
	String base = request.getScheme() + "://" + request.getServerName();
    if (request.getServerPort() != 80) base += ":" + request.getServerPort();
    base += request.getContextPath() + "/";
    %>
    <base href="<%= base %>" />

    <link rel="stylesheet" href="_css/javawriter.css" type="text/css">
    <script type="text/javascript" src="_js/base.js"></script> 
    <script type="text/javascript" src="_js/jquery-1.7.1.min.js"></script> 
</head>
<body>

<FORM ACTION="base/performSearchApiResponse.do" name="find_all" METHOD="post"></FORM>
<UL>
<LI> <A HREF="base/displayEditApiResponse.do">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="base/displaySearchApiResponse.do">Search</A>
</UL>

<table>
  <tr> 
    <td class="tableHeading" colspan="2">ApiResponse</td>
  </tr>
    <tr><td class="tableLabel">Response</td>
	   <td>
	      <bean:define id="_fieldName" value="response" /><%@ include file="/base/inc_ApiResponseAjaxDisplay.jsp" %>
		</td>
    </tr>
    <tr><td class="tableLabel">Date Created</td>
	   <td>
	      <bean:define id="_fieldName" value="dateCreated" /><%@ include file="/base/inc_ApiResponseAjaxDisplay.jsp" %>
		</td>
    </tr>

</table>

<merge:flushDebugLogs />

</body>
</html>
