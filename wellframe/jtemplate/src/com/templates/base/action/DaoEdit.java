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
import com.zoomlane.struts.form.*;

public class DaoEdit extends SecureAction {

   private static Logger m_log = Config.getLogger(DaoEdit.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaObjectForm voForm = (DynaObjectForm) form;

      String redisplay = mapping.getParameter();
      if (!Util.isBlankOrNull(request.getParameter("id"))) {
         Long id = Util.toLong(request.getParameter("id"), null);
         debug("Loading Dao: " + id);
         Dao entity = new Dao();
         entity.setPK(id);
         entity.loadFullInfo();
         if (request.getParameter("copy") != null) entity.setPK(null);
         voForm.setVo(entity);
      } else if (Util.isBlankOrNull(redisplay)) {
         debug("Displaying New Dao Entry");
         Dao entity = new Dao();
         voForm.setVo(entity);

      } else {
         Dao entity = (Dao)voForm.getVo();
         debug("Errors in form redisplay: " + voForm.getActionErrors().size() + ", " + voForm.getActionErrors());
         if (getErrors(request).size() == 0) {
            addErrorMessage(request, "Save Successful");
         }
         debug("redisplay current Dao in form");
      }

      return mapping.findForward("DISPLAY_PAGE");
   }

}
/// </foreachEntityProperty>

