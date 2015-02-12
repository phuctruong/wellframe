<%@ include file="includes.jsp" %>
<logic:notPresent name="apiRequestUrl">
    <form action="" method="post">
        <textarea name="request" id="apiRequestUrl" style="width: 70%;height: 100px"></textarea>
        <br/>
    </form>
</logic:notPresent>
<logic:present name="apiRequestUrl">
    <form action="" method="post">
        <textarea name="request" id="apiRequestUrl" style="width: 70%;height: 100px"><bean:write name="apiRequestUrl" /></textarea>
        <br/>
    </form>
    
    <form action="api/spam-filter" method="post">
        <input type="hidden" name="version" value="<bean:write name="version" />" />
        <input type="hidden" name="max_wait" value="<bean:write name="maxWait" />" />
        <input type="hidden" name="request" value="<bean:write name="jsonRequest" />" />
        <input type="button" value="Make API Call" onclick="$('#ajax_spamFilterApiResponse').html('loading... please wait');reloadSectionWithForm('ajax_spamFilterApiResponse', this.form)" />
    </form>
</logic:present>

