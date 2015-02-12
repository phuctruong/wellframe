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

public class ApiResponseAjaxSave extends SecureAction {

   private static Logger m_log = Config.getLogger(ApiResponseAjaxSave.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
       Long id = Util.toLong(request.getParameter("id"), null);
       ApiResponse apiResponse = ApiResponse.findByApiResponseKey(id);

       String fieldName = request.getParameter("_fieldName");

       request.setAttribute("apiResponse", apiResponse);
       request.setAttribute("_fieldName", fieldName);
       request.setAttribute("_hideAjaxDiv", "1");

        if ("response".equals(fieldName)) {
            try {
                apiResponse.setResponse(request.getParameter("response"));
                apiResponse.save();
            } catch (Exception e) {
                request.setAttribute("ajaxErrorMessage", "Error saving response: " + e);
                return mapping.findForward("FAIL");
            }
        }
        if ("apiResponseKey".equals(fieldName)) {
            String value = request.getParameter("apiResponseKey");
            if (Util.isBlankOrNull(value)) {
                if (apiResponse.getApiResponseKey() != null) {
                    apiResponse.setApiResponseKey(null);
                    apiResponse.save();
                }
            } else {
                Long valueAsLong = Util.toLong(value, null);
                if (valueAsLong == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid long value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    apiResponse.setApiResponseKey(valueAsLong);
                    apiResponse.save();
                }
            }
        }
        if ("apiRequestKey".equals(fieldName)) {
            String value = request.getParameter("apiRequestKey");
            if (Util.isBlankOrNull(value)) {
                if (apiResponse.getApiRequestKey() != null) {
                    apiResponse.setApiRequestKey(null);
                    apiResponse.save();
                }
            } else {
                Long valueAsLong = Util.toLong(value, null);
                if (valueAsLong == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid long value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    apiResponse.setApiRequestKey(valueAsLong);
                    apiResponse.save();
                }
            }
        }
        if ("lastUpdated".equals(fieldName)) {
            String value = request.getParameter("lastUpdated");
            if (Util.isBlankOrNull(value)) {
                if (apiResponse.getLastUpdated() != null) {
                    apiResponse.setLastUpdated(null);
                    apiResponse.save();
                }
            } else {
                try {
                    Date valueAsDate = Util.parseDate(value, "MM/dd/yyyy K:mm a", null);
                    apiResponse.setLastUpdated(valueAsDate);
                    apiResponse.save();
                } catch (Exception e) {
                    request.setAttribute("ajaxErrorMessage", "Invalid date value (MM/dd/yyyy K:mm a): " + value);
                    return mapping.findForward("FAIL");
                }
            }
        }
        if ("dateCreated".equals(fieldName)) {
            String value = request.getParameter("dateCreated");
            if (Util.isBlankOrNull(value)) {
                if (apiResponse.getDateCreated() != null) {
                    apiResponse.setDateCreated(null);
                    apiResponse.save();
                }
            } else {
                try {
                    Date valueAsDate = Util.parseDate(value, "MM/dd/yyyy hh:mm aa", null);
                    apiResponse.setDateCreated(valueAsDate);
                    apiResponse.save();
                } catch (Exception e) {
                    request.setAttribute("ajaxErrorMessage", "Invalid date value (MM/dd/yyyy hh:mm aa): " + value);
                    return mapping.findForward("FAIL");
                }
            }
        }


       return mapping.findForward("DISPLAY_PAGE");

   }

}
