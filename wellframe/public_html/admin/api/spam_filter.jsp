<%@ include file="includes.jsp" %>
<%@ include file="header.jsp" %>

<h1>Spam Filter API Test Page</h1>


<p>To test the Spam Filter API, enter your emails below and click on "Generate API Request URL", then "Make API Call".</p>

<h2>Step 1: Enter Test Data</h2>

<form action="ajax-create-spam-filter-request.do" method="post" class="label-180"> 
    
    <label>Version</label><input type="text" name="version" value="1.0" /><br/>
    <label>Max Wait</label><input type="text" name="max_wait" value="5000" /> milliseconds<br/>
    <label>Email 1 (Random Spam)</label><textarea name="email1" style="width: 70%;height: 50px"><bean:write name="spamSample" /></textarea><br/>
    <label>Email 2 (Random HAM)</label><textarea name="email2" style="width: 70%;height: 50px"><bean:write name="hamSample" /></textarea><br/>
    <label>Email 3 (Up to you)</label><textarea name="email3" style="width: 70%;height: 50px"></textarea><br/>

    <div class="data">
		<input type="button" value="Generate API Request URL" onclick="reloadSectionWithForm('ajax_spamFilterApiRequest', this.form)" />
    </div>
</form>
<br clear="all" />
<br clear="all" />

<h2>Step 2: API Request</h2>
<div id="ajax_spamFilterApiRequest">
<%@ include file="ajax_spam_filter_request.jsp" %>
</div>

<h2>Step 3: API Response</h2>

<form action="" method="post">
    <textarea id="ajax_spamFilterApiResponse" style="width: 70%;height: 100px"></textarea>
</form>


<%@ include file="footer.jsp" %>

