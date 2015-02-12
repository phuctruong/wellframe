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

public class ApiResponseDelete extends SecureAction {

   private static Logger m_log = Config.getLogger(ApiResponseDelete.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      Long id = Util.toLong(request.getParameter("id"), null);
      ApiResponse apiResponse = ApiResponse.findByApiResponseKey(id);

      if (apiResponse != null) {
         apiResponse.delete();
      }
      SearchResults searchResults = SearchResults.getInstance(request);
      if (searchResults != null) searchResults.removeObject(apiResponse);      
      return mapping.findForward("SUCCESS");
   }
}
