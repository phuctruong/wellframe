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

public class UserDisplay extends SecureAction {

   private static Logger m_log = Config.getLogger(UserDisplay.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      Long id = Util.toLong(request.getParameter("id"), null);
      User user = User.findByUserKey(id);

      // Code to support ajax editing
      if (request.getParameter("_fieldName") != null) {
          request.setAttribute("_fieldName", request.getParameter("_fieldName"));
          request.setAttribute("_hideAjaxDiv", Util.S_INTEGER_ONE);
      }
      request.setAttribute("user", user);

      return mapping.findForward("DISPLAY_PAGE");
   }

}
