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

public class DaoSearchForm extends SecureAction {

   private static Logger m_log = Config.getLogger(DaoSearchForm.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaSearchForm voForm = (DynaSearchForm) form;

      String redisplay = mapping.getParameter();
      if (Util.isBlankOrNull(redisplay)) {
         debug("Loading Dao");
         Dao entity = new Dao();
         voForm.setVo(entity);
      } else {
         debug("Errors in form redisplay: " + voForm.getActionErrors().size() + ", " + voForm.getActionErrors());
         saveErrors(request, voForm.getActionErrors());
         debug("redisplay current Dao in form");
      }
      return mapping.findForward("DISPLAY_PAGE");
   }

}
/// </foreachEntityProperty>

