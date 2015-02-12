package com.wellframe.base.taglib;

import java.sql.*;
import java.text.*;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;

import com.wellframe.dao.*;


public class SelectOptionsFactoryBase {

   private static Logger m_log = Config.getLogger(SelectOptionsFactoryBase.class);

   public SelectOptionsFactoryBase() {
   }
   public static final String S_LIST_YES_NO = "S_LIST_YES_NO";

   public static Hashtable m_cache = new Hashtable();

   public Vector getSelectOptions(String list) throws Exception {
      if (list.equals(S_LIST_YES_NO)) {
         if (m_cache.containsKey(S_LIST_YES_NO)) {
            return(Vector) m_cache.get(S_LIST_YES_NO);
         }
         Vector yesNo = new Vector();
         yesNo.add(new String[] {"-1", ""});
         yesNo.add(new String[] {"1", "Yes"});
         yesNo.add(new String[] {"0", "No"});
         m_cache.put(S_LIST_YES_NO, yesNo);
         return yesNo;
      }

      return null;
   }


   public Vector getSelectOptions(String list, Vector entities) throws Exception {

      return null;
   }

}
