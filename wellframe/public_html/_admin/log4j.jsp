<%@page import="java.util.*" %>
<%@page import="org.apache.log4j.*" %>
<%@ include file="security.jsp" %>
<%
if ("update".equals(request.getParameter("action"))) {
	Enumeration categories = request.getParameterNames();
	int i;
	Vector validCats = new Vector();
	validCats.add("error");
	validCats.add("debug");
	validCats.add("info");
	while (categories.hasMoreElements()) {
        String catName = (String)categories.nextElement();
        String catValue = request.getParameter(catName).toLowerCase();
        if (!validCats.contains(catValue)) {
            continue;
        }
        Logger cat = Logger.getLogger(catName);
        cat.setPriority(Priority.toPriority(catValue));
    }
}
%>
<HTML>
<head>

<A HREF="index.html">Main Menu</A>
<BR><BR>
Configure log4J:
<BR>
<%
Enumeration appenders = Logger.getLogger(Logger.class).getAllAppenders();
while (appenders.hasMoreElements()) {
   Appender appender = (Appender) appenders.nextElement();
   out.println("Appender: " + appender.getName());
}
%>
<FORM ACTION="log4j.jsp" METHOD="post">
<input TYPE="hidden" name="action" VALUE="update">
<TABLE>
<TR>
<TD></td>
<TD><INPUT TYPE="submit" VALUE="update"></td>
<TR>
<TR BGCOLOR="lightgrey">
<TD>Category</td>
<TD>Value</td>
<TR>
<%
// List any categories which have a value
      Enumeration allCats = Logger.getCurrentCategories();
      while (allCats.hasMoreElements()) {
        Logger cat = (Logger)allCats.nextElement();
        String catName = cat.getName();
        Priority p = cat.getPriority();
        String priority = "none";
        if (p != null) {
          priority = p.toString();
        }

        if (priority.equals("none")) continue;

        %>
		<TR><TD><font size=2><%= catName %></font></td>
        <TD><FONT SIZE=2><INPUT TYPE="text" NAME="<%= catName %>" VALUE="<%= priority %>"></font></td>
		<TR>		
		<%
      }

      // List any categories which have no value
      allCats = Logger.getCurrentCategories();
      while (allCats.hasMoreElements()) {
        Logger cat = (Logger)allCats.nextElement();
        String catName = cat.getName();
        Priority p = cat.getPriority();
        String priority = "none";
        if (p != null) {
          priority = p.toString();
        }

        if (!priority.equals("none")) continue;
        %>
		<TR><TD><font size=2><%= catName %></font></td>
        <TD><FONT SIZE=2><INPUT TYPE="text" NAME="<%= catName %>" VALUE="<%= priority %>"></font></td>
		<TR>		
		<%
      } 
%>

<TR>
<TD></td>
<TD><INPUT TYPE="submit" VALUE="update"></td>
<TR>
</TABLE>


</form>

  </BODY>
</HTML>