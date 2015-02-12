package com.wellframe.base.action;

import java.io.*;
import java.math.*;
import java.util.*;
import java.text.*;

import javax.servlet.http.*;

import org.apache.log4j.*;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.wellframe.dao.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.zoomlane.struts.form.*;

public class ApiRequestAjaxSave extends SecureAction {

   private static Logger m_log = Config.getLogger(ApiRequestAjaxSave.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
       Long id = Util.toLong(request.getParameter("id"), null);
       ApiRequest apiRequest = ApiRequest.findByApiRequestKey(id);

       String fieldName = request.getParameter("_fieldName");

       request.setAttribute("apiRequest", apiRequest);
       request.setAttribute("_fieldName", fieldName);
       request.setAttribute("_hideAjaxDiv", "1");

        if ("version".equals(fieldName)) {
            try {
                apiRequest.setVersion(request.getParameter("version"));
                apiRequest.save();
            } catch (Exception e) {
                request.setAttribute("ajaxErrorMessage", "Error saving version: " + e);
                return mapping.findForward("FAIL");
            }
        }
        if ("request".equals(fieldName)) {
            try {
                apiRequest.setRequest(request.getParameter("request"));
                apiRequest.save();
            } catch (Exception e) {
                request.setAttribute("ajaxErrorMessage", "Error saving request: " + e);
                return mapping.findForward("FAIL");
            }
        }
        if ("maxWait".equals(fieldName)) {
            String value = request.getParameter("maxWait");
            if (Util.isBlankOrNull(value)) {
                if (apiRequest.getMaxWait() != null) {
                    apiRequest.setMaxWait(null);
                    apiRequest.save();
                }
            } else {
                Integer valueAsInteger = Util.toInteger(value, null);
                if (valueAsInteger == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid integer value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    apiRequest.setMaxWait(valueAsInteger);
                    apiRequest.save();
                }
            }
        }
        if ("apiRequestKey".equals(fieldName)) {
            String value = request.getParameter("apiRequestKey");
            if (Util.isBlankOrNull(value)) {
                if (apiRequest.getApiRequestKey() != null) {
                    apiRequest.setApiRequestKey(null);
                    apiRequest.save();
                }
            } else {
                Long valueAsLong = Util.toLong(value, null);
                if (valueAsLong == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid long value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    apiRequest.setApiRequestKey(valueAsLong);
                    apiRequest.save();
                }
            }
        }
        if ("lastUpdated".equals(fieldName)) {
            String value = request.getParameter("lastUpdated");
            if (Util.isBlankOrNull(value)) {
                if (apiRequest.getLastUpdated() != null) {
                    apiRequest.setLastUpdated(null);
                    apiRequest.save();
                }
            } else {
                try {
                    Date valueAsDate = Util.parseDate(value, "MM/dd/yyyy K:mm a", null);
                    apiRequest.setLastUpdated(valueAsDate);
                    apiRequest.save();
                } catch (Exception e) {
                    request.setAttribute("ajaxErrorMessage", "Invalid date value (MM/dd/yyyy K:mm a): " + value);
                    return mapping.findForward("FAIL");
                }
            }
        }
        if ("dateCreated".equals(fieldName)) {
            String value = request.getParameter("dateCreated");
            if (Util.isBlankOrNull(value)) {
                if (apiRequest.getDateCreated() != null) {
                    apiRequest.setDateCreated(null);
                    apiRequest.save();
                }
            } else {
                try {
                    Date valueAsDate = Util.parseDate(value, "MM/dd/yyyy hh:mm aa", null);
                    apiRequest.setDateCreated(valueAsDate);
                    apiRequest.save();
                } catch (Exception e) {
                    request.setAttribute("ajaxErrorMessage", "Invalid date value (MM/dd/yyyy hh:mm aa): " + value);
                    return mapping.findForward("FAIL");
                }
            }
        }


       return mapping.findForward("DISPLAY_PAGE");

   }

}
