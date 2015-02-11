<%
com.zoomlane.homes.util.AppUtil.removeMarketingCookie(response);
com.zoomlane.homes.util.AppUtil.addTurnOffTrackingCookie(response);
if ("login".equals(request.getParameter("action"))) {
   String username = request.getParameter("username");
   String password = request.getParameter("password");
   String adminPassword = com.zoomlane.util.Config.getProperty("login.password.admin");
   if (username.equals("admin") && password.equals(adminPassword)) {
      session.setAttribute("admin_user", "admin");
      session.setAttribute("admin_username", "admin");
      %>
      Login successful
	  <br/>
	  <a href="index.jsp">Continue</a>
      <%
      return;
   } else {
      %>
      Login incorrect try again.
      <BR><BR>
      <%
   }
}
%>
<FORM ACTION="../admin/login.jsp" METHOD="post">
   <INPUT TYPE="hidden" NAME="action" VALUE="login">
   <TABLE>
      <TR><TD>Username: </TD><TD><INPUT TYPE="text" NAME="username"></TD></TR>
      <TR><TD>Password: </TD><TD><INPUT TYPE="password" NAME="password"></TD></TR>
      <TR><TD></TD><TD><INPUT TYPE="submit" value="login"></TD></TR>
   </TABLE>
</FORM>
