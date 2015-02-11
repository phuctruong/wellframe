<%@page import="com.zoomlane.util.jsp.*" %>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.http.*" %>
<%
JspDebug debug = new JspDebug(request);

JspMerge merge = JspMerge.newInstance(request);
merge.setToken("beta", "This is a test of beta");
merge.setToken("removeThis", "");
%>
<%@ taglib uri="/WEB-INF/jsp/zoomlane.tld" prefix="merge" %>

<HTML>
<link rel="stylesheet" href="../_css/javawriter.css" type="text/css">

<BODY bgcolor="#ffffff">
<p>Definition of possible merge tags</p>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeToken: Replace text with token</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">alpha gamma</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">JspMerge merge = JspMerge.newInstance(request);<br>
      merge.setToken(&quot;beta&quot;, &quot;This is a test of beta&quot;);</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">&lt;merge:token replaceText="gamma" token="beta" 
      &gt;alpha gamma&lt;/merge:token&gt; </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"><merge:token replaceText="gamma" token="beta">alpha 
      gamma</merge:token> </td>
  </tr>
</table>
<BR>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeToken: Merge with token</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">alpha gamma</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">JspMerge merge = JspMerge.newInstance(request);<br>
      merge.setToken(&quot;beta&quot;, &quot;This is a test of beta&quot;);</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">&lt;merge:token token="beta" &gt;alpha 
      gamma&lt;/merge:token&gt; </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"><merge:token token="beta">alpha 
      gamma</merge:token></td>
  </tr>
</table>
<BR>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeText: Merge with value</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">alpha gamma</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">[None]</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">&lt;merge:text withValue="This works" &gt;alpha 
      gamma&lt;/merge:text&gt; </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"><merge:text withValue="This works">alpha gamma</merge:text> 
    </td>
  </tr>
</table>
<BR>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeText: Replace text with value: form</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">&lt;form action=&quot;search_results.jsp&quot; 
      method=&quot;post&quot;&gt; Some Form &lt;/form&gt;</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">[None]</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">
      <p>&lt;merge:text replaceText="search_results.jsp"&gt; withValue="search_form.jsp"&lt;form 
        action=&quot;search_form.jsp&quot; method=&quot;post&quot;&gt;Some Form: 
        &lt;merge:text withValue=&quot;Foo&quot;&gt;Test&lt;/merge:text&gt;&lt;/form&gt;&lt;/merge:text&gt; 
      </p>
      </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2">
		<merge:text replaceText="search_results.jsp" withValue="search_form.jsp" >
		<form action="search_results.jsp" method="post" NAME="test">
		Some Form: <merge:text withValue="Foo">Test</merge:text>
                <INPUT TYPE="button" value="Check action" ONCLICK="alert('action: ' + document.forms['test'].action)">
		</form>
		</merge:text>		
	 </td>
  </tr>
</table>
<BR>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeText: Replace text with value twice: 
      html link</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">&lt;A HREF=&quot;test.html&quot;&gt;this 
      works&lt;/A&gt;</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">[None]</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2"> &lt;merge:text replaceText=&quot;this&quot; 
      withValue=&quot;aaaaaaa&quot;&gt;<br>
      &lt;merge:text replaceText=&quot;works&quot; withValue=&quot;Heh&quot;&gt;<br>
      &lt;A HREF=&quot;test.html&quot;&gt;this works&lt;/A&gt;<br>
      &lt;/merge:text&gt;<br>
      &lt;/merge:text&gt;</td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2">
	<merge:text replaceText="this" withValue="aaaaaaa">
		<merge:text replaceText="works" withValue="Heh">
			<A HREF="test.html">this works</A>
		</merge:text>
	</merge:text>

 </td>
  </tr>
</table>
<BR>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeRemove: Remove whole section</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">This should be Removed</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">[None]</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2"> 
      <p>&lt;merge:remove&gt;This should be Removed&lt;/merge:remove&gt;</p>
    </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"> 
		<merge:remove>This should be removed</merge:remove> </td>
  </tr>
</table>
<BR>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeRemove: Remove because token is defined</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">This should be Removed</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">JspMerge merge = JspMerge.newInstance(request);<br>
      merge.setToken(&quot;removeThis&quot;, &quot;&quot;);</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2"> 
      <p>&lt;merge:remove ifTokenExists=&quot;removeThis&quot;&gt;This should 
        be Removed: &lt;merge:token token=&quot;beta&quot;/&gt;&lt;/merge:remove&gt;</p>
    </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"> <merge:remove ifTokenExists="removeThis">This 
      should be removed: <merge:token token="beta"/></merge:remove></td>
  </tr>
</table>
<BR>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="12%" class="tableHeading">&nbsp;</td>
    <td colspan=2 class="tableHeading">MergeRemove: Don't remove since token not 
      defined </td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent" align="right">Before: </td>
    <td width="2%" class="tableContent">&nbsp;</td>
    <td width="86%" class="tableContent">This should be not be removed</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Java Code: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2">[none]</td>
  </tr>
  <tr> 
    <td width="12%" class="tableContent2" align="right">Custom Tag: </td>
    <td width="2%" class="tableContent2">&nbsp;</td>
    <td width="86%" class="tableContent2"> 
      <p>&lt;merge:remove ifTokenExists=&quot;doNotRemoveThis&quot;&gt;This should 
        be not be removed &lt;merge:token token=&quot;beta&quot;/&gt;&lt;/merge:remove&gt;</p>
    </td>
  </tr>
  <tr> 
    <td width="12%" class="tableLabel2" align="right">Result: </td>
    <td width="2%" class="tableLabel2">&nbsp;</td>
    <td width="86%" class="tableLabel2"> <merge:remove ifTokenExists="doNotRemoveThis">This 
      should not be removed: <merge:token token="beta"/></merge:remove></td>
  </tr>
</table>
<BR>

<%= debug.flushLogs() %>

</BODY>
</html>

