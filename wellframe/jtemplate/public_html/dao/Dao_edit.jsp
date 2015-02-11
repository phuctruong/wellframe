<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%@ include file="../_java/security.jsp" %>
<%@ include file="../_java/Dao/Dao_edit.jsp" %>

<HTML>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">

<script type="text/javascript" src="../_js/calendar.js"></script>

<BODY bgcolor="#ffffff">
<FORM ACTION="Dao_search.jsp" METHOD="post" NAME="find_all"></FORM>

<UL>
<LI> <A HREF="Dao_edit.jsp">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="Dao_search.jsp">Search</A>
</UL>

<FORM ACTION="Dao_edit.jsp" NAME="form" METHOD="post">
<%-- ////
    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="LongValue" />
//// --%>
<Dao:display id="Dao" property="LongValue" replaceText="123">
<INPUT TYPE="hidden" NAME="id" VALUE="123">
</Dao:display>
<%-- ////
    /// </foreachEntityProperty>
//// --%>

<FONT color="red">
<merge:token token="errors" />
<merge:token token="saveSuccessful" />
</FONT>
<TABLE>
<%-- ////
    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="LongValue" />
//// --%>
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">Dao: <Dao:display id="Dao" property="LongValue" displayIfNull="New Entry"/></td>
  </tr>
<%-- ////
    /// </foreachEntityProperty>
//// --%>

<%-- //// ============================= INTEGER =======================================
    /// <foreachEntityProperty where="dataType=integer, inputType=text">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="integer_field" />
    ///   <token name="inputSettings" replaceText="SIZE=10" />
    ///   <token name="_REMOVE" replaceText=' inputId="text"' />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">integer_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="IntegerValue" inputId="text">
      <INPUT TYPE="text" name="IntegerValue" VALUE="" SIZE="10">
      </Dao:edit>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=integer, inputType=select">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="integer_field" />
    ///   <token name="inputSettings" replaceText="SIZE=3" />
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">integer_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="IntegerValue">
      <SELECT NAME="IntegerValue" SIZE=3>
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>
//// --%>
<%-- //// ============================= LONG =======================================
    /// </foreachEntityProperty>    
    /// <foreachEntityProperty where="dataType=long, inputType=text">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="long_field" />
    ///   <token name="inputSettings" replaceText="SIZE=10" />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">long_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="LongValue">
      <INPUT TYPE="text" name="LongValue" VALUE="" SIZE=10>
      </Dao:edit>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=long, inputType=select">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="long_field" />
    ///   <token name="inputSettings" replaceText="SIZE=3" />
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">long_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="LongValue">
      <SELECT NAME="LongValue" SIZE=3>
      <OPTION>MA</OPTION><OPTION>CA</OPTION>
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>
//// --%>

<%-- //// ============================= BOOLEAN =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=boolean, inputType=checkbox">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="label" replaceText="boolean_field" />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">boolean_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="BooleanValue" filterType="boolean">
      <INPUT TYPE="checkbox" name="BooleanValue" VALUE="1">
      </Dao:edit>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=boolean, inputType=select">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="label" replaceText="boolean_field" />
    ///   <token name="inputSettings" replaceText="SIZE=1" />
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">boolean_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="BooleanValue">
      <SELECT NAME="BooleanValue" SIZE=1>
      <OPTION>Yes</OPTION><OPTION>No</OPTION>
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>
//// --%>
<%-- //// ============================= FLOAT =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=float, inputType=text">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="label" replaceText="float_field" />
    ///   <token name="inputSettings" replaceText="SIZE=10" />
    ///   <token name="_REMOVE" replaceText=' filterType="percentage" filterMaximumFractionDigits="2"' />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">float_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="FloatValue" filterType="percentage" filterMaximumFractionDigits="2">
      <INPUT TYPE="text" name="FloatValue" VALUE="" SIZE=10>
      </Dao:edit>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=float, inputType=select">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="label" replaceText="float_field" />
    ///   <token name="inputSettings" replaceText="SIZE=1" />
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">float_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="FloatValue">
      <SELECT NAME="FloatValue" SIZE=1>
      <OPTION>Yes</OPTION><OPTION>No</OPTION>
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>
//// --%>
<%-- //// ============================= STRING =======================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=string, inputType=text">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
    ///   <token name="inputSettings" replaceText="SIZE=40" />
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">string_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="StringValue">
      <input TYPE="text" name="StringValue" SIZE=40>
      </Dao:edit>
      </TD>
    </TR>
//// --%>
<%-- ////    
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=string, inputType=textarea">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
    ///   <token name="inputSettings" replaceText=" ROWS=5 COLS=100" />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">string_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="StringValue">
      <textarea name="StringValue" ROWS=5 COLS=100></TEXTAREA>
      </Dao:edit>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=string, inputType=select">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
    ///   <token name="inputSettings" replaceText="SIZE=1" />
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">string_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="StringValue">
      <SELECT NAME="StringValue" SIZE=1>
      <OPTION>Yes</OPTION><OPTION>No</OPTION>
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>
//// --%>    
<%-- //// ============================= DATE =======================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=date, inputType=text">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="date_field" />
    ///   <token name="inputSettings" replaceText="SIZE=20" />
    ///   <token name="_REMOVE" replaceText=' filterType="datetime"' />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">date_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="DateValue" filterType="datetime">
      <INPUT TYPE="text" name="DateValue" VALUE="" SIZE=20>
      </Dao:edit>
      <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['form'].elements['root.Dao.DateValue'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>      
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=date, inputType=select">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="date_field" />
    ///   <token name="inputSettings" replaceText="SIZE=1" />
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">date_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="DateValue">
      <SELECT NAME="DateValue" SIZE=1>
      <OPTION>Yes</OPTION><OPTION>No</OPTION>
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>
//// --%>        
<%-- //// ============================= VECTOR =======================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=vector, inputType=select">
    ///   <token name="functionName" replaceText="VectorValue" />
    ///   <token name="label" replaceText="vector_field" />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">vector_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="VectorValue">
      <SELECT NAME="test">
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>
<%-- //// ============================= FOREIGN VECTOR =======================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=foreignVector, inputType=select">
    ///   <token name="functionName" replaceText="ForeignVector" />
    ///   <token name="label" replaceText="foreign_vector" />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">foreign_vector:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="ForeignVector">
      <SELECT NAME="test">
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:edit>
      </TD>
    </TR>    
<%-- //// ============================= FILE =======================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=file">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="file_field" />
//// --%>
    <TR valign="top">
      <TD class="tableLabel" ALIGN="RIGHT">file_field:</TD>
      <TD class="tableContent">
      <Dao:edit id="Dao" property="FileValue">
      <INPUT TYPE="file" name="FileValue">
      </Dao:edit>
      (<Dao:display id="Dao" property="FileValue" displayIfNull="No file uploaded yet."/>)
      </TD>
    </TR>
    
<%-- ////
    /// </foreachEntityProperty>
//// --%>
    <TR valign="top">
      <TD class="tableContent"></TD>
      <TD class="tableContent"><INPUT TYPE="submit" value="Save"></TD>
    </TR>
</TABLE>

</FORM>

<merge:flushDebugLogs />

<%-- ////
/// </foreachEntityProperty>
//// --%>

