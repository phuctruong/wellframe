package com.wellframe.action;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.log4j.*;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.google.gson.*;
import com.wellframe.gson.request.*;
import com.wellframe.gson.response.*;

import com.wellframe.dao.*;
import com.wellframe.util.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.zoomlane.struts.form.*;

public class ProcessSpamFilter extends BaseAction {

    private static Logger m_log = Config.getLogger(ProcessSpamFilter.class);
    public Logger getLogger() {return m_log;}

    public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gson = new Gson();

        // TODO: Depending on the version, process the message using different versions of the spam filter
        String version = Util.toString(request.getParameter("version"), "1.0");

        // Default to 10 seconds wait
        Integer maxWait = Util.toInteger(request.getParameter("max_wait"), 10000);

        String jsonRequest = request.getParameter("request");

        // Save a record of the requests
        ApiRequest apiRequest = new ApiRequest();
        apiRequest.setVersion(version);
        apiRequest.setMaxWait(maxWait);
        apiRequest.setRequest(jsonRequest);
        apiRequest.save();

        // Check to make sure the request exists
        // This is an example of how to handle errors
        if (Util.isBlankOrNull(jsonRequest)) {
            String jsonResponse = processError(apiRequest, "Missing JSON Request Parameter");
            response.getOutputStream().print(jsonResponse);
            return null;
        }

        // TODO: Process using MQ instead of real time

        // Process the request
        List<EmailCheckResult> emailCheckResults = new ArrayList();

        SpamFilterRequest spamFilterRequest = null;

        try {
            spamFilterRequest = gson.fromJson(jsonRequest, SpamFilterRequest.class);
        } catch (Exception e) {
            String jsonResponse = processError(apiRequest, "Can't parse JSON String: " + e.toString());
            response.getOutputStream().print(jsonResponse);
            return null;
        }


        for (EmailToCheck emailToCheck : spamFilterRequest.emailsToCheck) {
            EmailCheckResult emailCheckResult = new EmailCheckResult();
            emailCheckResult.id = emailToCheck.id;
            emailCheckResult.status = AppUtil.checkSpam(emailToCheck.message);
            emailCheckResults.add(emailCheckResult);
        }

        // Create the json response
        SpamFilterResponse spamFilterResponse = new SpamFilterResponse();
        spamFilterResponse.emailCheckResults = emailCheckResults;
        String jsonResponse = gson.toJson(spamFilterResponse);

        // Save the response
        ApiResponse apiResponse = new ApiResponse();
        apiResponse.setApiRequestKey(apiRequest.getApiRequestKey());
        apiResponse.setResponse(jsonResponse);
        apiResponse.save();

        // Send back the response
        response.getOutputStream().print(jsonResponse);
        return null;

    }


    public String processError(ApiRequest apiRequest, String errorMessage) throws Exception {
        Gson gson = new Gson();
        SpamFilterError error = new SpamFilterError();
        error.error = errorMessage;
        String jsonResponse = gson.toJson(error);

        // Save the error 
        ApiResponse apiResponse = new ApiResponse();
        apiResponse.setApiRequestKey(apiRequest.getApiRequestKey());
        apiResponse.setResponse(jsonResponse);
        apiResponse.save();
        return jsonResponse;
    }

}

