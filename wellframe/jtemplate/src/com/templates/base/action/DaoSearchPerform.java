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
import com.zoomlane.search.*;
import com.zoomlane.struts.form.*;
import com.zoomlane.util.jsp.*;

public class DaoSearchPerform extends SecureAction {

   private static Logger m_log = Config.getLogger(DaoSearchPerform.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaSearchForm voForm = (DynaSearchForm) form;
      if (voForm.getActionErrors().size() > 0) {
         return mapping.findForward("FAIL");
      }
      SearchInfo searchInfo = voForm.getSearchInfo();

      Dao entity = new Dao();
      SearchOrderBy orderBy = new SearchOrderBy();
      orderBy.setField(entity.getPKName());
      orderBy.setOrderType(SearchOrderBy.SEARCH_ORDER_TYPE_ASC);
      searchInfo.addSearchOrderBy(orderBy);

      Vector results = entity.findBySearchInfo(searchInfo);
      String sql = "SELECT distinct " + searchInfo.getSelectFieldsSql() +
         " FROM " + searchInfo.getFromSql() +
         " " + searchInfo.getWhereSql() + " " + searchInfo.getGroupBySql() + " " + 
         searchInfo.getOrderBySql();
      debug("findBySearchInfo: " + sql + " (" + Util.join(", ", searchInfo.getBindParams()) + ")"); 

      SearchResults searchResults = new SearchResults();
      searchResults.setObjects(results);
      searchResults.addInstanceToSession(request);
      voForm.clearSearchInfo();

      return mapping.findForward("DISPLAY_SEARCH_RESULTS");
   }

}
/// </foreachEntityProperty>

