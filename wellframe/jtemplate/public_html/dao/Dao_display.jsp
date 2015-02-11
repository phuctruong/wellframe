<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%@ include file="../_java/security.jsp" %>
<%@ include file="../_java/Dao/Dao_display.jsp" %>

<HTML>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">

<BODY bgcolor="#ffffff">

<FORM ACTION="Dao_search.jsp" METHOD="post" NAME="find_all"></FORM>

<UL>
<LI> <A HREF="Dao_edit.jsp">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="Dao_search.jsp">Search</A>
</UL>

<table width="100%" border="0" cellspacing="0" cellpadding="0">

<%-- ////
    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="LongValue" />
//// --%>
  <TR VALIGN="top"> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">Dao: <Dao:display id="Dao" property="LongValue" /></td>
  </TR>
<%-- ////
    /// </foreachEntityProperty>
//// --%>
<%-- //// ============================= INTEGER =======================================
    /// <foreachEntityProperty where="dataType=integer">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="integer_field" />
    ///   <token name="_REMOVE" replaceText=' inputId="text"' />
//// --%>  
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    integer_field:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="IntegerValue">123</Dao:display>
    </td>
  </TR>
<%-- //// ============================= LONG =======================================
    /// </foreachEntityProperty>    
    /// <foreachEntityProperty where="dataType=long">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="long_field" />
//// --%>
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    long_field:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="LongValue" />
    </td>
  </TR>
<%-- //// ============================= BOOLEAN =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=boolean">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="label" replaceText="boolean_field" />
//// --%>  
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    boolean_field:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="BooleanValue" filterType="boolean"/>
    </td>
  </TR>
<%-- //// ============================= FLOAT =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=float">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="label" replaceText="float_field" />
    ///   <token name="_REMOVE" replaceText=' filterType="percentage" filterMaximumFractionDigits="2"' />
//// --%>
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    float_field:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="FloatValue" />
    </td>
  </TR>
<%-- //// ============================= STRING =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=string">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
//// --%>  
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    string_field:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="StringValue" />
    </td>
  </TR>
<%-- //// ============================= DATE =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=date">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="date_field" />
    ///   <token name="_REMOVE" replaceText=' filterType="datetime"' />
//// --%>
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    date_field:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="DateValue"/>
    </td>
  </TR>
<%-- //// ============================= VECTOR =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=vector">
    ///   <token name="functionName" replaceText="VectorValue" />
    ///   <token name="label" replaceText="vector_field" />
    ///   <token name="_REMOVE" replaceText=' selectOptionsList="Dao"' />
//// --%>
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    vector_field:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="VectorValue" selectOptionsList="Dao"/>
    </td>
  </TR>    
<%-- //// ============================= FOREIGN VECTOR =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=foreignVector">
    ///   <token name="functionName" replaceText="ForeignVector" />
    ///   <token name="label" replaceText="foreign_vector" />
    ///   <token name="_REMOVE" replaceText=' selectOptionsList="Dao"' />
//// --%>
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    foreign_vector:
    </td><td width="2%" class="tableContent">&nbsp;</td><td width="86%" class="tableContent">
    <Dao:display id="Dao" property="ForeignVector" selectOptionsList="Dao"/>
    </td>
  </TR>    
<%-- //// ============================= FILE =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=file, displayAs=link">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="file_field" />
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    file_field:
    </TD>
      <TD ALIGN="LEFT">
      <Dao:display id="Dao" property="FileValue" replaceText="FileName">
      <Dao:display id="Dao" property="FileValueId" replaceText="FileId">
      <Dao:display id="Dao" property="FileValueExtension" replaceText="FileExtension">
      <A HREF="<%= com.zoomlane.util.Config.getProperty("document.servlet") %>/FileId.FileExtension" target="new_window">FileName</A>
      </Dao:display>
      </Dao:display>
      </Dao:display>
      </TD>
  </TR>      
    /// </foreachEntityProperty>    
    /// <foreachEntityProperty where="displayInSearchResults=true, dataType=file, displayAs=image">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="file_field" />
    ///   <token name="documentServlet" replaceText="../DocumentServlet" />
    ////--%>
  <TR VALIGN="top"> 
    <td width="12%" class="tableLabel" align="right">
    file_field:
    </TD>
      <TD ALIGN="LEFT">
      <Dao:display id="Dao" property="FileValue" replaceText="FileName">
      <Dao:display id="Dao" property="FileValueId" replaceText="FileId">
      <Dao:display id="Dao" property="FileValueExtension" replaceText="FileExtension">
      <img src="../DocumentServlet/FileId.FileExtension" ALT="FileName">
      </Dao:display>
      </Dao:display>
      </Dao:display>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
//// --%>
  
</table>
<BR>

<merge:flushDebugLogs />

</BODY>
</html>

<%-- ////
/// </foreachEntityProperty>
//// --%>

