package com.wellframe.dao;

import java.io.*;
import java.math.*;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.search.*;
import com.zoomlane.struts.form.IDynaObject;
import com.zoomlane.util.*;

/**
 * class_description_here
 */
public abstract class ApiResponseProperties extends BaseDao implements IDynaObject {

    private static Logger m_log = Config.getLogger(ApiResponseProperties.class);

    public static final String PROPERTY_Response = "Response";
    public static final String LABEL_Response = "Response";
    public static final String FIELD_Response = "response";
    public static final String FULL_FIELD_Response = ApiResponse.TABLENAME + "." + ApiResponse.FIELD_Response;

    /**
     * Getter method for Value
     * @Returns the String Value
     * @param none
     * @since JDK 1.1
     */
    public String getResponse() throws Exception {
        return getTypeString(PROPERTY_Response);
    }

    /**
     * Setter method for Response
     * @Returns none
     * @param String value
     * @since JDK 1.1
     */
    public void setResponse(String value) {
        setTypeString(PROPERTY_Response, value);
    }

    public static final String PROPERTY_DateCreated = "DateCreated";
    public static final String LABEL_DateCreated = "Date Created";
    public static final String FIELD_DateCreated = "date_created";
    public static final String FULL_FIELD_DateCreated = ApiResponse.TABLENAME + "." + ApiResponse.FIELD_DateCreated;

    /**
     * Getter method for Value
     * @Returns the java.util.Date Value
     * @param none
     * @since JDK 1.1
     */
    public java.util.Date getDateCreated() throws Exception {
        return getTypeDate(PROPERTY_DateCreated);
    }

    /**	
    * Setter method for DateCreated
    * @Returns none
    * @param <java.util.Date value
    * @since JDK 1.1
    */
    public void setDateCreated(java.util.Date value) {
        setTypeDate(PROPERTY_DateCreated, value);
    }

    public Date getEntityDateCreated() throws Exception {
        return getDateCreated();
    }

    public void setEntityDateCreated(Date dateCreated) {
        setDateCreated(dateCreated);
    }

    public String getEntityDateCreatedName() {
        return PROPERTY_DateCreated;
    }

    public static final String PROPERTY_LastUpdated = "LastUpdated";
    public static final String LABEL_LastUpdated = "Last Updated";
    public static final String FIELD_LastUpdated = "last_updated";
    public static final String FULL_FIELD_LastUpdated = ApiResponse.TABLENAME + "." + ApiResponse.FIELD_LastUpdated;

    /**
     * Getter method for Value
     * @Returns the java.util.Date Value
     * @param none
     * @since JDK 1.1
     */
    public java.util.Date getLastUpdated() throws Exception {
        return getTypeDate(PROPERTY_LastUpdated);
    }

    /**	
    * Setter method for LastUpdated
    * @Returns none
    * @param <java.util.Date value
    * @since JDK 1.1
    */
    public void setLastUpdated(java.util.Date value) {
        setTypeDate(PROPERTY_LastUpdated, value);
    }

    public static final String PROPERTY_ApiResponseKey = "ApiResponseKey";
    public static final String LABEL_ApiResponseKey = "Api Response Key";
    public static final String FIELD_ApiResponseKey = "api_response_key";
    public static final String FULL_FIELD_ApiResponseKey = ApiResponse.TABLENAME + "." + ApiResponse.FIELD_ApiResponseKey;

    /**
     * Getter method for ApiResponseKey
     * @Returns the Long Value
     * @param none
     * @since JDK 1.1
     */
    public Long getApiResponseKey() throws Exception {
        return getTypeLong(PROPERTY_ApiResponseKey);
    }

    /**
     * Setter method for ApiResponseKey
     * @Returns none
     * @param Long value
     * @since JDK 1.1
     */
    public void setApiResponseKey(Long value) {
        setTypeLong(PROPERTY_ApiResponseKey, value);
    }

    public static final String PROPERTY_ApiRequestKey = "ApiRequestKey";
    public static final String LABEL_ApiRequestKey = "Api Request Key";
    public static final String FIELD_ApiRequestKey = "api_request_key";
    public static final String FULL_FIELD_ApiRequestKey = ApiResponse.TABLENAME + "." + ApiResponse.FIELD_ApiRequestKey;

    /**
     * Getter method for ApiRequestKey
     * @Returns the Long Value
     * @param none
     * @since JDK 1.1
     */
    public Long getApiRequestKey() throws Exception {
        return getTypeLong(PROPERTY_ApiRequestKey);
    }

    /**
     * Setter method for ApiRequestKey
     * @Returns none
     * @param Long value
     * @since JDK 1.1
     */
    public void setApiRequestKey(Long value) {
        setTypeLong(PROPERTY_ApiRequestKey, value);
    }



    public String getForeignTableName(String property) {
        return null;
    }

    public Vector getForeignPropertyNames() {
        Vector propertyNames = new Vector();

        return propertyNames;
    }

    public boolean isPropertyForeignVector(String property) {
        return false;
    }

    public boolean isPropertyMultiValue(String property) {

        return false;
    }

    public Long getForeignKey(String property) throws Exception {
        return null;
    }

    public String getForeignKeyName(String property) throws Exception {
        return null;
    }

    public String getLinkKeyName(String property) throws Exception {
        return null;
    }

    public void setForeignValuesFromResultSet(String property, ResultSet rs) throws Exception {
    }


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
                    m_beanMap.put(PROPERTY_ApiResponseKey.toLowerCase(), FIELD_ApiResponseKey);
                    m_beanMap.put(PROPERTY_ApiRequestKey.toLowerCase(), FIELD_ApiRequestKey);
                    m_beanMap.put(PROPERTY_Response.toLowerCase(), FIELD_Response);
                    m_beanMap.put(PROPERTY_LastUpdated.toLowerCase(), FIELD_LastUpdated);
                    m_beanMap.put(PROPERTY_DateCreated.toLowerCase(), FIELD_DateCreated);
                    m_beanLock = Boolean.TRUE;
                }
            }
        }
        String[] mappedFields = new String[propertyNames.length];
        int i;
        for (i = 0;i < propertyNames.length;i++) {
            String propertyName = propertyNames[i].toLowerCase();
            if (m_beanMap.containsKey(propertyName)) {
                mappedFields[i] = (String)m_beanMap.get(propertyName);
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

            if (fieldNames.containsKey(FIELD_ApiResponseKey.toLowerCase()) && !hasPropertyChanged(PROPERTY_ApiResponseKey)) {
                String longResult = rs.getString(FIELD_ApiResponseKey.toLowerCase());
                if (longResult != null) {
                    setApiResponseKey(new Long(longResult));
                } else {
                    setApiResponseKey(null);
                }
            }
            if (fieldNames.containsKey(FIELD_ApiRequestKey.toLowerCase()) && !hasPropertyChanged(PROPERTY_ApiRequestKey)) {
                String longResult = rs.getString(FIELD_ApiRequestKey.toLowerCase());
                if (longResult != null) {
                    setApiRequestKey(new Long(longResult));
                } else {
                    setApiRequestKey(null);
                }
            }
            if (fieldNames.containsKey(FIELD_Response.toLowerCase()) && !hasPropertyChanged(PROPERTY_Response)) {
                setResponse(rs.getString(FIELD_Response.toLowerCase()));
            }
            if (fieldNames.containsKey(FIELD_LastUpdated.toLowerCase()) && !hasPropertyChanged(PROPERTY_LastUpdated)) {
                setLastUpdated(rs.getTimestamp(FIELD_LastUpdated.toLowerCase()));
            }
            if (fieldNames.containsKey(FIELD_DateCreated.toLowerCase()) && !hasPropertyChanged(PROPERTY_DateCreated)) {
                setDateCreated(rs.getTimestamp(FIELD_DateCreated.toLowerCase()));
            }


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

        if (hasPropertyChanged(PROPERTY_ApiResponseKey)) {
            ht.put(FIELD_ApiResponseKey, checkNullLong(getApiResponseKey()));
        }
        if (hasPropertyChanged(PROPERTY_ApiRequestKey)) {
            ht.put(FIELD_ApiRequestKey, checkNullLong(getApiRequestKey()));
        }
        if (hasPropertyChanged(PROPERTY_Response)) {
            ht.put(FIELD_Response, checkNullObject(getResponse()));
        }
        if (hasPropertyChanged(PROPERTY_LastUpdated)) {
            if (getLastUpdated() == null) {
                ht.put(FIELD_LastUpdated, NULL_DATE);
            } else {
                ht.put(FIELD_LastUpdated, getLastUpdated());
            }
        }
        if (hasPropertyChanged(PROPERTY_DateCreated)) {
            if (getDateCreated() == null) {
                ht.put(FIELD_DateCreated, NULL_DATE);
            } else {
                ht.put(FIELD_DateCreated, getDateCreated());
            }
        }

        return ht;
    }

    public String toString() {
        StringBuffer results = new StringBuffer();
        try {
            Hashtable record = getHashtableRecord();
            Enumeration keys = record.keys();
            while (keys.hasMoreElements()) {
                String key = (String)keys.nextElement();
                results.append(key);
                results.append(" = ");
                results.append(record.get(key));
                results.append(", ");
            }
        } catch (Exception e) {
            results.append(e);
        }
        return results.toString();
    }




    public static final String SQL_EQUALS = " = ? ";
    public static final String SQL_AND = " and ";
    public static final String SQL_LIKE = " like ?";


    public static final String TABLENAME = "api_response";
    public String getDbTableName() {
        return TABLENAME;
    }
    public String getPKName() {
        return FIELD_ApiResponseKey;
    }
    public Long getPK() throws Exception {
        return getApiResponseKey();
    }

    public void setPK(Long pk) {
        setApiResponseKey(pk);
    }

    public static ApiResponse findByApiResponseKey(Long pk) throws Exception {
        Vector results = new ApiResponse().findBySQL("select * from " + ApiResponse.TABLENAME + 
                                             " where " + ApiResponse.FIELD_ApiResponseKey + " = ?", new Object[] {pk});
        if (results == null || results.size() == 0) return null;
        return(ApiResponse) results.elementAt(0);
    }

    public void delete() throws Exception {
        doDelete();

    }

    public Database getDatabase() {
        return super.getDatabase();
    }


    public void insertPre() throws Exception {
          if (getDateCreated() == null) setDateCreated(Util.getCurrentDate());
    }

    public void updatePre() throws Exception {
        setLastUpdated(Util.getCurrentDate());
    }

    public void savePost() throws Exception {

    }


    public Object parseObjectValue(Class type, String field, Object value) throws Exception {
        return this.S_NO_CUSTOM_PARSE_OBJECT_VALUE;
    }

    public String handleParseObjectValueException(Class type, String field, Object value, Exception parseException) {
        return this.S_NO_CUSTOM_HANDLE_PARSE_EXCEPTION;
    }

    public void validateObjectValue(Class type, String field, Object value) throws Exception {
        return;
    }

    public String handleValidateObjectValueException(Class type, String field, Object value, Exception parseException) {
        return this.S_NO_CUSTOM_HANDLE_VALIDATE_EXCEPTION;
    }

    public String checkIsRequired(Class type, String field, Object value) {
        return this.S_NO_CUSTOM_CHECK_IS_REQUIRED;
    }

    public Vector getSelectOptionValues(String optionListName) {
        return null;
    }

}

