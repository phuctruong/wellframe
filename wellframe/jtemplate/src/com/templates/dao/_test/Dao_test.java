/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
////==========================================================================
package com.templates.dao._test;

import java.sql.*;
import java.util.*;
import junit.framework.*;
import org.apache.log4j.Logger;
import org.apache.log4j.NDC;
import org.apache.log4j.BasicConfigurator;

import com.templates.dao.*;

import com.zoomlane.database.*;
import com.zoomlane.util.*;


/**
 * Title:
 * Description:
 * Copyright:    Copyright (c) 2001
 * Company:
 * @author
 * @version 1.0
 */

public class Dao_test extends TestCase {

  private static Logger m_log = Config.getLogger(Dao_test.class);

  public Dao_test(String sName) {
    super(sName);
  }

  /**
   *
   */
  public void test_Store() {
    BasicConfigurator.configure();
    NDC.push("test_Store()");
    try {
      Dao entity = new Dao();
      /// <foreachEntityProperty where="dataType=integer">
      ///   <token name="functionName" replaceText="IntegerValue" />
      entity.setIntegerValue(new Integer(1));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=boolean">
      ///   <token name="functionName" replaceText="BooleanValue" />
      entity.setBooleanValue(new Boolean(true));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=date">
      ///   <token name="functionName" replaceText="DateValue" />
      entity.setDateValue(Util.getCurrentDate());
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=float">
      ///   <token name="functionName" replaceText="FloatValue" />
      entity.setFloatValue(new Float(1));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=long">
      ///   <token name="functionName" replaceText="LongValue" />
      entity.setLongValue(new Long(123));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=string">
      ///   <token name="functionName" replaceText="StringValue" />
      entity.setStringValue("test");
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=vector">
      ///   <token name="functionName" replaceText="VectorValue" />
      entity.setVectorValue(new Vector());
      /// </foreachEntityProperty>

      entity.setPK(null);
      entity.save();
      assertTrue(true);


      /// <foreachEntityProperty where="dataType=integer">
      ///   <token name="functionName" replaceText="IntegerValue" />
      ///   <token name="fieldName" replaceText="integer_field" />
      entity.setIntegerValue(new Integer(1213));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=boolean">
      ///   <token name="functionName" replaceText="BooleanValue" />
      ///   <token name="fieldName" replaceText="boolean_field" />
      entity.setBooleanValue(new Boolean(false));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=date">
      ///   <token name="functionName" replaceText="DateValue" />
      ///   <token name="fieldName" replaceText="date_field" />
      entity.setDateValue(Util.getCurrentDate());
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=float">
      ///   <token name="functionName" replaceText="FloatValue" />
      ///   <token name="fieldName" replaceText="float_field" />
      entity.setFloatValue(new Float(1235));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=long">
      ///   <token name="functionName" replaceText="LongValue" />
      ///   <token name="fieldName" replaceText="long_field" />
      entity.setLongValue(new Long(123523));
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=string">
      ///   <token name="functionName" replaceText="StringValue" />
      ///   <token name="fieldName" replaceText="string_field" />
      entity.setStringValue("235test");
      /// </foreachEntityProperty>
      /// <foreachEntityProperty where="dataType=vector">
      ///   <token name="functionName" replaceText="VectorValue" />
      ///   <token name="fieldName" replaceText="vector_field" />
      entity.setVectorValue(new Vector());
      /// </foreachEntityProperty>
      entity.save();
      assertTrue(true);

      entity.delete();
      assertTrue(true);


    } catch (Exception e) {
      m_log.debug("caught: " + e, e);
    }
    NDC.pop();

  }



  public static void main (String[] args) {
    junit.textui.TestRunner.run(suite());
  }

  public static Test suite() {
    return new TestSuite(Dao_test.class);
  }

}

/**
 *
 *  $Id: Dao_test.java,v 1.1 2014/04/14 16:26:09 ptruong Exp $
 *
 * Copyright (C) 2002. Zoomlane Inc.
 * All Rights Reserved. Unauthorized duplication or use is prohibited.
 *
 * Revision History:
 * -- $Log: Dao_test.java,v $
 * -- Revision 1.1  2014/04/14 16:26:09  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2012/10/01 17:33:23  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2011/09/27 19:55:34  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2009/11/10 16:17:14  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2009/11/09 19:28:31  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2007/04/17 02:22:36  ptruong
 * -- Added tracking code
 * --
 * -- Revision 1.1  2007/01/08 21:43:19  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.2  2004/09/15 01:13:20  ptruong
 * -- Fixed bugs
 * --
 * -- Revision 1.1.1.1  2004/04/28 03:50:09  ptruong
 * --
 * --
 * -- Revision 1.3  2002/08/01 16:20:29  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.2  2002/07/19 15:50:34  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1.1.1  2002/06/18 16:40:29  ptruong
 * -- Zoomlane
 * --
 * -- Revision 1.2  2002/01/17 04:40:24  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.1  2002/01/11 01:24:18  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.52  2002/01/02 18:27:26  ptruong
 * -- Initial checkin
 */

/// </foreachEntityProperty>


