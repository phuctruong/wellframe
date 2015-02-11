<%@ page import="java.util.*, java.net.*" %>

<%
// SystemProperties.jsp --- Display System properties
//
%>

<%
  SortedSet keys = new TreeSet(System.getProperties().keySet());
%>

<html>

<head>
<title>System Settings</title>
</head>

<body>
<A HREF="index.html">Main Menu</A>
<BR><BR>

<h1 align="center">System Properties:

<%
  out.println(InetAddress.getLocalHost().getHostName());
  %>
  </h1>
<table>
<%
  for (Iterator iterator = keys.iterator(); iterator.hasNext(); )
  {
      String key   = (String) iterator.next();
      String value = System.getProperty(key);
%>
<tr>
      <td><font size="-1"><b><%= key %></b></font></td>
      <td><font size="-1"><%= value %></font></td>
</tr>
<% } %>

</table>

</body>
</html>
