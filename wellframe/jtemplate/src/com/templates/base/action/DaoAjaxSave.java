/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
///   <token name="className" replaceText="entity" replaceTextPattern="JAVA" />
///   <token name="description" replaceText="class_description_here" />
////==========================================================================
package com.templates.base.action;

import java.io.*;
import java.math.*;
import java.util.*;
import java.text.*;

import javax.servlet.http.*;

import org.apache.log4j.*;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import com.templates.dao.*;
import com.zoomlane.util.*;
import com.zoomlane.util.jsp.*;
import com.zoomlane.struts.form.*;

public class DaoAjaxSave extends SecureAction {

   private static Logger m_log = Config.getLogger(DaoAjaxSave.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
       Long id = Util.toLong(request.getParameter("id"), null);
       Dao entity = Dao.findByDaoKey(id);

       String fieldName = request.getParameter("_fieldName");

       request.setAttribute("entity", entity);
       request.setAttribute("_fieldName", fieldName);
       request.setAttribute("_hideAjaxDiv", "1");

<%-- //// ============================= STRING =======================================
    /// <foreachEntityProperty where="dataType=string">
    ///   <token name="functionName" replaceText="FunctionName" />
    ///   <token name="functionName" replaceText="stringField" replaceTextPattern="JAVA" />
//// --%>
        if ("stringField".equals(fieldName)) {
            try {
                entity.setFunctionName(request.getParameter("stringField"));
                entity.save();
            } catch (Exception e) {
                request.setAttribute("ajaxErrorMessage", "Error saving stringField: " + e);
                return mapping.findForward("FAIL");
            }
        }
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= INTEGER =======================================
    /// <foreachEntityProperty where="dataType=integer">
    ///   <token name="functionName" replaceText="FunctionName" />
    ///   <token name="functionName" replaceText="integerField" replaceTextPattern="JAVA" />
//// --%>
        if ("integerField".equals(fieldName)) {
            String value = request.getParameter("integerField");
            if (Util.isBlankOrNull(value)) {
                if (entity.getFunctionName() != null) {
                    entity.setFunctionName(null);
                    entity.save();
                }
            } else {
                Integer valueAsInteger = Util.toInteger(value, null);
                if (valueAsInteger == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid integer value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    entity.setFunctionName(valueAsInteger);
                    entity.save();
                }
            }
        }
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= LONG =======================================
    /// <foreachEntityProperty where="dataType=long">
    ///   <token name="functionName" replaceText="FunctionName" />
    ///   <token name="functionName" replaceText="longField" replaceTextPattern="JAVA" />
//// --%>
        if ("longField".equals(fieldName)) {
            String value = request.getParameter("longField");
            if (Util.isBlankOrNull(value)) {
                if (entity.getFunctionName() != null) {
                    entity.setFunctionName(null);
                    entity.save();
                }
            } else {
                Long valueAsLong = Util.toLong(value, null);
                if (valueAsLong == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid long value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    entity.setFunctionName(valueAsLong);
                    entity.save();
                }
            }
        }
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= FLOAT =======================================
    /// <foreachEntityProperty where="dataType=float">
    ///   <token name="functionName" replaceText="FunctionName" />
    ///   <token name="functionName" replaceText="floatField" replaceTextPattern="JAVA" />
//// --%>
        if ("floatField".equals(fieldName)) {
            String value = request.getParameter("floatField");
            if (Util.isBlankOrNull(value)) {
            } else {
                Float valueAsFloat = Util.toFloat(value, null);
                if (valueAsFloat == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid float value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    entity.setFunctionName(valueAsFloat);
                    entity.save();
                }
            }
        }
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= BIGDecimal =======================================
    /// <foreachEntityProperty where="dataType=bigDecimal">
    ///   <token name="functionName" replaceText="FunctionName" />
    ///   <token name="functionName" replaceText="bigDecimalField" replaceTextPattern="JAVA" />
//// --%>
        if ("bigDecimalField".equals(fieldName)) {
            String value = request.getParameter("bigDecimalField");
            if (Util.isBlankOrNull(value)) {
                if (entity.getFunctionName() != null) {
                    entity.setFunctionName(null);
                    entity.save();
                }
            } else {
                BigDecimal valueAsBigDecimal = Util.toBigDecimal(value, null);
                if (valueAsBigDecimal == null) {
                    request.setAttribute("ajaxErrorMessage", "Invalid BigDecimal value: " + value);
                    return mapping.findForward("FAIL");
                } else {
                    entity.setFunctionName(valueAsBigDecimal);
                    entity.save();
                }
            }
        }
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>
<%-- //// ============================= DATE =======================================
    /// <foreachEntityProperty where="dataType=date">
    ///   <token name="functionName" replaceText="FunctionName" />
    ///   <token name="functionName" replaceText="dateField" replaceTextPattern="JAVA" />
    ///   <token name="dateFormat" replaceText="dateFormat" />
//// --%>
        if ("dateField".equals(fieldName)) {
            String value = request.getParameter("dateField");
            if (Util.isBlankOrNull(value)) {
                if (entity.getFunctionName() != null) {
                    entity.setFunctionName(null);
                    entity.save();
                }
            } else {
                try {
                    Date valueAsDate = Util.parseDate(value, "dateFormat", null);
                    entity.setFunctionName(valueAsDate);
                    entity.save();
                } catch (Exception e) {
                    request.setAttribute("ajaxErrorMessage", "Invalid date value (dateFormat): " + value);
                    return mapping.findForward("FAIL");
                }
            }
        }
<%-- //// ================================================================================
    /// </foreachEntityProperty>    
//// --%>


       return mapping.findForward("DISPLAY_PAGE");

   }

}
/// </foreachEntityProperty>

