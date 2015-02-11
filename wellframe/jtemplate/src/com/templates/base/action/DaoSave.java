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

public class DaoSave extends SecureAction {

   private static Logger m_log = Config.getLogger(DaoSave.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaObjectForm voForm = (DynaObjectForm) form;
      try {
         Dao entity = (Dao)voForm.getVo();
         debug("Entity: " + entity);
         if (voForm.getActionErrors().size() > 0) {
            debug("Errors in form: " + voForm.getActionErrors().size() + ", " + voForm.getActionErrors());
            addErrorMessages(request, voForm.getActionErrors());
            return mapping.findForward("FAIL");
         }
         debug("No errors saving: " + entity);
         entity.save();
         return mapping.findForward("SUCCESS");
      } catch (Exception e) {
         debug("Save errors: " + e);
         addErrorMessage(request, e.toString());
         return mapping.findForward("FAIL");
      }
   }

}
/// </foreachEntityProperty>

