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
import com.zoomlane.search.*;

public class UserDelete extends SecureAction {

   private static Logger m_log = Config.getLogger(UserDelete.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      Long id = Util.toLong(request.getParameter("id"), null);
      User user = User.findByUserKey(id);

      if (user != null) {
         user.delete();
      }
      SearchResults searchResults = SearchResults.getInstance(request);
      if (searchResults != null) searchResults.removeObject(user);      
      return mapping.findForward("SUCCESS");
   }
}
