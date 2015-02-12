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
import com.zoomlane.struts.action.*;

public abstract class SecureAction extends BaseAction {

   private Logger m_log = Logger.getLogger(SecureAction.class);
   private HttpSession session;

   public ActionForward processSecurity(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      session = request.getSession();
      if (session.getAttribute("admin_user") == null) {
         debug("Can't find user in session forward to login: " + mapping.findForward("LOGIN"));
         session.setAttribute("destinationUrlAfterLogin", request.getRequestURI());
         return mapping.findForward("LOGIN");
      }
      return null;
   }

   public User getUser() {
      return (User) session.getAttribute("admin_user");
   }
}
