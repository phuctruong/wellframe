/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="description" replaceText="class_description_here" />
////==========================================================================
package com.templates.base.taglib;

import java.io.IOException;
import java.util.*;

import javax.servlet.*;
import javax.servlet.jsp.*;
import javax.servlet.jsp.tagext.*;
import javax.servlet.http.*;

import org.apache.struts.taglib.html.*;
import org.apache.struts.taglib.bean.*;
import org.apache.struts.taglib.logic.IterateTag;
import org.apache.struts.action.*;
import org.apache.struts.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.util.*;

public class ZWriteTag extends com.zoomlane.struts.taglib.ZWriteTag {
   private static Logger m_log = Logger.getLogger(ZWriteTag.class);

   public Vector getSelectOptionValues(String optionListName) {
      try {
         SelectOptionsFactory factory = new SelectOptionsFactory();
         Vector values = factory.getSelectOptions(m_selectOptionsList);
         return values;
      } catch (Exception e) {
         m_jspd.warn("Exception: " + e);
         m_log.error("Exception: " + e, e);
      }
      return new Vector();
   }
}
/// </foreachEntityProperty>

