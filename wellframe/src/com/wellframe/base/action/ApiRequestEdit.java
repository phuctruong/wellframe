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

public class ApiRequestEdit extends SecureAction {

   private static Logger m_log = Config.getLogger(ApiRequestEdit.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaObjectForm voForm = (DynaObjectForm) form;

      String redisplay = mapping.getParameter();
      if (!Util.isBlankOrNull(request.getParameter("id"))) {
         Long id = Util.toLong(request.getParameter("id"), null);
         debug("Loading ApiRequest: " + id);
         ApiRequest apiRequest = new ApiRequest();
         apiRequest.setPK(id);
         apiRequest.loadFullInfo();
         if (request.getParameter("copy") != null) apiRequest.setPK(null);
         voForm.setVo(apiRequest);
      } else if (Util.isBlankOrNull(redisplay)) {
         debug("Displaying New ApiRequest Entry");
         ApiRequest apiRequest = new ApiRequest();
         voForm.setVo(apiRequest);

      } else {
         ApiRequest apiRequest = (ApiRequest)voForm.getVo();
         debug("Errors in form redisplay: " + voForm.getActionErrors().size() + ", " + voForm.getActionErrors());
         if (getErrors(request).size() == 0) {
            addErrorMessage(request, "Save Successful");
         }
         debug("redisplay current ApiRequest in form");
      }

      return mapping.findForward("DISPLAY_PAGE");
   }

}