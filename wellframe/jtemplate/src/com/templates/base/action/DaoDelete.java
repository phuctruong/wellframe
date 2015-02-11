/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
///   <token name="className" replaceText="entity" replaceTextPattern="JAVA" />
///   <token name="description" replaceText="class_description_here" />
////==========================================================================
package com.templates.base.action;

import java.io.*;
import java.util.*;
import java.text.*;

import javax.servlet.http.*;

import org.apache.log4j.Logger;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.templates.dao.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.zoomlane.search.*;

public class DaoDelete extends SecureAction {

   private static Logger m_log = Config.getLogger(DaoDelete.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      Long id = Util.toLong(request.getParameter("id"), null);
      Dao entity = Dao.findByDaoKey(id);

      if (entity != null) {
         entity.delete();
      }
      SearchResults searchResults = SearchResults.getInstance(request);
      if (searchResults != null) searchResults.removeObject(entity);      
      return mapping.findForward("SUCCESS");
   }
}
/// </foreachEntityProperty>

