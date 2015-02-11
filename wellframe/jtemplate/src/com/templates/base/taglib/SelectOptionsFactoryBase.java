/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="description" replaceText="class_description_here" />
////==========================================================================
package com.templates.base.taglib;

import java.sql.*;
import java.text.*;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;

import com.templates.dao.*;


public class SelectOptionsFactoryBase {

   private static Logger m_log = Config.getLogger(SelectOptionsFactoryBase.class);

   public SelectOptionsFactoryBase() {
   }
   public static final String S_LIST_YES_NO = "S_LIST_YES_NO";

   /// <foreachEntityProperty where="type=list">
   ///   <token name="className" replaceText="Dao" />
   public static final String LIST_Dao = "Dao";
   /// </foreachEntityProperty>
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
      /// <foreachEntityProperty where="type=list">
      ///   <token name="className" replaceText="Dao" />
      ///   <token name="finder" replaceText="findAll" />
      ///   <token name="actualValue" replaceText="IntegerValue" />
      ///   <token name="displayValue" replaceText="StringValue" />
      if (list.equals(LIST_Dao)) {
         if (m_cache.containsKey(LIST_Dao)) {
            return(Vector) m_cache.get(LIST_Dao);
         }
         Dao entity = new Dao();
         Vector entities = entity.findAll();
         Vector options = getSelectOptions(list, entities);
         m_cache.put(LIST_Dao, options);
         return options;
      }
      /// </foreachEntityProperty>

      return null;
   }


   public Vector getSelectOptions(String list, Vector entities) throws Exception {
      /// <foreachEntityProperty where="type=list">
      ///   <token name="className" replaceText="Dao" />
      ///   <token name="finder" replaceText="findAll" />
      ///   <token name="actualValue" replaceText="IntegerValue" />
      ///   <token name="displayValue" replaceText="StringValue" />
      if (list.equals(LIST_Dao)) {
         Vector options = new Vector();
         Iterator it = entities.iterator();
         while (it.hasNext()) {
            Dao entity = (Dao) it.next();
            if (entity.getIntegerValue() == null || entity.getStringValue() == null) continue;
            options.add(new String[] {Util.toString(entity.getIntegerValue(), Util.S_BLANK), Util.toString(entity.getStringValue(), Util.S_BLANK)});
         }
         return options;
      }
      /// </foreachEntityProperty>

      return null;
   }

}
/// </foreachEntityProperty>

