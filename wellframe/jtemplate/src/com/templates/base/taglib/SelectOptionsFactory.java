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

public class SelectOptionsFactory extends SelectOptionsFactoryBase {

  private static Logger m_log = Config.getLogger(SelectOptionsFactory.class);

  public SelectOptionsFactory() {}

  public Vector getSelectOptions(String list) throws Exception {
      return super.getSelectOptions(list);
  }

}
/// </foreachEntityProperty>

