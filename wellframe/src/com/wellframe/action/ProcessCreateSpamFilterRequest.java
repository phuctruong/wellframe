package com.wellframe.action;

import java.io.*;
import java.text.*;
import java.util.*;
import java.net.URLEncoder;

import javax.servlet.http.*;

import org.apache.log4j.*;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.google.gson.*;
import com.wellframe.gson.request.*;

import com.wellframe.dao.*;
import com.wellframe.util.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.zoomlane.struts.form.*;

public class ProcessCreateSpamFilterRequest extends BaseAction {

    private static Logger m_log = Config.getLogger(ProcessCreateSpamFilterRequest.class);
    public Logger getLogger() {return m_log;}

    public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {

        // Create the JSON based on the emails
        SpamFilterRequest spamFilterRequest = new SpamFilterRequest();
        List<EmailToCheck> emailsToCheck = new ArrayList();
        for (int i = 0;i < 3;i++) {
            Integer emailNumber = new Integer(i + 1);
            String email = request.getParameter("email" + emailNumber);
            if (Util.isBlankOrNull(email)) continue;
            EmailToCheck emailToCheck = new EmailToCheck();
            emailToCheck.id = emailNumber;
            emailToCheck.message = email;
            emailsToCheck.add(emailToCheck);
        }
        spamFilterRequest.emailsToCheck = emailsToCheck;

        // Assemble the URL variables
        List<String> urlParts = new ArrayList();

        String version = request.getParameter("version");
        if (!Util.isBlankOrNull(version)) urlParts.add("version=" + version);

        String maxWait = request.getParameter("max_wait");
        if (!Util.isBlankOrNull(maxWait)) urlParts.add("mail_wait=" + maxWait);

        Gson gson = new Gson();
        String jsonRequest = gson.toJson(spamFilterRequest);
        urlParts.add("request=" + jsonRequest);

        // Determine the base URL
        String baseUrl = request.getScheme() + "://" + request.getServerName();
        if (request.getServerPort() != 80) baseUrl += ":" + request.getServerPort();
        baseUrl += request.getContextPath();

        // Assemble the URL and sent to front end
        String apiRequestUrl = baseUrl + "/api/spam-filter?" + Util.join("&", urlParts);
        request.setAttribute("apiRequestUrl", apiRequestUrl);

        request.setAttribute("version", version);
        request.setAttribute("maxWait", maxWait);
        request.setAttribute("jsonRequest", jsonRequest);

        return mapping.findForward("DISPLAY_PAGE");
    }



}

