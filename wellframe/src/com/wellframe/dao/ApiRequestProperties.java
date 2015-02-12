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
public abstract class ApiRequestProperties extends BaseDao implements IDynaObject {

    private static Logger m_log = Config.getLogger(ApiRequestProperties.class);

    public static final String PROPERTY_MaxWait = "MaxWait";
    public static final String LABEL_MaxWait = "Max Wait";
    public static final String FIELD_MaxWait = "max_wait";
    public static final String FULL_FIELD_MaxWait = ApiRequest.TABLENAME + "." + ApiRequest.FIELD_MaxWait;

    /**
    * Getter method for Value
    * @Returns the Integer Value
    * @param none
    * @since JDK 1.1
    */
    public Integer getMaxWait() throws Exception {
        return getTypeInteger(PROPERTY_MaxWait);
    }

    /**
    * Setter method for MaxWait
    * @Returns none
    * @param Integer value
    * @since JDK 1.1
    */
    public void setMaxWait(Integer value) {
        setTypeInteger(PROPERTY_MaxWait , value);
    }

    public static final String PROPERTY_Version = "Version";
    public static final String LABEL_Version = "Version";
    public static final String FIELD_Version = "version";
    public static final String FULL_FIELD_Version = ApiRequest.TABLENAME + "." + ApiRequest.FIELD_Version;

    /**
     * Getter method for Value
     * @Returns the String Value
     * @param none
     * @since JDK 1.1
     */
    public String getVersion() throws Exception {
        return getTypeString(PROPERTY_Version);
    }

    /**
     * Setter method for Version
     * @Returns none
     * @param String value
     * @since JDK 1.1
     */
    public void setVersion(String value) {
        setTypeString(PROPERTY_Version, value);
    }

    public static final String PROPERTY_Request = "Request";
    public static final String LABEL_Request = "Request";
    public static final String FIELD_Request = "request";
    public static final String FULL_FIELD_Request = ApiRequest.TABLENAME + "." + ApiRequest.FIELD_Request;

    /**
     * Getter method for Value
     * @Returns the String Value
     * @param none
     * @since JDK 1.1
     */
    public String getRequest() throws Exception {
        return getTypeString(PROPERTY_Request);
    }

    /**
     * Setter method for Request
     * @Returns none
     * @param String value
     * @since JDK 1.1
     */
    public void setRequest(String value) {
        setTypeString(PROPERTY_Request, value);
    }

    public static final String PROPERTY_DateCreated = "DateCreated";
    public static final String LABEL_DateCreated = "Date Created";
    public static final String FIELD_DateCreated = "date_created";
    public static final String FULL_FIELD_DateCreated = ApiRequest.TABLENAME + "." + ApiRequest.FIELD_DateCreated;

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
    public static final String FULL_FIELD_LastUpdated = ApiRequest.TABLENAME + "." + ApiRequest.FIELD_LastUpdated;

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

    public static final String PROPERTY_ApiRequestKey = "ApiRequestKey";
    public static final String LABEL_ApiRequestKey = "Api Request Key";
    public static final String FIELD_ApiRequestKey = "api_request_key";
    public static final String FULL_FIELD_ApiRequestKey = ApiRequest.TABLENAME + "." + ApiRequest.FIELD_ApiRequestKey;

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
                    m_beanMap.put(PROPERTY_ApiRequestKey.toLowerCase(), FIELD_ApiRequestKey);
                    m_beanMap.put(PROPERTY_Version.toLowerCase(), FIELD_Version);
                    m_beanMap.put(PROPERTY_MaxWait.toLowerCase(), FIELD_MaxWait);
                    m_beanMap.put(PROPERTY_Request.toLowerCase(), FIELD_Request);
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

            if (fieldNames.containsKey(FIELD_MaxWait.toLowerCase()) && !hasPropertyChanged(PROPERTY_MaxWait)) {
                String integerResult = rs.getString(FIELD_MaxWait.toLowerCase());
                if (integerResult != null) {
                    setMaxWait(new Integer(integerResult));
                } else {
                    setMaxWait(null);
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
            if (fieldNames.containsKey(FIELD_Version.toLowerCase()) && !hasPropertyChanged(PROPERTY_Version)) {
                setVersion(rs.getString(FIELD_Version.toLowerCase()));
            }
            if (fieldNames.containsKey(FIELD_Request.toLowerCase()) && !hasPropertyChanged(PROPERTY_Request)) {
                setRequest(rs.getString(FIELD_Request.toLowerCase()));
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

        if (hasPropertyChanged(PROPERTY_MaxWait)) {
            ht.put(FIELD_MaxWait, checkNullInteger(getMaxWait()));
        }
        if (hasPropertyChanged(PROPERTY_ApiRequestKey)) {
            ht.put(FIELD_ApiRequestKey, checkNullLong(getApiRequestKey()));
        }
        if (hasPropertyChanged(PROPERTY_Version)) {
            ht.put(FIELD_Version, checkNullObject(getVersion()));
        }
        if (hasPropertyChanged(PROPERTY_Request)) {
            ht.put(FIELD_Request, checkNullObject(getRequest()));
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


    public static final String TABLENAME = "api_request";
    public String getDbTableName() {
        return TABLENAME;
    }
    public String getPKName() {
        return FIELD_ApiRequestKey;
    }
    public Long getPK() throws Exception {
        return getApiRequestKey();
    }

    public void setPK(Long pk) {
        setApiRequestKey(pk);
    }

    public static ApiRequest findByApiRequestKey(Long pk) throws Exception {
        Vector results = new ApiRequest().findBySQL("select * from " + ApiRequest.TABLENAME + 
                                             " where " + ApiRequest.FIELD_ApiRequestKey + " = ?", new Object[] {pk});
        if (results == null || results.size() == 0) return null;
        return(ApiRequest) results.elementAt(0);
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

