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
import com.zoomlane.search.*;
import com.zoomlane.struts.form.*;
import com.zoomlane.util.jsp.*;

public class ApiRequestSearchPerform extends SecureAction {

   private static Logger m_log = Config.getLogger(ApiRequestSearchPerform.class);
   public Logger getLogger() {return m_log;}

   public ActionForward process(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
      DynaSearchForm voForm = (DynaSearchForm) form;
      if (voForm.getActionErrors().size() > 0) {
         return mapping.findForward("FAIL");
      }
      SearchInfo searchInfo = voForm.getSearchInfo();

      ApiRequest apiRequest = new ApiRequest();
      SearchOrderBy orderBy = new SearchOrderBy();
      orderBy.setField(apiRequest.getPKName());
      orderBy.setOrderType(SearchOrderBy.SEARCH_ORDER_TYPE_ASC);
      searchInfo.addSearchOrderBy(orderBy);

      Vector results = apiRequest.findBySearchInfo(searchInfo);
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
