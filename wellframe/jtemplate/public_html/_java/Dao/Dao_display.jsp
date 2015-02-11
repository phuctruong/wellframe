<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%@page import="com.zoomlane.util.jsp.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="com.templates.dao.*,com.zoomlane.util.*" %>

<%@ taglib uri="/WEB-INF/jsp/zoomlane.tld" prefix="merge" %>
<%@ taglib uri="/WEB-INF/jsp/Dao.tld" prefix="Dao" %>

<%
JspDebug debug = new JspDebug(request);

JspMerge merge = JspMerge.newInstance(request);
Dao entity = new Dao();
Long pk = Util.toLong(request.getParameter("id"), new Long(1));
entity.setPK(pk);
merge.setEntity("Dao", entity);

%>
<%-- ////
/// </foreachEntityProperty>
//// --%>

