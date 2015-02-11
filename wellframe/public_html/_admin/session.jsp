<%@page import="javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="java.io.*" %>
<%@page import="java.text.*" %>
<%@page import="java.util.*" %>
<%@ include file="security.jsp" %>
<HTML>
<HEAD>
<TITLE>Session information</TITLE>
</HEAD>
<BODY>
<A HREF="index.html">Main Menu</A>
<BR><BR>
Cookies:
<ul>
<%
String action = request.getParameter("action");
String fileLocation = request.getParameter("fileLocation");

javax.servlet.http.Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (int i = 0;i < cookies.length;i++) {
       javax.servlet.http.Cookie cookie = cookies[i];
       if ("Clean out Cookies".equals(action)) {
		  cookie.setPath("/");
		  cookie.setMaxAge(0);
		  out.println("<li>Cleaned out cookie: " + cookie.getName() + "</li>\n");
		  response.addCookie(cookie);
       } else {
          out.println("<li>" + cookie.getName() + " => " + cookie.getValue() + "</li>");
       }

	}
}

%>

</ul>
<FORM ACTION="session.jsp" METHOD="post">
   <INPUT TYPE="submit" NAME="action" VALUE="Clean out Cookies" />
</FORM>

<BR><BR>
Session: <%= session.getId() %>
<BR>
<TABLE>
<TR BGCOLOR="lightgrey">
<TD>Item</td>
<TD>Value</TD>
</TR>
	<TR VALIGN="top">
	<TD ALIGN="right"><B>RemoteAddr: <B></TD><TD><PRE><%= request.getRemoteAddr() %></PRE></TD>
	<TR>
	<TR VALIGN="top">
	<TD ALIGN="right"><B>RemoteHost: <B></TD><TD><PRE><%= request.getRemoteHost() %></PRE></TD>
	<TR>
	<TR VALIGN="top">
	<TD ALIGN="right"><B>RemoteUser: <B></TD><TD><PRE><%= request.getRemoteUser() %></PRE></TD>
	<TR>
<%
Enumeration keys = session.getAttributeNames();
while (keys.hasMoreElements()) {
   String item = (String)keys.nextElement();
   Object v = session.getAttribute(item);
   String value = v == null ? "null" : v.toString();
	%>
	<TR VALIGN="top">
	<TD ALIGN="right"><B><%= item %>: <B></TD><TD><PRE><%= value %></PRE></TD>
	<TR>
	<%
}

if (fileLocation == null)
{
    String tmpDir = System.getProperty("java.io.tmpdir");

    fileLocation = new StringBuffer()
    .append(tmpDir)
    .append(tmpDir.endsWith(File.separator) ? "" : File.separator)
    .append("session.txt")
    .toString();
}

if (action != null) {
    if ("Clean out Session".equals(action))
    {
        for (Enumeration e = session.getAttributeNames(); e.hasMoreElements(); )
        {
            String attribute = (String) e.nextElement();
            if (!attribute.equals("username")) {
                session.removeAttribute(attribute);
            }
        }
    }
else
{
   %>Result of Serialized Session:<ul><% 
FileOutputStream fileout = new FileOutputStream(fileLocation);
ObjectOutputStream s = new ObjectOutputStream(fileout);
Enumeration attributes = session.getAttributeNames();
long currentSize = 0;
while (attributes.hasMoreElements()) {
   String name = (String)attributes.nextElement();
   Object o = session.getAttribute(name);
   if (o instanceof Serializable) {
      if (name.equals("search_objects")) {
          Iterator it = ((Hashtable)o).values().iterator();
          while (it.hasNext()) {
              Object resultItem = it.next();
                  com.zoomlane.search.SearchResults results = (com.zoomlane.search.SearchResults)resultItem;
                  String className = "";
                  String loaded = "NOT loaded";
                  if (results.getObjects().size() > 0) {
                        com.zoomlane.entity.Entity entity = (com.zoomlane.entity.Entity)results.getObjects().iterator().next();
                        className = entity.getClass().getName();
                        if (entity.isFullyLoaded()) {
                          loaded = "is fully loaded";
                        }
                    }
                  s.writeObject(results);
                  File file = new File(fileLocation);
                  out.println("<li>Serialized: search_object: searchPage: " + results.getSearchResultsPage() + ", searchId: " + results.getSearchId() + ", size: " + results.getObjects().size() + ", " + className + ", " + loaded + ", object size: " + ( ((double)file.length() - (double)currentSize) / (double)results.getObjects().size() ) + ", search_object size: " + (file.length() - currentSize) + " -> " + file.length() + "</li>");
                  currentSize = file.length();
          }
      } else {
          s.writeObject(o);
          File file = new File(fileLocation);
          out.println("<li>Serialized: " + name + ": " + (file.length() - currentSize) + " -> " + file.length() + "</li>");
          currentSize = file.length();
      }
   } else {
      out.println("<li>Object not serializable: " + name+ "</li>");
   }
}
out.println("</ul>");
s.flush();

}}
%>

</TABLE>
<FORM ACTION="session.jsp" METHOD="post">
   File Location: <INPUT TYPE="text" NAME="fileLocation" VALUE="<%= fileLocation %>">
   <INPUT TYPE="submit" NAME="action" VALUE="Test Serialize Session">

   <INPUT TYPE="submit" NAME="action" VALUE="Clean out Session">
</FORM>

</BODY>
</HTML>
