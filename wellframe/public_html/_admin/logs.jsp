<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.log4j.*" %>
<%@ include file="security.jsp" %>
<%
// logs.jsp --- Display log4j logs
//
// Created:    Thu Feb 20 2003
%>
<A HREF="index.html">Main Menu</A>
<BR><BR>

<h1>Log Files Contents:</h1>

<ul>
<%
        List result = new ArrayList();

        Logger root = Logger.getRootLogger();
        Enumeration rootAppenders = root.getAllAppenders();

        while(rootAppenders.hasMoreElements())
        {
            Object obj = rootAppenders.nextElement();
            if (obj instanceof FileAppender) {
               String file = ((FileAppender)obj).getFile();
               result.add(file);
            } else if (obj instanceof AsyncAppender) {
               Enumeration logs = ((AsyncAppender)obj).getAllAppenders();
               while(logs.hasMoreElements()) {
                   Object subAppend = logs.nextElement();
                   if(!(subAppend instanceof FileAppender)) continue;
                   String file = ((FileAppender)subAppend).getFile();
                   result.add(file);
               }
            }

        }
        
  for (Iterator iterator = result.iterator(); iterator.hasNext(); )
  {
    String file = (String) iterator.next();
%>

   <li>
      <a href="#<%= new File(file).getName() %>"><%= file %></a>

<% } %>
</ul>

<%
  for (Iterator contentsIterator = result.iterator();
       contentsIterator.hasNext(); )
  {
    String file = (String) contentsIterator.next();

    try
   {
       File f = new File(file);
       String error = null;
       if (!f.exists())
           error = "File " + file + " does not exist";
       else if (!f.canRead())
           error = "File " + file + " cannot be read";
       else if (f.isDirectory())
           error = "File " + file + " is a directory";
%>

<a name="<%= f.getName() %>"></a> <h2>Contents of 
<% 
File debugFile = new File(file);
out.println(debugFile.getAbsolutePath());
%></h2>

<pre>
 
<% if (error != null) { %>
<%= error %>
<% } else {
    FileReader reader = new FileReader(file);
    int c = -1;
    while ((c = reader.read()) != -1)
       out.write(c);

} %>
</pre>

<%
    }
    catch (Throwable t)
    {
%>

Got exception:
<pre>
<%= "" + t %>
</pre>

<%
    }
   }
%>

<% // logs.jsp ends here %>
