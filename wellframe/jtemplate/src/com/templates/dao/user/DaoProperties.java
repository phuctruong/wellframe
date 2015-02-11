/// <section tokengroups="root">
///   <token name="package" replaceText="com.templates.dao.user" />
///   <token name="classname" replaceText="Dao" />
///   <token name="baseEntityClass" replaceText="com.zoomlane.entity.Entity" />
////==========================================================================
package com.templates.dao.user;

import java.util.*;
import java.sql.*;

import org.apache.log4j.Logger;


import com.zoomlane.entity.*;
import com.zoomlane.util.*;

import com.zoomlane.entity.Entity;

/**
 *
 */
public abstract class DaoProperties extends com.zoomlane.entity.Entity {

  private static Logger m_log = Config.getLogger(DaoProperties.class);

  /// <section tokengroups="table.booleans">
  ///   <token name="functionName" replaceText="BooleanValue" />
  ////=======================================================================
  /**
  * Getter method for Value
  * @Returns the Boolean Value
  * @param none
  * @since JDK 1.1
  */
  public Boolean getBooleanValue() throws Exception {
    return getTypeBoolean("BooleanValue");
  }

  /**
  * Setter method for BooleanValue
  * @Returns none
  * @param Boolean value
  * @since JDK 1.1
  */
  public void setBooleanValue(Boolean value) {
    setTypeBoolean("BooleanValue" , value);
  }

  ////-----------------------------------------------------------------------
  /// </section>

  /// <section tokengroups="table.integers">
  ///   <token name="functionName" replaceText="IntegerValue" />
  ////=======================================================================
  /**
  * Getter method for Value
  * @Returns the Boolean Value
  * @param none
  * @since JDK 1.1
  */
  public Integer getIntegerValue() throws Exception {
    return getTypeInteger("IntegerValue");
  }

  /**
  * Setter method for IntegerValue
  * @Returns none
  * @param Integer value
  * @since JDK 1.1
  */
  public void setIntegerValue(Integer value) {
    setTypeInteger("IntegerValue" , value);
  }

  ////-----------------------------------------------------------------------
  /// </section>

  /// <section tokengroups="table.strings">
  ///   <token name="functionName" replaceText="StringValue" />
  ////=======================================================================
  /**
   * Getter method for Value
   * @Returns the String Value
   * @param none
   * @since JDK 1.1
   */
  public String getStringValue() throws Exception {
    return getTypeString("StringValue");
  }

  /**
   * Setter method for StringValue
   * @Returns none
   * @param String value
   * @since JDK 1.1
   */
  public void setStringValue(String value) {
    setTypeString("StringValue", value);
  }

  ////=======================================================================
  /// </section>

  /// <section tokengroups="table.dates" >
  ///   <token name="functionName" replaceText="DateValue" />
  ////=======================================================================
  /**
   * Getter method for Value
   * @Returns the java.util.Date Value
   * @param none
   * @since JDK 1.1
   */
  public java.util.Date getDateValue() throws Exception {
    return getTypeDate("DateValue");
  }

  /**	
  * Setter method for DateValue
  * @Returns none
  * @param <java.util.Date value
  * @since JDK 1.1
  */
  public void setDateValue(java.util.Date value) {
    setTypeDate("DateValue", value);
  }

  ////=======================================================================
  /// </section>

  /// <section tokengroups="table.floats" tokens="FloatValue">
  ///   <token name="functionName" replaceText="FloatValue" />
  ////=======================================================================
  /**
   * Getter method for Value
   * @Returns the Float Value
   * @param none
   * @since JDK 1.1
   */
  public Float getFloatValue() throws Exception {
    return getTypeFloat("FloatValue");
  }

  /**
   * Setter method for FloatValue
   * @Returns none
   * @param Float value
   * @since JDK 1.1
  */
  public void setFloatValue(Float value) {
    setTypeFloat("FloatValue" , value);
  }
  ////=======================================================================
  /// </section>

  /// <section tokengroups="table.longs" tokens="LongValue">
  ///   <token name="functionName" replaceText="LongValue" />
  ////=======================================================================
  /**
   * Getter method for LongValue
   * @Returns the Long Value
   * @param none
   * @since JDK 1.1
   */
  public Long getLongValue() throws Exception {
    return getTypeLong("LongValue");
  }

  /**
   * Setter method for LongValue
   * @Returns none
   * @param Long value
   * @since JDK 1.1
   */
  public void setLongValue(Long value) {
    setTypeLong("LongValue",value);
  }

  ////=======================================================================
  /// </section>


  /// <section tokengroups="table.vectors" tokens="value">
  ///   <token name="functionName" replaceText="VectorValue" />
  ////=======================================================================
  /**
   * Getter method for Value
   * @Returns the Vector Value
   * @param none
   * @since JDK 1.1
   */
  public Vector getVectorValue() throws Exception {
    return getTypeVector("VectorValue");
  }

  /**
   * Setter method for Value
   * @Returns none
   * @param Vector value
   * @since JDK 1.1
   */
  public void setVectorValue(Vector value) {
    setTypeVector("VectorValue", value);
  }
  ////=======================================================================
  /// </section>

  static Hashtable m_beanMap = null;
  static Boolean m_beanLock = Boolean.FALSE;

  /** Takes a string array of function names and converts them
   * into a string array of field names in the database.  This is useful for
   * implementing "bean" like methods where the user passes in a names of
   * properties in a "bean-like" way and the function loads data from the
   * database using the proper field names.
   */
  public String[] convertPropertiesToFieldNames(String[] propertyNames) {
    if (m_beanLock.equals(Boolean.FALSE)) {
      synchronized(m_beanLock) {
        if (m_beanLock.equals(Boolean.FALSE)) {
          m_beanMap = new Hashtable();
          /// <section tokengroups="table.*">
          ///   <token name="functionName" replaceText="StringValue" />
          ///   <token name="fieldName" replaceText="string_field" />
          ////---------------------------------------------------------------
          m_beanMap.put("StringValue", "string_field");
          ////---------------------------------------------------------------
          /// </section>
          m_beanLock = Boolean.TRUE;
        }
      }
    }
    String[] mappedFields = new String[propertyNames.length];
    int i;
    for (i = 0;i < propertyNames.length;i++) {
      if (m_beanMap.containsKey(propertyNames[i])) {
        mappedFields[i] = (String)m_beanMap.get(propertyNames[i]);
      } else {
        m_log.debug("Unable to map bean field: " + propertyNames[i]);
        throw new RuntimeException("Unable to map bean field: " + propertyNames[i]);
      }
    }
    return mappedFields;
  }

  /**
   * This method calls the appropriate setter method if the field name is present in the
   * resultset
   * @Returns none
   * @param ResultSet rs
   * @since JDK 1.1
   */
  public void setFromResultSet(ResultSet rs) throws Exception {
    // Turn off tracking of modified properties since
    // We are initially loading the settings from the database
    boolean previousModificationTrackingSetting = getShouldTrackModifications();
    setShouldTrackModifications(false);
    try {
      Hashtable fieldNames = new Hashtable();
      ResultSetMetaData metaData = rs.getMetaData();
      int j;
      Integer i = new Integer(1);
      m_log.debug("Started Loading the Column names");
      for (j = 0;j < metaData.getColumnCount();j++) {
        m_log.debug(metaData.getColumnName(j+1));
        fieldNames.put(metaData.getColumnName(j+1).toLowerCase(), i);
      }
      m_log.debug("Finished  Loading the Column names");

      /// <section tokengroups="table.integers">
      ///   <token name="functionName" replaceText="IntegerValue" />
      ///   <token name="fieldName" replaceText="integer_field" />
      ////---------------------------------------------------------------
      if (fieldNames.containsKey("integer_field") && !hasPropertyChanged("IntegerValue")) {
        setIntegerValue(new Integer(rs.getInt("integer_field")));
      }
      /// </section>
      /// <section tokengroups="table.longs">
      ///   <token name="functionName" replaceText="IntegerValue" />
      ///   <token name="fieldName" replaceText="long_field" />
      ////---------------------------------------------------------------
      if (fieldNames.containsKey("long_field") && !hasPropertyChanged("LongValue")) {
        setLongValue(new Long(rs.getLong("long_field")));
      }
      /// </section>
      /// <section tokengroups="table.booleans">
      ///   <token name="functionName" replaceText="IntegerValue" />
      ///   <token name="fieldName" replaceText="integer_field" />
      ////---------------------------------------------------------------
      if (fieldNames.containsKey("boolean_field") && !hasPropertyChanged("BooleanValue")) {
        setBooleanValue(Util.getBooleanFromString(rs.getString("boolean_field")));
      }
      /// </section>
      /// <section tokengroups="table.strings">
      ///   <token name="functionName" replaceText="StringValue" />
      ///   <token name="fieldName" replaceText="string_field" />
      if (fieldNames.containsKey("string_field") && !hasPropertyChanged("StringValue")) {
        setStringValue(rs.getString("string_field"));
      }
      /// </section>
      /// <section tokengroups="table.dates">
      ///   <token name="functionName" replaceText="DateValue" />
      ///   <token name="fieldName" replaceText="date_field" />
      if (fieldNames.containsKey("date_field") && !hasPropertyChanged("DateValue")) {
        setDateValue(rs.getTimestamp("date_field"));
      }
      /// </section>
      /// <section tokengroups="table.vectors">
      ///   <token name="functionName" replaceText="VectorValue" />
      ///   <token name="fieldName" replaceText="vector_field" />
      if (fieldNames.containsKey("vector_field") && !hasPropertyChanged("VectorValue")) {
        setVectorValue(Util.getVectorFromMVString(rs.getString("vector_field")));
      }
      /// </section>

      /// <section tokengroups="table.floats">
      ///   <token name="functionName" replaceText="FloatValue" />
      ///   <token name="fieldName" replaceText="float_field" />
      if (fieldNames.containsKey("float_field") && !hasPropertyChanged("FloatValue")) {
        setFloatValue(new Float(rs.getFloat("float_field")));
      }
      /// </section>


    } catch (Exception e) {
      m_log.debug("Unable to load the result set into " + this.getClass() + ": " + e.toString());
      throw e;
    }

    // Reset the modification tracking of properties to what it was set to before
    setShouldTrackModifications(previousModificationTrackingSetting);
  }

  /**
   * Gets hashtable containing the values for properties of the class
   * @Returns Hashtable with Name-Value pairs for the propertyName of the class
   * @param none
   * @since JDK 1.1
   */
  public Hashtable getHashtableRecord() throws Exception {

    Hashtable ht = new Hashtable();
    ht.clear();

    /// <section tokengroups="table.integers">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="fieldName" replaceText="integer_field" />
    if (hasPropertyChanged("IntegerValue")) {
      ht.put("integer_field", checkNullInteger(getIntegerValue()));
    }
    /// </section>
    /// <section tokengroups="table.longs">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="fieldName" replaceText="long_field" />
    if (hasPropertyChanged("LongValue")) {
      ht.put("long_field", checkNullObject(getLongValue()));
    }
    /// </section>
    /// <section tokengroups="table.booleans">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="fieldName" replaceText="boolean_field" />
    if (hasPropertyChanged("BooleanValue")) {
      ht.put("boolean_field", checkNullInteger(Util.toInteger(getBooleanValue())));
    }
    /// </section>
    /// <section tokengroups="table.floats">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="fieldName" replaceText="float_field" />
    if (hasPropertyChanged("FloatValue")) {
      ht.put("float_field", checkNullObject(getFloatValue()));
    }
    /// </section>
    /// <section tokengroups="table.strings">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="fieldName" replaceText="string_field" />
    if (hasPropertyChanged("StringValue")) {
      ht.put("string_field", checkNullObject(getStringValue()));
    }
    /// </section>

    /// <section tokengroups="table.dates">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="fieldName" replaceText="date_field" />
    if (hasPropertyChanged("DateValue")) {
      if (getDateValue() == null) {
        ht.put("date_field", NULL_DATE);
      } else {
        ht.put("date_field", getDateValue());
      }
    }
    /// </section>

    /// <section tokengroups="table.vectors">
    ///   <token name="functionName" replaceText="VectorValue" />
    ///   <token name="fieldName" replaceText="vector_field" />
    if (hasPropertyChanged("VectorValue")) {
      ht.put("vector_field", Util.getMVStringFromVector(getVectorValue()));
    }
    /// </section>

    return ht;
  }

}

/**
 *
 *  $Id: DaoProperties.java,v 1.1 2014/04/14 16:26:10 ptruong Exp $
 *
 * Copyright (C) 2002. Zoomlane Inc.
 * All Rights Reserved. Unauthorized duplication or use is prohibited.
 *
 * Revision History:
 * -- $Log: DaoProperties.java,v $
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
 * -- Revision 1.1.1.1  2004/04/28 03:50:09  ptruong
 * --
 * --
 * -- Revision 1.1.1.1  2002/06/18 16:40:29  ptruong
 * -- Zoomlane
 * --
 * -- Revision 1.1  2002/01/22 02:38:24  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.6  2002/01/19 21:23:20  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.5  2002/01/17 04:40:24  ptruong
 * -- *** empty log message ***
 * --
 * -- Revision 1.4  2002/01/13 17:45:57  ptruong
 * -- fixed code to have base entity class
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


