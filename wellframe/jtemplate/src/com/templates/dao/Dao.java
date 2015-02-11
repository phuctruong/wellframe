/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="description" replaceText="class_description_here" />
///   <token name="className" replaceText="Dao" />
////===================================================================================================
package com.templates.dao;

import java.sql.*;
import java.text.*;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;

/**
 * class_description_here
 */
public class Dao extends DaoProperties {

  private static Logger m_log = Config.getLogger(Dao.class);
  public Dao() {super();}

}

/// </foreachEntityProperty>

