/// <section tokengroups="root">
///   <token name="package" replaceText="com.templates.dao" />
///   <token name="classname" replaceText="Dao" />
////===================================================================================================
package com.templates.dao;

import java.sql.*;
import java.text.*;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;

public class DaoList extends DaoProperties {

  private static Logger m_log = Config.getLogger(DaoList.class);

  public DaoList() {
    super();
  }

  /// <foreachEntityProperty where="type=tableInfo">
  ///   <token name="tableName" replaceText="template_test_list_table" />
  public static final String TABLENAME = "template_test_list_table";
  public String getDbTableName(){
    return TABLENAME;
  }
  /// </foreachEntityProperty>

  /// <foreachEntityProperty where="pk=true">
  ///   <token name="functionName" replaceText="IntegerValue" />
  public String getPKName(){
    return FIELD_IntegerValue;
  }

  public Long getPK() throws Exception {
    return getLongValue();
  }

  public void setPK(Long pk) {
    setLongValue(pk);
  }
  /// </foreachEntityProperty>

  public void delete() throws Exception {
    doDelete();
  }

  public Database getDatabase() {
    return new Database();
  }


}

/**
 *
 *  $Id: DaoList.java,v 1.1 2014/04/14 16:26:09 ptruong Exp $
 *
 * Copyright (C) 2002. Zoomlane Inc.
 * All Rights Reserved. Unauthorized duplication or use is prohibited.
 *
 * Revision History:
 * -- $Log: DaoList.java,v $
 * -- Revision 1.1  2014/04/14 16:26:09  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2012/10/01 17:33:23  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2011/09/27 19:55:35  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2009/11/10 16:17:12  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2009/11/09 19:28:31  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.2  2009/01/10 19:43:38  ptruong
 * -- Fixed urls so that they are friendly
 * --
 * -- Revision 1.1  2007/01/08 21:43:19  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.3  2004/08/12 20:56:43  ptruong
 * -- Bug fixes
 * --
 * -- Revision 1.2  2004/06/23 18:22:02  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1.1.1  2004/04/28 03:50:09  ptruong
 * --
 * --
 * -- Revision 1.1  2002/06/27 19:47:07  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1.1.1  2002/06/18 16:40:29  ptruong
 * -- Zoomlane
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

