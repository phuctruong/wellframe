/// <section tokengroups="root">
///   <token name="package" replaceText="com.templates.dao.user" />
///   <token name="classname" replaceText="Dao" />
////===================================================================================================
package com.templates.dao.user;

import java.sql.*;
import java.text.*;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;

public class Dao extends DaoProperties {

  private static Logger m_log = Config.getLogger(Dao.class);

  public Dao() {
    super();
  }

  public String getPKName(){
    /// <section tokengroups="table.info">
    ///   <token name="primaryKeyField" replaceText="integer_field" />
    return "integer_field";
    /// </section>
  }

  public String getDbTableName(){
    /// <section tokengroups="table.info">
    ///   <token name="tableName" replaceText="template_test_table" />
    return "template_test_table";
    /// </section>
  }

  /// <section tokengroups="table.info">
  /// <token name="primaryKeyFunctionName" replaceText="LongValue" />
  public Long getPK() throws Exception {
    return getLongValue();
  }

  public void setPK(Long pk) {
    setLongValue(pk);
  }
  /// </section>

  public void delete() throws Exception {
    doDelete();
  }

  public Database getDatabase() {
    return new Database();
  }

  /// <section tokengroups="table.info">
  /// <token name="primaryKeyFunctionName" replaceText="LongValue" />
  public Long getUserKey() throws Exception {
    return getLongValue();
  }

  public void setUserKey(Long pk) {
    setLongValue(pk);
  }
  /// </section>

}

/**
 *
 *  $Id: Dao.java,v 1.1 2014/04/14 16:26:10 ptruong Exp $
 *
 * Copyright (C) 2002. Zoomlane Inc.
 * All Rights Reserved. Unauthorized duplication or use is prohibited.
 *
 * Revision History:
 * -- $Log: Dao.java,v $
 * -- Revision 1.1  2014/04/14 16:26:10  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2012/10/01 17:33:23  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2011/09/27 19:55:35  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2009/11/10 16:17:13  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2009/11/09 19:28:33  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2007/04/17 02:22:36  ptruong
 * -- Added tracking code
 * --
 * -- Revision 1.1  2007/01/08 21:43:20  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.2  2004/06/23 18:22:02  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1.1.1  2004/04/28 03:50:09  ptruong
 * --
 * --
 * -- Revision 1.1.1.1  2002/06/18 16:40:29  ptruong
 * -- Zoomlane
 * --
 * -- Revision 1.1  2002/01/22 02:38:24  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.6  2002/01/19 22:40:47  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.5  2002/01/19 21:23:20  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.4  2002/01/17 04:40:24  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.3  2002/01/11 04:03:15  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.2  2002/01/11 01:24:18  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.52  2002/01/02 18:27:26  ptruong
 * -- Initial checkin
 */

/// </section>

