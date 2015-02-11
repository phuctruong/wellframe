<%@ page import="java.util.*" %>
<%@ page import="com.zoomlane.util.*" %>
<%@ include file="security.jsp" %>
<%
// SystemProperties.jsp --- Display System properties
//
%>

<html>

<head>
   <title>Configuration Settings</title>
</head>

<body>
<A HREF="index.html">Main Menu</A>
<BR><BR>

<h1 align="center">Configuration Properties</h1>
<%
if ("update".equals(request.getParameter("action"))) {
   Enumeration updateProperties = request.getParameterNames();
   while (updateProperties.hasMoreElements()) {
      String name = (String)updateProperties.nextElement();
      if (name.equals("action")) continue;
      Config.setProperty(name, request.getParameter(name));
   }
   %><BR><FONT COLOR="RED"><B>Configuration Saved</B></FONT><BR><BR><%
}
%>
<FORM ACTION="config.jsp" METHOD="post">
   <INPUT TYPE="HIDDEN" NAME="action" VALUE="update">
   <table>
<%
   String[] properties = Config.getInstance().getPropertyNames();
   for (int i = 0;i < properties.length;i++) {
      String name = properties[i];
      String value = Config.getProperty(name);
      %>
      
      <tr>
         <td><font size="-1"><b><%= name %></b></font></td>
         <td><font size="-1"><INPUT TYPE="text" NAME="<%= name %>" value="<%= value %>" size="64"></font></td>
      </tr>
      <%
   }
%>
      <TR><TD></TD><TD><INPUT TYPE="SUBMIT" VALUE="Update"></TD></TR>
   </table>

</FORM>

</body>
</html>
