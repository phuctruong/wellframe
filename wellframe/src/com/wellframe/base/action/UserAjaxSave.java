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

public class UserAjaxSave extends SecureAction {

   private static Logger m_log = Config.getLogger(UserAjaxSave.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
       Long id = Util.toLong(request.getParameter("id"), null);
       User user = User.findByUserKey(id);

       String fieldName = request.getParameter("_fieldName");

       request.setAttribute("user", user);
       request.setAttribute("_fieldName", fieldName);
       request.setAttribute("_hideAjaxDiv", "1");

        if ("username".equals(fieldName)) {
            try {
                user.setUsername(request.getParameter("username"));
                user.save();
            } catch (Exception e) {
                request.setAttribute("ajaxErrorMessage", "Error saving username: " + e);
                return mapping.findForward("FAIL");
            }
        }
        if ("password".equals(fieldName)) {
            try {
                user.setPassword(request.getParameter("password"));
                user.save();
            } catch (Exception e) {
                request.setAttribute("ajaxErrorMessage", "Error saving password: " + e);
                return mapping.findForward("FAIL");
            }
        }
        if ("userKey".equals(fieldName)) {
            String value = request.getParameter("userKey");
            if (Util.isBlankOrNull(value)) {
                if (user.getUserKey() != null) {
                    user.setUserKey(null);
                    user.save();
                }
            } else {
                Long valueAsLong = Util.toLong(value, null);
                if (valueAsLong == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid long value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    user.setUserKey(valueAsLong);
                    user.save();
                }
            }
        }
        if ("dateCreated".equals(fieldName)) {
            String value = request.getParameter("dateCreated");
            if (Util.isBlankOrNull(value)) {
                if (user.getDateCreated() != null) {
                    user.setDateCreated(null);
                    user.save();
                }
            } else {
                try {
                    Date valueAsDate = Util.parseDate(value, "MM/dd/yyyy K:mm a", null);
                    user.setDateCreated(valueAsDate);
                    user.save();
                } catch (Exception e) {
                    request.setAttribute("ajaxErrorMessage", "Invalid date value (MM/dd/yyyy K:mm a): " + value);
                    return mapping.findForward("FAIL");
                }
            }
        }


       return mapping.findForward("DISPLAY_PAGE");

   }

}
