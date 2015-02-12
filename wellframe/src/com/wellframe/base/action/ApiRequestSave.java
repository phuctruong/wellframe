package com.wellframe.base.action;

import java.io.*;
import java.util.*;
import java.text.*;

import javax.servlet.http.*;

import org.apache.log4j.Logger;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.wellframe.dao.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.zoomlane.struts.form.*;

public class ApiRequestSave extends SecureAction {

   private static Logger m_log = Config.getLogger(ApiRequestSave.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaObjectForm voForm = (DynaObjectForm) form;
      try {
         ApiRequest apiRequest = (ApiRequest)voForm.getVo();
         debug("Entity: " + apiRequest);
         if (voForm.getActionErrors().size() > 0) {
            debug("Errors in form: " + voForm.getActionErrors().size() + ", " + voForm.getActionErrors());
            addErrorMessages(request, voForm.getActionErrors());
            return mapping.findForward("FAIL");
         }
         debug("No errors saving: " + apiRequest);
         apiRequest.save();
         return mapping.findForward("SUCCESS");
      } catch (Exception e) {
         debug("Save errors: " + e);
         addErrorMessage(request, e.toString());
         return mapping.findForward("FAIL");
      }
   }

}
