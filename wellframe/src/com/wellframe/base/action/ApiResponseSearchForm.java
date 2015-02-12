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

public class ApiResponseSearchForm extends SecureAction {

   private static Logger m_log = Config.getLogger(ApiResponseSearchForm.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaSearchForm voForm = (DynaSearchForm) form;

      String redisplay = mapping.getParameter();
      if (Util.isBlankOrNull(redisplay)) {
         debug("Loading ApiResponse");
         ApiResponse apiResponse = new ApiResponse();
         voForm.setVo(apiResponse);
      } else {
         debug("Errors in form redisplay: " + voForm.getActionErrors().size() + ", " + voForm.getActionErrors());
         saveErrors(request, voForm.getActionErrors());
         debug("redisplay current ApiResponse in form");
      }
      return mapping.findForward("DISPLAY_PAGE");
   }

}
