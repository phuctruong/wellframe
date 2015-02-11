<%@page import="com.zoomlane.util.jsp.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.*" %>
<%
JspDebug debug = new JspDebug(request);

JspMerge merge = JspMerge.newInstance(request);
merge.setToken("beta", "This is a test of beta");
merge.setToken("removeThis", "");

for (int i = 0;i < 10;i++) {
    JspMerge row = merge.addMergeRow("results");
    row.setToken("testRowToken", "test-" + i);
    /*
    for (int j = 0;j < 2;j++) {
        JspMerge majors = row.addMergeRow("majors");
        majors.setToken("testMajors", "major: " + i + "-" + j);
    }
    */
}


%>
<%@ taglib uri="/WEB-INF/jsp/zoomlane.tld" prefix="merge" %>

<HTML>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">

<BODY bgcolor="#ffffff">
<p>Definition of possible merge tags</p>
<table width="100%" border="0" cellspacing="0" cellpadding="0">

<merge:rows name="results" displayIfNull="No Results Found">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">Result</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">alpha gamma: <merge:token fromRows="results" token="test" displayIfNull="This is null" /></td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Global Tokens: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"><merge:token replaceText="gamma" token="beta">alpha 
      gamma</merge:token> </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Row Tokens: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"><merge:token fromRows="results" token="testRowToken" /></td>
  </tr>
  <merge:rows fromRows="results" name="majors">
    <tr> 
      <td width="12%" class="tableLabel2" align="right">Sub Row Tokens: </td>
      <td width="2%" class="tableLabel2">&nbsp;</td>
      <td width="86%" class="tableLabel2"><merge:token fromRows="majors" token="testMajors" /></td>
    </tr>
  </merge:rows>
  
</merge:rows>  
</table>
<BR>

<%= debug.flushLogs() %>

</BODY>
</html>

