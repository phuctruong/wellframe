<%-- ////
/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////--%>
<%@ include file="../_java/Dao/Dao_search.java" %>

<HTML>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">
<script type="text/javascript" src="../_js/calendar.js"></script>
<BODY>
<FORM ACTION="Dao_search.jsp" METHOD="post" NAME="find_all"></FORM>

<UL>
<LI> <A HREF="Dao_edit.jsp">New</A>
<LI> <A HREF="javascript:document.forms['find_all'].submit();">List All</A>
<LI> <A HREF="Dao_search.jsp">Search</A>
</UL>


<merge:text replaceText="Dao_list.jsp" withValue="Dao_search.jsp">
<FORM ACTION="Dao_list.jsp" NAME="form" METHOD="post">
</merge:text>
<INPUT TYPE="hidden" NAME="action" VALUE="search">
<Dao:display id="Dao" property="LongValue" replaceText="123">
<INPUT TYPE="hidden" NAME="id" VALUE="123">
</Dao:display>

<FONT color="red">
<merge:token token="errors" />
</FONT>
<TABLE>
    <TR VALIGN="top"><TD CLASS="tableHeading" colspan=2>Dao Search:</TD></TR>

<%-- //// ================================ INTEGER =====================================
    /// <foreachEntityProperty where="dataType=integer, searchType!=null, inputType!=select">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="integer_field" />
    ///   <token name="searchType" replaceText="like" />
    ///   <token name="searchInputSettings" replaceText="size=10" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">integer_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="IntegerValue" searchType="like">
      <INPUT TYPE="text" name="IntegerValue" size=10>
      </Dao:search>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>    
    /// <foreachEntityProperty where="dataType=integer, searchType!=null, inputType=select">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="integer_field" />
    ///   <token name="searchType" replaceText="exact" />
    ///   <token name="searchInputSettings" replaceText="size=3" />
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">integer_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="IntegerValue" searchType="exact">
      <SELECT NAME="IntegerValue" SIZE=3>
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:search>
      </TD>
    </TR>
//// --%>
<%-- //// ================================ LONG =====================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=long, searchType!=null, inputType!=select">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="long_field" />
    ///   <token name="searchType" replaceText="exact" />
    ///   <token name="searchInputSettings" replaceText="size=10" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">long_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="LongValue" searchType="exact">
      <INPUT TYPE="text" name="LongValue" size=10>
      </Dao:search>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=long, searchType!=null, inputType=select">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="long_field" />
    ///   <token name="searchType" replaceText="exact" />
    ///   <token name="searchInputSettings" replaceText="size=3" />
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">long_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="LongValue" searchType="exact">
      <SELECT NAME="LongValue" SIZE=3>
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:search>
      </TD>
    </TR>
//// --%>
<%-- //// ================================ BOOLEAN =====================================
    /// </foreachEntityProperty>    
    /// <foreachEntityProperty where="dataType=boolean">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="searchType" replaceText="exact" />
    ///   <token name="label" replaceText="boolean_field" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">boolean_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="BooleanValue" filterType="boolean" searchType="exact">
      <INPUT TYPE="checkbox" name="BooleanValue" VALUE="1">
      </Dao:search>
      </TD>
    </TR>
<%-- //// ================================ FLOAT =====================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=float">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="searchType" replaceText="like" />
    ///   <token name="label" replaceText="float_field" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">float_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="FloatValue" filterType="percentage" filterMaximumFractionDigits="2" searchType="like">
      <INPUT TYPE="text" name="FloatValue" VALUE="">
      </Dao:search>
      </TD>
    </TR>
<%-- //// ================================ STRING =====================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=string, searchType!=null, inputType=text">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
    ///   <token name="searchType" replaceText="like" />
    ///   <token name="searchInputSettings" replaceText="size=20" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">string_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="StringValue" searchType="like">
      <input TYPE="text" name="StringValue" size=20>
      </Dao:search>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=string, searchType!=null, inputType=select">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="string_field" />
    ///   <token name="searchType" replaceText="exact" />
    ///   <token name="searchInputSettings" replaceText="SIZE=3" />
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">string_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="StringValue" searchType="exact">
      <SELECT NAME="StringValue" SIZE=3>
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:search>
      </TD>
    </TR>
//// --%>
<%-- //// ================================ DATE =====================================    
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=date, searchType=dateRange">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="date_field" />
    ///   <token name="_REMOVE" replaceText='filterType="datetime" ' />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">date_field From:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="DateValue" inputId="from" filterType="datetime" searchType="dateFrom">
      <INPUT TYPE="text" name="DateValue" VALUE="">
      </Dao:search>
      <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['form'].elements['root.Dao.DateValue.from'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>
      </TD>
    </TR>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">To:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="DateValue" inputId="to" filterType="datetime" searchType="dateTo">
      <INPUT TYPE="text" name="DateValue" VALUE="">
      </Dao:search>
      <a href="javascript:function calendar () {return 0;}" onClick="popCalendar(document.forms['form'].elements['root.Dao.DateValue.to'], '../images/')"><IMG SRC="../images/calendar/calendar.gif" width=15 HEIGHT=15 BORDER=0></a>      
      </TD>
    </TR>
    
<%-- //// ================================ VECTOR =====================================    
    /// </foreachEntityProperty>
    
    /// <foreachEntityProperty where="dataType=vector, searchType!=null">
    ///   <token name="functionName" replaceText="VectorValue" />
    ///   <token name="label" replaceText="vector_field" />
    ///   <token name="searchType" replaceText="multipleOr" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">vector_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="VectorValue" selectOptionsList="Dao" searchType="multipleOr" >
      <SELECT NAME="test">
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:search>
      </TD>
    </TR>
<%-- //// ================================ FOREIGN_VECTOR =====================================    
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=foreignVector, searchType!=null">
    ///   <token name="functionName" replaceText="ForeignVector" />
    ///   <token name="label" replaceText="foreign_vector" />
    ///   <token name="searchType" replaceText="multipleOr" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">foreign_vector:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="ForeignVector" selectOptionsList="Dao" searchType="multipleOr" >
      <SELECT NAME="test">
      <OPTION>MA
      <OPTION>CA
      </SELECT>
      </Dao:search>
      </TD>
    </TR>
<%-- ////
//// --%>    
<%-- //// ================================ FILE =====================================
    /// </foreachEntityProperty>
    /// <foreachEntityProperty where="dataType=file, searchType!=null">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="file_field" />
    ///   <token name="searchType" replaceText="like" />
    ///   <token name="searchInputSettings" replaceText="size=20" />
//// --%>
    <TR VALIGN="top">
      <TD class="tableLabel" ALIGN="RIGHT">file_field:</TD>
      <TD class="tableContent">
      <Dao:search id="Dao" property="FileValue" inputType="text" searchType="like">
      <input TYPE="text" name="FileValue" size=20>
      </Dao:search>
      </TD>
    </TR>
<%-- ////
    /// </foreachEntityProperty>
//// --%>
    <TR VALIGN="top">
      <TD class="tableContent"></TD>
      <TD class="tableContent"><INPUT TYPE="submit" value="Search"></TD>
    </TR>
</TABLE>

</FORM>

<merge:flushDebugLogs />


<%-- ////
/// </foreachEntityProperty>
//// --%>

