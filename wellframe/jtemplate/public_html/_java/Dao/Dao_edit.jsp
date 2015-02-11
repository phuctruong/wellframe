<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%@ page import="java.util.*,java.io.*,java.net.URL, java.lang.*, java.text.*, javax.mail.*" %>
<%@ page import="org.apache.log4j.Category" %>
<%@ page import="com.templates.dao.*,com.templates.customtag.*" %>
<%@ page import="com.zoomlane.util.*,com.zoomlane.util.jsp.*" %>

<%@ taglib uri="/WEB-INF/jsp/zoomlane.tld" prefix="merge" %>
<%@ taglib uri="/WEB-INF/jsp/Dao.tld" prefix="Dao" %>

<%
JspDebug debug = new JspDebug(request);

boolean formSubmitted = false;
if ("POST".equals(request.getMethod())) formSubmitted = true;

if (formSubmitted) {
    debug.log("Saving Dao");
    JspMerge merge = JspMerge.getInstance(request);
    merge.setToken("errors", "");

    Dao entity = new Dao();

    DaoEditTag entityTag = new DaoEditTag();
    Vector errors = entityTag.setFromRequest(request, merge, "Dao", entity);
    Long pk = Util.toLong(request.getParameter("id"), null);
    if (pk == null && entityTag.m_multipartRequest != null) {
        pk = Util.toLong(entityTag.m_multipartRequest.getParameter("id"), null);
    }
    entity.setPK(pk);

    debug.log("----------- Editing PK: " + entity.getPK());
    if (errors == null || errors.size() == 0) {
        debug.log("No errors: saving");
        // Clear the JspMerge if needed for cross page input
        //--------------------------------------------------------------------------
        entity.save();
//        response.sendRedirect("Dao_list.jsp");
        merge.setToken("saveSuccessful", "Save successful");
//        return;
    } else {
        debug.log("found errors: " + errors.size());
        merge.setToken("errors", "<UL><LI>" + Util.join("<LI>", errors) + "</UL>");
    }

} else {
    debug.log("Form not submitted");
    JspMerge merge = JspMerge.newInstance(request);
    merge.setToken("errors", "");
    Dao entity = new Dao();
    Long pk = Util.toLong(request.getParameter("id"), null);
    entity.setPK(pk);
    merge.setEntity("Dao", entity);
}
%>
<%-- ////
/// </foreachEntityProperty>
//// --%>

