<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%@ include file="../_java/security.jsp" %>
<%@ include file="../_java/Dao/Dao_list.jsp" %>

<HTML>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">

<script type="text/javascript" src="../_js/calendar.js"></script>
<SCRIPT type="text/javascript" src="../_js/pager.js">
</SCRIPT>

<BODY bgcolor="#ffffff">
<FORM ACTION="Dao_search.jsp" METHOD="post" NAME="find_all"></FORM>

<UL>
<LI> <A HREF="Dao_edit.jsp">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="Dao_search.jsp">Search</A>
<LI> <merge:token token="search_get_string" replaceText="search_info"><A HREF="Dao_search.jsp?search_info">Modify Search</A></merge:token>
</UL>


<form action="search_form.jsp" name="search_results_info">
<merge:token token="search_results_id" replaceText="123">
<input type="hidden" name="search_id" VALUE="123">
</merge:token>
<input type="hidden" name="search_results_page" value="Dao_list.jsp">
<merge:token token="current_page" replaceText="28">
<input type="hidden" name="current_page" value="28">
</merge:token>
<merge:token token="results_per_page" replaceText="10">
<input type="hidden" name="results_per_page" value="10">
</merge:token>
<merge:token token="total_results" replaceText="323">
<input type="hidden" name="total_results" value="323">
</merge:token>
</form>


Search Results Dao:
<BR><BR>

<font class="content"><script type="text/javascript">writeSearchResultsSummary('search_results_info');</script><BR></font>
<script type="text/javascript">writePageNav('search_results_info');</script>
<BR><BR>

<TABLE>
<%-- //// ------------------------- COLUMNS LABELS --------------------------------- --%>
    <TR class="tableHeading">
<%-- //// ============================= INTEGER =======================================
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=integer">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="integer_field" />
    ////--%>
      <TD ALIGN="LEFT">integer_field</TD>
<%-- //// ============================= LONG =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=long">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="long_field" />
    ////--%>
      <TD ALIGN="LEFT">long_field</TD>
<%-- //// ============================= BOOLEAN =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=boolean">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="label" replaceText="boolean_field" />
    ////--%>
      <TD ALIGN="LEFT">boolean_field</TD>
<%-- //// ============================= FLOAT =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=float">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="label" replaceText="float_field" />
    ////--%>
      <TD ALIGN="LEFT">float_field</TD>
<%-- //// ============================= STRING =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=string">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
    ////--%>
      <TD ALIGN="LEFT">string_field</TD>
<%-- //// ============================= DATE =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=date">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="date_field" />
    ////--%>
      <TD ALIGN="LEFT">date_field</TD>
<%-- //// ============================= VECTOR =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=vector">
    ///   <token name="functionName" replaceText="VectorValue" />
    ///   <token name="label" replaceText="vector_field" />
    ////--%>
      <TD ALIGN="LEFT">vector_field</TD>

<%-- //// ============================= FOREIGN VECTOR =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=foreignVector">
    ///   <token name="functionName" replaceText="ForeignVector" />
    ///   <token name="label" replaceText="foreign_vector" />
    ////--%>
      <TD ALIGN="LEFT">foreign_vector</TD>

<%-- //// ============================= FILE =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=file">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="file_field" />
    ////--%>
      <TD ALIGN="LEFT">file_field</TD>

    <%-- ////
    /// </foreachEntityProperty>
    ////--%>
      <TD ALIGN="LEFT">Details</TD>
      <TD ALIGN="LEFT">Edit</TD>
      <TD ALIGN="LEFT">Delete</TD>
    </TR>

<%-- //// ------------------------- COLUMNS VALUES --------------------------------- --%>
    <merge:rows name="results" alternateColors="tableContent,tableContent2" replaceColor="tableContent">
    <TR class="tableContent">
<%-- //// ============================= INTEGER =======================================
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=integer">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="integer_field" />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="IntegerValue">123</Dao:display></TD>
<%-- //// ============================= LONG =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=long">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="long_field" />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="LongValue">4363</Dao:display></TD>
<%-- //// ============================= BOOLEAN =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=boolean">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="label" replaceText="boolean_field" />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="BooleanValue" filterType="boolean">True</Dao:display></TD>
<%-- //// ============================= FLOAT =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=float">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="label" replaceText="float_field" />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="FloatValue" filterType="currency">$2.230</Dao:display></TD>
<%-- //// ============================= STRING =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=string">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="StringValue">Test</Dao:display></TD>
<%-- //// ============================= DATE =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=date">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="date_field" />
    ///   <token name="_REMOVE" replaceText=' filterType="datetime"' />
    ////--%>
      <TD ALIGN="LEFT">
      <Dao:display id="Dao" fromRows="results" property="DateValue" filterType="datetime">2/23/92</Dao:display>
      </TD>      
<%-- //// ============================= VECTOR =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=vector">
    ///   <token name="functionName" replaceText="VectorValue" />
    ///   <token name="label" replaceText="vector_field" />
    ///   <token name="_REMOVE" replaceText=' selectOptionsList="Dao"' />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="VectorValue" selectOptionsList="Dao" joinText="<li>" addLeftText="<li>">abc</Dao:display></TD>
<%-- //// ============================= FOREIGN VECTOR =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=foreignVector">
    ///   <token name="functionName" replaceText="ForeignVector" />
    ///   <token name="label" replaceText="foreign_vector" />
    ///   <token name="_REMOVE" replaceText=' selectOptionsList="Dao"' />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="ForeignVector" selectOptionsList="Dao" joinText="<li>" addLeftText="<li>">abc</Dao:display></TD>
<%-- //// ============================= FILE =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=file, displayAs=link">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="file_field" />
      <TD ALIGN="LEFT">
      <Dao:display id="Dao" fromRows="results" property="FileValue" replaceText="FileName">
      <Dao:display id="Dao" fromRows="results" property="FileValueId" replaceText="FileId">
      <Dao:display id="Dao" fromRows="results" property="FileValueExtension" replaceText="FileExtension">
      <A HREF="<%= com.zoomlane.util.Config.getProperty("document.servlet") %>/FileId.FileExtension" target="new_window">FileName</A>
      </Dao:display>
      </Dao:display>
      </Dao:display>
      </TD>
    /// </foreachEntityProperty>    
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=file, displayAs=image">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="file_field" />
    ///   <token name="documentServlet" replaceText="../DocumentServlet" />
    ////--%>
      <TD ALIGN="LEFT">
      <Dao:display id="Dao" fromRows="results" property="FileValue" replaceText="FileName">
      <Dao:display id="Dao" fromRows="results" property="FileValueId" replaceText="FileId">
      <Dao:display id="Dao" fromRows="results" property="FileValueExtension" replaceText="FileExtension">
      <img src="../DocumentServlet/FileId.FileExtension" ALT="FileName">
      </Dao:display>
      </Dao:display>
      </Dao:display>
      </TD>
<%-- ////
    /// </foreachEntityProperty>    
    ////--%>
<%-- //// ============================= ACTION LINKS =======================================    
    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="LongValue" />
    ////--%>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="LongValue" replaceText="123">
      <A HREF="Dao_display.jsp?id=123">Details</A></Dao:display></TD>
      <TD ALIGN="LEFT"><Dao:display id="Dao" fromRows="results" property="LongValue" replaceText="123">
      <A HREF="Dao_edit.jsp?id=123">Edit</A></Dao:display></TD>
      <TD ALIGN="LEFT">
      <Dao:display id="Dao" fromRows="results" property="LongValue" replaceText="123">
      <merge:token token="search_get_string" replaceText="search_info">
      <A HREF="javascript: if (confirm('Are you sure you want to delete this item?')) {document.location='Dao_delete.jsp?id=123&search_info';}">Delete</A>
      </merge:token>
      </Dao:display>
      </TD>
    <%-- ////
    /// </foreachEntityProperty>
    ////--%>
    </TR>
    </merge:rows>
    <merge:remove ifTokenExists="remove_no_results_section">
    <TR><TD colspan=20 class="tableContent">No Results Found</TD></TR>
    </merge:remove>
</TABLE>

</FORM>

<merge:flushDebugLogs />

<%-- ////
/// </foreachEntityProperty>
//// --%>


