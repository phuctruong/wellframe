<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%--
//========= THIS CODE DOESN'T DO ANYTHING (AUTOCOMPLETE HACK) =======
// Please don't erase, this is for my autocomplete - phuc
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.templates.dao.*;
import com.templates.customtag.*;
import com.oreilly.servlet.*;
//=============== END AUTOCOMPLETE IMPORT CODE ========================
--%>
<%@ page import="java.util.*,java.io.*,java.net.URL, java.lang.*, java.text.*, javax.mail.*" %>
<%@ page import="org.apache.log4j.Category" %>
<%@ page import="com.templates.dao.*,com.templates.customtag.*" %>
<%@ page import="com.zoomlane.util.*,com.zoomlane.util.jsp.*,com.zoomlane.search.*" %>

<%@ taglib uri="/WEB-INF/jsp/zoomlane.tld" prefix="merge" %>
<%@ taglib uri="/WEB-INF/jsp/Dao.tld" prefix="Dao" %>

<%
JspDebug debug = new JspDebug(request);

boolean formSubmitted = false;
if ("POST".equals(request.getMethod())) formSubmitted = true;

if (formSubmitted) {
    debug.log("Searching Dao");
    JspMerge merge = JspMerge.getInstance(request);

    merge.setToken("errors", "");
    Long pk = Util.toLong(request.getParameter("id"), null);

    Dao entity = new Dao();
    DaoSearchTag entityTag = new DaoSearchTag();
    Vector errors = entityTag.setFromRequest(request, merge, "Dao", entity);

    if (errors == null || errors.size() == 0) {
        debug.log("No errors: searching");

        SearchInfo searchInfo = entityTag.getSearchInfo();
        Vector results = entity.findBySearchInfo(searchInfo);

        SearchResults searchResults = entityTag.newSearchResults(request, results, searchInfo);
        searchResults.sendRedirect(response, "Dao_list.jsp");
        return;
    } else {
        debug.log("found errors: " + errors.size());
        merge.setToken("errors", "<UL><LI>" + Util.join("<LI>", errors) + "</UL>");
    }

} else {
    debug.log("Form not submitted");
    JspMerge merge = JspMerge.newInstance(request);
    SearchResults searchResults = SearchResults.getInstance(request);
    if (searchResults != null) {
        InputObjectCache cache = InputObjectCache.getInstance(request);
        cache.setInputObjects(searchResults.getInputObjects());
    }
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

