<%
if ("true".equals(com.zoomlane.util.Config.getProperty("login.required.admin"))) {
  if (session.getAttribute("username") == null) {
     response.sendRedirect("login.jsp");
     return;
  }
}
%>

