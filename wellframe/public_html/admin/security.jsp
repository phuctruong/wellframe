<%
if (session.getAttribute("admin_user") == null) {
   if ("true".equals(com.zoomlane.util.Config.getProperty("login.required.admin"))) {
      response.sendRedirect("login.jsp");
      return;
   } else {
      session.setAttribute("admin_user", "admin");
      session.setAttribute("admin_username", "admin");
   }
}
%>

