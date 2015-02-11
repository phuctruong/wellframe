<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%@ page import="java.util.*,java.io.*,java.net.URL, java.lang.*, java.text.*, javax.mail.*" %>
<%@ page import="org.apache.log4j.*" %>
<%@ page import="com.templates.dao.*,com.zoomlane.util.*,com.zoomlane.search.*" %>

<%
SearchResults searchResults = SearchResults.getInstance(request);
Long id = Util.toLong(request.getParameter("id"), null);
Dao d = new Dao();
if (!Util.isZeroOrNull(id)) {
  d.setPK(id);
}
searchResults.removeObject(d);
d.delete();
searchResults.sendRedirect(response, "Dao_list.jsp");
%>

<%-- ////
/// </foreachEntityProperty>
//// --%>

