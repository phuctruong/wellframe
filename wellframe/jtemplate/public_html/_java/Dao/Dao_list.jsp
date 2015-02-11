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
import com.zoomlane.search.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.templates.dao.*;
import com.templates.customtag.*;
import com.oreilly.servlet.*;
//=============== END AUTOCOMPLETE IMPORT CODE ========================
--%>
<%@page import="java.util.*,java.io.*,java.net.URL, java.lang.*, java.text.*, javax.mail.*" %>
<%@page import="com.templates.dao.*,com.zoomlane.util.*" %>
<%@page import="com.zoomlane.util.jsp.*,com.zoomlane.entity.*, com.zoomlane.search.*" %>

<%@ taglib uri="/WEB-INF/jsp/zoomlane.tld" prefix="merge" %>
<%@ taglib uri="/WEB-INF/jsp/Dao.tld" prefix="Dao" %>

<%
JspDebug debug = new JspDebug(request);

SearchResults searchResults = SearchResults.getInstance(request);
Collection results = null;
if (searchResults != null) {
    results = searchResults.getCurrentPageObjects();
} else {
    response.sendRedirect("Dao_search.jsp");
    return;
}
JspMerge merge = JspMerge.newInstance(request);
Iterator it = results.iterator();
while (it.hasNext()) {
    JspMerge row = merge.addMergeRow("results");
    row.setEntity("Dao", (Entity)it.next());
}
if (results.size() > 0) {
    merge.setToken("remove_no_results_section", "1");
}
merge.setToken("search_get_string", searchResults.getGetString());
merge.setToken("search_results_id", searchResults.getSearchId());
merge.setToken("current_page", searchResults.getCurrentPage());
merge.setToken("results_per_page", searchResults.getResultsPerPage());
merge.setToken("total_results", searchResults.getTotalResults());

%>
<%--////
/// </foreachEntityProperty>
////--%>



