/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="className" replaceText="Dao" />
///   <token name="description" replaceText="class_description_here" />
///   <token name="baseEntityClass" replaceText="com.zoomlane.entity.Entity" />
////==========================================================================
package com.templates.dao;

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
public abstract class DaoProperties extends com.zoomlane.entity.Entity implements IDynaObject {

    private static Logger m_log = Config.getLogger(DaoProperties.class);

    /// <foreachEntityProperty where="dataType=boolean">
    ///   <token name="functionName" replaceText="BooleanValue" />
    ///   <token name="label" replaceText="BooleanLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="boolean_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_BooleanValue = "BooleanValue";
    public static final String LABEL_BooleanValue = "BooleanLabel";
    public static final String FIELD_BooleanValue = "boolean_field";
    public static final String FULL_FIELD_BooleanValue = Dao.TABLENAME + "." + Dao.FIELD_BooleanValue;

    /**
    * Getter method for Value
    * @Returns the Boolean Value
    * @param none
    * @since JDK 1.1
    */
    public Boolean getBooleanValue() throws Exception {
        return getTypeBoolean(PROPERTY_BooleanValue);
    }

    /**
    * Setter method for BooleanValue
    * @Returns none
    * @param Boolean value
    * @since JDK 1.1
    */
    public void setBooleanValue(Boolean value) {
        setTypeBoolean(PROPERTY_BooleanValue, value);
    }

    ////-----------------------------------------------------------------------
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=integer">
    ///   <token name="functionName" replaceText="IntegerValue" />
    ///   <token name="label" replaceText="IntegerLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="integer_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_IntegerValue = "IntegerValue";
    public static final String LABEL_IntegerValue = "IntegerLabel";
    public static final String FIELD_IntegerValue = "integer_field";
    public static final String FULL_FIELD_IntegerValue = Dao.TABLENAME + "." + Dao.FIELD_IntegerValue;

    /**
    * Getter method for Value
    * @Returns the Integer Value
    * @param none
    * @since JDK 1.1
    */
    public Integer getIntegerValue() throws Exception {
        return getTypeInteger(PROPERTY_IntegerValue);
    }

    /**
    * Setter method for IntegerValue
    * @Returns none
    * @param Integer value
    * @since JDK 1.1
    */
    public void setIntegerValue(Integer value) {
        setTypeInteger(PROPERTY_IntegerValue , value);
    }

    ////-----------------------------------------------------------------------
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="dataType=string">
    ///   <token name="functionName" replaceText="StringValue" />
    ///   <token name="label" replaceText="StringLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="string_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_StringValue = "StringValue";
    public static final String LABEL_StringValue = "StringLabel";
    public static final String FIELD_StringValue = "string_field";
    public static final String FULL_FIELD_StringValue = Dao.TABLENAME + "." + Dao.FIELD_StringValue;

    /**
     * Getter method for Value
     * @Returns the String Value
     * @param none
     * @since JDK 1.1
     */
    public String getStringValue() throws Exception {
        return getTypeString(PROPERTY_StringValue);
    }

    /**
     * Setter method for StringValue
     * @Returns none
     * @param String value
     * @since JDK 1.1
     */
    public void setStringValue(String value) {
        setTypeString(PROPERTY_StringValue, value);
    }

    ////=======================================================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=date, isCreateDate=true">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="DateLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_DateValue = "DateValue";
    public static final String LABEL_DateValue = "DateLabel";
    public static final String FIELD_DateValue = "date_field";
    public static final String FULL_FIELD_DateValue = Dao.TABLENAME + "." + Dao.FIELD_DateValue;

    /**
     * Getter method for Value
     * @Returns the java.util.Date Value
     * @param none
     * @since JDK 1.1
     */
    public java.util.Date getDateValue() throws Exception {
        return getTypeDate(PROPERTY_DateValue);
    }

    /**	
    * Setter method for DateValue
    * @Returns none
    * @param <java.util.Date value
    * @since JDK 1.1
    */
    public void setDateValue(java.util.Date value) {
        setTypeDate(PROPERTY_DateValue, value);
    }

    public Date getEntityDateCreated() throws Exception {
        return getDateValue();
    }

    public void setEntityDateCreated(Date dateCreated) {
        setDateValue(dateCreated);
    }

    public String getEntityDateCreatedName() {
        return PROPERTY_DateValue;
    }

    ////=======================================================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=date, isCreateDate!=true">
    ///   <token name="functionName" replaceText="DateValue" />
    ///   <token name="label" replaceText="DateLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="date_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_DateValue = "DateValue";
    public static final String LABEL_DateValue = "DateLabel";
    public static final String FIELD_DateValue = "date_field";
    public static final String FULL_FIELD_DateValue = Dao.TABLENAME + "." + Dao.FIELD_DateValue;

    /**
     * Getter method for Value
     * @Returns the java.util.Date Value
     * @param none
     * @since JDK 1.1
     */
    public java.util.Date getDateValue() throws Exception {
        return getTypeDate(PROPERTY_DateValue);
    }

    /**	
    * Setter method for DateValue
    * @Returns none
    * @param <java.util.Date value
    * @since JDK 1.1
    */
    public void setDateValue(java.util.Date value) {
        setTypeDate(PROPERTY_DateValue, value);
    }

    ////=======================================================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=float">
    ///   <token name="functionName" replaceText="FloatValue" />
    ///   <token name="label" replaceText="FloatLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="float_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_FloatValue = "FloatValue";
    public static final String LABEL_FloatValue = "FloatLabel";
    public static final String FIELD_FloatValue = "float_field";
    public static final String FULL_FIELD_FloatValue = Dao.TABLENAME + "." + Dao.FIELD_FloatValue;

    /**
     * Getter method for Value
     * @Returns the Float Value
     * @param none
     * @since JDK 1.1
     */
    public Float getFloatValue() throws Exception {
        return getTypeFloat(PROPERTY_FloatValue);
    }

    /**
     * Setter method for FloatValue
     * @Returns none
     * @param Float value
     * @since JDK 1.1
    */
    public void setFloatValue(Float value) {
        setTypeFloat(PROPERTY_FloatValue , value);
    }

    ////=======================================================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=decimal">
    ///   <token name="functionName" replaceText="DecimalValue" />
    ///   <token name="label" replaceText="DecimalLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="decimal_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_DecimalValue = "DecimalValue";
    public static final String LABEL_DecimalValue = "DecimalLabel";
    public static final String FIELD_DecimalValue = "decimal_field";
    public static final String FULL_FIELD_DecimalValue = Dao.TABLENAME + "." + Dao.FIELD_DecimalValue;

    /**
     * Getter method for Value
     * @Returns the Decimal Value
     * @param none
     * @since JDK 1.1
     */
    public BigDecimal getDecimalValue() throws Exception {
        return getTypeBigDecimal(PROPERTY_DecimalValue);
    }

    /**
     * Setter method for DecimalValue
     * @Returns none
     * @param Decimal value
     * @since JDK 1.1
    */
    public void setDecimalValue(BigDecimal value) {
        setTypeBigDecimal(PROPERTY_DecimalValue , value);
    }

    ////=======================================================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=long">
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="label" replaceText="LongLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="long_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_LongValue = "LongValue";
    public static final String LABEL_LongValue = "LongLabel";
    public static final String FIELD_LongValue = "long_field";
    public static final String FULL_FIELD_LongValue = Dao.TABLENAME + "." + Dao.FIELD_LongValue;

    /**
     * Getter method for LongValue
     * @Returns the Long Value
     * @param none
     * @since JDK 1.1
     */
    public Long getLongValue() throws Exception {
        return getTypeLong(PROPERTY_LongValue);
    }

    /**
     * Setter method for LongValue
     * @Returns none
     * @param Long value
     * @since JDK 1.1
     */
    public void setLongValue(Long value) {
        setTypeLong(PROPERTY_LongValue, value);
    }

    ////=======================================================================
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="dataType=entity">
    ///   <token name="functionName" replaceText="EntityValue" />
    ///   <token name="entity" replaceText="Dao" replaceTextIfNullField="selectOptionsList" />
    ///   <token name="entityFunctionName" replaceText="EntityObject" replaceTextIfNullField="selectOptionsList" />
    ///   <token name="label" replaceText="EntityLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="entity_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_EntityValue = "EntityValue";
    public static final String LABEL_EntityValue = "EntityLabel";
    public static final String FIELD_EntityValue = "entity_field";
    public static final String FULL_FIELD_EntityValue = Dao.TABLENAME + "." + Dao.FIELD_EntityValue;

    public Dao getEntityObject() throws Exception {
        Dao entity = new Dao();
        entity.setPK(getEntityValue());
        return entity;
    }

    public Long getEntityValue() throws Exception {
        return getTypeLong(PROPERTY_EntityValue);
    }

    public void setEntityValue(Long value) {
        setTypeLong(PROPERTY_EntityValue, value);
    }

    ////=======================================================================
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="dataType=vector">
    ///   <token name="functionName" replaceText="VectorValue" />
    ///   <token name="label" replaceText="VectorLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="vector_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_VectorValue = "VectorValue";
    public static final String LABEL_VectorValue = "VectorLabel";
    public static final String FIELD_VectorValue = "vector_field";
    public static final String FULL_FIELD_VectorValue = Dao.TABLENAME + "." + Dao.FIELD_VectorValue;


    /**
     * Getter method for Value
     * @Returns the Vector Value
     * @param none
     * @since JDK 1.1
     */
    public Vector getVectorValue() throws Exception {
        return getTypeVector(PROPERTY_VectorValue);
    }

    /**
     * Setter method for Value
     * @Returns none
     * @param Vector value
     * @since JDK 1.1
     */
    public void setVectorValue(Vector value) {
        setTypeVector(PROPERTY_VectorValue, value);
    }
    ////=======================================================================
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="dataType=file">
    ///   <token name="functionName" replaceText="FileValue" />
    ///   <token name="label" replaceText="FileLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="file_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_FileValue = "FileValue";
    public static final String PROPERTY_FileValueId = "FileValueId";
    public static final String PROPERTY_FileValueExtension = "FileValueExtension";
    public static final String PROPERTY_FileValueLocation = "FileValueLocation";
    public static final String LABEL_FileValue = "FileLabel";
    public static final String FIELD_FileValue = "file_field";
    public static final String FULL_FIELD_FileValue = Dao.TABLENAME + "." + Dao.FIELD_FileValue;

    /**
     * Getter method for Value
     * @Returns the File Value
     * @param none
     * @since JDK 1.1
     */
    public String getFileValue() throws Exception {
        return getTypeString(PROPERTY_FileValue);
    }

    /**
     * Setter method for Value
     * @Returns none
     * @param File value
     * @since JDK 1.1
     */
    public void setFileValue(String value) {
        setTypeString(PROPERTY_FileValue, value);
    }

    public String getFileValueExtension() throws Exception {
        String name = getFileValue();
        if (Util.isBlankOrNull(name)) return null;
        int lastIndex = name.lastIndexOf(".");
        if (lastIndex > -1 && name.length() > lastIndex + 1) {
            name = name.substring(lastIndex + 1);
        } else {
            name = null;
        }
        if (name == null) {
            return ".unknown";
        }
        return name;
    }

    public String getFileValueId() throws Exception {
        if (Util.isBlankOrNull(getFileValue())) return null;
        return "Dao." + getPK() + "-File";
    }

    public String getFileValueLocation() throws Exception {
        if (Util.isBlankOrNull(getFileValue())) return null;
        return Config.getInstance().getProperty(Config.S_FILESYSTEM_STORAGE) + "/Dao/" + this.getPK() + "-File";
    }

    ////=======================================================================
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="dataType=filesystemFile">
    ///   <token name="functionName" replaceText="FilesystemFile" />
    ///   <token name="label" replaceText="FileLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="filesystem_file_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public static final String PROPERTY_FilesystemFile = "FilesystemFile";
    public static final String PROPERTY_FilesystemFileId = "FilesystemFileId";
    public static final String PROPERTY_FilesystemFileExtension = "FilesystemFileExtension";
    public static final String PROPERTY_FilesystemFileLocation = "FilesystemFileLocation";
    public static final String LABEL_FilesystemFile = "FilesystemFileLabel";
    public static final String FIELD_FilesystemFile = "filesystem_file_field";
    public static final String FULL_FIELD_FilesystemFile = Dao.TABLENAME + "." + Dao.FIELD_FilesystemFile;

    /**
     * Getter method for Value
     * @Returns the FilesystemFile Value
     * @param none
     * @since JDK 1.1
     */
    public String getFilesystemFile() throws Exception {
        return getTypeString(PROPERTY_FilesystemFile);
    }

    /**
     * Setter method for Value
     * @Returns none
     * @param FilesystemFile value
     * @since JDK 1.1
     */
    public void setFilesystemFile(String value) {
        setTypeString(PROPERTY_FilesystemFile, value);
    }

    public String getFilesystemFileExtension() throws Exception {
        String name = getFilesystemFile();
        if (Util.isBlankOrNull(name)) return null;
        int lastIndex = name.lastIndexOf(".");
        if (lastIndex > -1 && name.length() > lastIndex + 1) {
            name = name.substring(lastIndex + 1);
        } else {
            name = null;
        }
        if (name == null) {
            return ".unknown";
        }
        return name;
    }

    public static long m_fileCounterFilesystemFile = 0;
    protected String m_newFileNameFilesystemFile = null;
    protected String m_oldFileNameFilesystemFile = null;
    public String getFilesystemFileFileNameStart() throws Exception {
        if (Util.isBlankOrNull(getFilesystemFile())) return null;
        Long pk = getPK();
        String index = null;
        if (pk == null) {
            index = "new_" + (m_fileCounterFilesystemFile++);
        } else {
            index = pk.toString();
        }
        String fileName = index + "-" + "FilesystemFile-";
        return fileName;
    }
    public String getFilesystemFileFileName() throws Exception {
        return getFilesystemFileFileNameStart() + getFilesystemFile();
    }
    public String getFilesystemFileFilePath() throws Exception {
        if (Util.isBlankOrNull(getFilesystemFile())) return null;
        return Config.getInstance().getProperty(Config.S_FILESYSTEM_STORAGE) + "/Dao/";
    }
    public String getFilesystemFileFileLocation() throws Exception {
        if (Util.isBlankOrNull(getFilesystemFile())) return null;
        String location = getFilesystemFileFilePath() + getFilesystemFileFileName();
        if (getPK() == null && m_newFileNameFilesystemFile == null) {
            m_newFileNameFilesystemFile = location;
        }
        return location;
    }
    public File getFilesystemFileFile() throws Exception {
        String location = getFilesystemFileFileLocation();
        if (location == null) return null;
        File file = new File(location);
        return file;
    }
    public void setFilesystemFileFileData(InputStream stream) throws Exception {
        Util.writeInputStreamIntoFile(getFilesystemFileFileLocation(), stream);
    }
    public InputStream getFilesystemFileFileData() throws Exception {
        throw new RuntimeException("This method is not meant for use but is only here to allow for reflection to work");
    }
    ////=======================================================================
    /// </foreachEntityProperty>

    /// <foreachEntityProperty where="dataType=filesystemFile, isPublicImage=true">
    ///   <token name="functionName" replaceText="FilesystemFile" />
    ///   <token name="label" replaceText="FileLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="fieldName" replaceText="filesystem_file_field" replaceTextIfNullField="functionName" replaceTextIfNullPattern="UNDERSCORE" />
    ////=======================================================================
    public String getFilesystemFileUrl() throws Exception {
        if (Util.isBlankOrNull(getFilesystemFile())) return null;
        return Config.getProperty("filesystem.baseUrl") + "/Dao/" + getFilesystemFileFileName();
    }
    ////=======================================================================
    /// </foreachEntityProperty>



    /// <foreachEntityProperty where="dataType=foreignVector">
    ///   <token name="functionName" replaceText="ForeignVector" />
    ///   <token name="label" replaceText="ForeignLabel" replaceTextIfNullField="functionName" replaceTextIfNullPattern="LABEL" />
    ///   <token name="foreignTableName" replaceText="template_test_link_table" />
    ////=======================================================================
    public static final String PROPERTY_ForeignVector = "ForeignVector";
    public static final String TABLENAME_ForeignVector = "template_test_link_table";
    public static final String LABEL_ForeignVector = "ForeignLabel";

    /**
     * Getter method for Value
     * @Returns the Foreign Value
     * @param none
     * @since JDK 1.1
     */
    public Vector getForeignVector() throws Exception {
        return getTypeForeignValues(PROPERTY_ForeignVector);
    }

    /**
     * Setter method for Value
     * @Returns none
     * @param Foreign value
     * @since JDK 1.1
     */
    public void setForeignVector(Vector value) {
        setTypeForeignValues(PROPERTY_ForeignVector, value);
    }
    ////=======================================================================
    /// </foreachEntityProperty>


    public String getForeignTableName(String property) {
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        if (property.equalsIgnoreCase(PROPERTY_ForeignVector)) {
            return TABLENAME_ForeignVector;
        }
        /// </foreachEntityProperty>
        return null;
    }

    public Vector getForeignPropertyNames() {
        Vector propertyNames = new Vector();
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        propertyNames.add(PROPERTY_ForeignVector);
        /// </foreachEntityProperty>

        return propertyNames;
    }

    public boolean isPropertyForeignVector(String property) {
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        if (property.equalsIgnoreCase(PROPERTY_ForeignVector)) {
            return true;
        }
        /// </foreachEntityProperty>
        return false;
    }

    public boolean isPropertyMultiValue(String property) {
        /// <foreachEntityProperty where="dataType=vector">
        ///   <token name="functionName" replaceText="VectorValue" />
        ////---------------------------------------------------------------
        if (property.equalsIgnoreCase(Dao.PROPERTY_VectorValue)) {
            return true;
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        ////---------------------------------------------------------------
        if (property.equalsIgnoreCase(Dao.PROPERTY_ForeignVector)) {
            return true;
        }
        /// </foreachEntityProperty>

        return false;
    }

    public Long getForeignKey(String property) throws Exception {
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        ///   <token name="functionForeignKey" replaceText="LongValue" />
        if (property.equalsIgnoreCase(PROPERTY_ForeignVector)) {
            return getLongValue();
        }
        /// </foreachEntityProperty>
        return null;
    }

    public String getForeignKeyName(String property) throws Exception {
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        ///   <token name="functionForeignKey" replaceText="LongValue" />
        if (property.equalsIgnoreCase(PROPERTY_ForeignVector)) {
            return FIELD_LongValue;
        }
        /// </foreachEntityProperty>
        return null;
    }

    public String getLinkKeyName(String property) throws Exception {
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        ///   <token name="linkKey" replaceText="link_key" />
        if (property.equalsIgnoreCase(PROPERTY_ForeignVector)) {
            return "link_key";
        }
        /// </foreachEntityProperty>
        return null;
    }

    public void setForeignValuesFromResultSet(String property, ResultSet rs) throws Exception {
        /// <foreachEntityProperty where="dataType=foreignVector">
        ///   <token name="functionName" replaceText="ForeignVector" />
        if (property.equalsIgnoreCase(PROPERTY_ForeignVector)) {
            Vector values = new Vector();
            while (rs.next()) {
                values.add(rs.getString(1));
            }
            setForeignVector(values);
        }
        /// </foreachEntityProperty>
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
                    /// <foreachEntityProperty where="type=field">
                    ///   <token name="functionName" replaceText="StringValue" />
                    ////---------------------------------------------------------------
                    m_beanMap.put(PROPERTY_StringValue.toLowerCase(), FIELD_StringValue);
                    ////---------------------------------------------------------------
                    /// </foreachEntityProperty>
                    /// <remove>
                    m_beanMap.put(PROPERTY_IntegerValue.toLowerCase(), FIELD_IntegerValue);
                    m_beanMap.put(PROPERTY_BooleanValue.toLowerCase(), FIELD_BooleanValue);
                    m_beanMap.put(PROPERTY_LongValue.toLowerCase(), FIELD_LongValue);
                    m_beanMap.put(PROPERTY_FloatValue.toLowerCase(), FIELD_FloatValue);
                    m_beanMap.put(PROPERTY_DecimalValue.toLowerCase(), FIELD_DecimalValue);
                    m_beanMap.put(PROPERTY_DateValue.toLowerCase(), FIELD_DateValue);
                    m_beanMap.put(PROPERTY_VectorValue.toLowerCase(), FIELD_VectorValue);
                    m_beanMap.put(PROPERTY_FileValue.toLowerCase(), FIELD_FileValue);
                    m_beanMap.put(PROPERTY_FilesystemFile.toLowerCase(), FIELD_FilesystemFile);
                    /// </remove>
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

            /// <foreachEntityProperty where="dataType=integer">
            ///   <token name="functionName" replaceText="IntegerValue" />
            ////---------------------------------------------------------------
            if (fieldNames.containsKey(FIELD_IntegerValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_IntegerValue)) {
                String integerResult = rs.getString(FIELD_IntegerValue.toLowerCase());
                if (integerResult != null) {
                    setIntegerValue(new Integer(integerResult));
                } else {
                    setIntegerValue(null);
                }
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=long">
            ///   <token name="functionName" replaceText="LongValue" />
            ////---------------------------------------------------------------
            if (fieldNames.containsKey(FIELD_LongValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_LongValue)) {
                String longResult = rs.getString(FIELD_LongValue.toLowerCase());
                if (longResult != null) {
                    setLongValue(new Long(longResult));
                } else {
                    setLongValue(null);
                }
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=entity">
            ///   <token name="functionName" replaceText="EntityValue" />
            ////---------------------------------------------------------------
            if (fieldNames.containsKey(FIELD_EntityValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_EntityValue)) {
                String entityResult = rs.getString(FIELD_EntityValue.toLowerCase());
                if (entityResult != null) {
                    setEntityValue(new Long(entityResult));
                } else {
                    setEntityValue(null);
                }
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=boolean">
            ///   <token name="functionName" replaceText="BooleanValue" />
            ////---------------------------------------------------------------
            if (fieldNames.containsKey(FIELD_BooleanValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_BooleanValue)) {
                setBooleanValue(Util.getBooleanFromString(rs.getString(FIELD_BooleanValue.toLowerCase())));
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=string">
            ///   <token name="functionName" replaceText="StringValue" />
            if (fieldNames.containsKey(FIELD_StringValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_StringValue)) {
                setStringValue(rs.getString(FIELD_StringValue.toLowerCase()));
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=date,isDateOnly!=true">
            ///   <token name="functionName" replaceText="DateValue" />
            if (fieldNames.containsKey(FIELD_DateValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_DateValue)) {
                setDateValue(rs.getTimestamp(FIELD_DateValue.toLowerCase()));
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=date,isDateOnly=true">
            ///   <token name="functionName" replaceText="DateValue" />
            if (fieldNames.containsKey(FIELD_DateValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_DateValue)) {
                setDateValue(Util.toDate(rs.getDate(FIELD_DateValue.toLowerCase())));
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=vector">
            ///   <token name="functionName" replaceText="VectorValue" />
            if (fieldNames.containsKey(FIELD_VectorValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_VectorValue)) {
                setVectorValue(Util.getVectorFromMVString(rs.getString(FIELD_VectorValue.toLowerCase())));
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=file">
            ///   <token name="functionName" replaceText="FileValue" />
            if (fieldNames.containsKey(FIELD_FileValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_FileValue)) {
                setFileValue(rs.getString(FIELD_FileValue.toLowerCase()));
            }
            /// </foreachEntityProperty>
            /// <foreachEntityProperty where="dataType=filesystemFile">
            ///   <token name="functionName" replaceText="FilesystemFile" />
            if (fieldNames.containsKey(FIELD_FilesystemFile) && !hasPropertyChanged(PROPERTY_FilesystemFile)) {
                setFilesystemFile(rs.getString(FIELD_FilesystemFile));
            }
            /// </foreachEntityProperty>

            /// <foreachEntityProperty where="dataType=float">
            ///   <token name="functionName" replaceText="FloatValue" />
            if (fieldNames.containsKey(FIELD_FloatValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_FloatValue)) {
                String floatResult = rs.getString(FIELD_FloatValue.toLowerCase());
                if (floatResult != null) {
                    setFloatValue(new Float(floatResult));
                } else {
                    setFloatValue(null);
                }
            }
            /// </foreachEntityProperty>

            /// <foreachEntityProperty where="dataType=decimal">
            ///   <token name="functionName" replaceText="DecimalValue" />
            if (fieldNames.containsKey(FIELD_DecimalValue.toLowerCase()) && !hasPropertyChanged(PROPERTY_DecimalValue)) {
                String decimalResult = rs.getString(FIELD_DecimalValue.toLowerCase());
                if (decimalResult != null) {
                    setDecimalValue(new BigDecimal(decimalResult));
                } else {
                    setDecimalValue(null);
                }
            }
            /// </foreachEntityProperty>


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

        /// <foreachEntityProperty where="dataType=integer">
        ///   <token name="functionName" replaceText="IntegerValue" />
        if (hasPropertyChanged(PROPERTY_IntegerValue)) {
            ht.put(FIELD_IntegerValue, checkNullInteger(getIntegerValue()));
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=long">
        ///   <token name="functionName" replaceText="LongValue" />
        if (hasPropertyChanged(PROPERTY_LongValue)) {
            ht.put(FIELD_LongValue, checkNullLong(getLongValue()));
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=entity">
        ///   <token name="functionName" replaceText="EntityValue" />
        if (hasPropertyChanged(PROPERTY_EntityValue)) {
            ht.put(FIELD_EntityValue, checkNullLong(getEntityValue()));
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=boolean">
        ///   <token name="functionName" replaceText="BooleanValue" />
        if (hasPropertyChanged(PROPERTY_BooleanValue)) {
            ht.put(FIELD_BooleanValue, checkNullInteger(Util.toInteger(getBooleanValue())));
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=float">
        ///   <token name="functionName" replaceText="FloatValue" />
        if (hasPropertyChanged(PROPERTY_FloatValue)) {
            ht.put(FIELD_FloatValue, checkNullFloat(getFloatValue()));
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=decimal">
        ///   <token name="functionName" replaceText="DecimalValue" />
        if (hasPropertyChanged(PROPERTY_DecimalValue)) {
            ht.put(FIELD_DecimalValue, checkNullBigDecimal(getDecimalValue()));
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=string">
        ///   <token name="functionName" replaceText="StringValue" />
        if (hasPropertyChanged(PROPERTY_StringValue)) {
            ht.put(FIELD_StringValue, checkNullObject(getStringValue()));
        }
        /// </foreachEntityProperty>

        /// <foreachEntityProperty where="dataType=date">
        ///   <token name="functionName" replaceText="DateValue" />
        if (hasPropertyChanged(PROPERTY_DateValue)) {
            if (getDateValue() == null) {
                ht.put(FIELD_DateValue, NULL_DATE);
            } else {
                ht.put(FIELD_DateValue, getDateValue());
            }
        }
        /// </foreachEntityProperty>

        /// <foreachEntityProperty where="dataType=vector">
        ///   <token name="functionName" replaceText="VectorValue" />
        if (hasPropertyChanged(PROPERTY_VectorValue)) {
            ht.put(FIELD_VectorValue, Util.getMVStringFromVector(getVectorValue()));
        }
        /// </foreachEntityProperty>

        /// <foreachEntityProperty where="dataType=file">
        ///   <token name="functionName" replaceText="FileValue" />
        if (hasPropertyChanged(PROPERTY_FileValue)) {
            ht.put(FIELD_FileValue, getFileValue());
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=filesystemFile">
        ///   <token name="functionName" replaceText="FilesystemFile" />
        if (hasPropertyChanged(PROPERTY_FilesystemFile)) {
            ht.put(FIELD_FilesystemFile, getFilesystemFile());
        }
        /// </foreachEntityProperty>

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


    /// <foreachEntityProperty where="type=finder, finderType=fullLoad">
    ///   <token name="functionName" replaceText="findByTest" />
    ///   <token name="arguments" replaceText="String arg1, Integer arg2" />
    ///   <token name="bindParams" replaceText="arg1, arg2" />
    ///   <token name="whereClause" replaceText="FIELD_StringValue + SQL_EQUALS + SQL_AND + FIELD_IntegerValue + SQL_EQUALS" />
    ///   <token name="orderBy" replaceText="FIELD_LongValue" />
    public Vector findByTest(String arg1, Integer arg2) throws Exception {
        String orderBy = FIELD_LongValue;
        String orderByClause = "";
        if (orderBy != null && orderBy.length() > 0) {
            orderByClause = " order by " + orderBy;
        }

        return this.getEntities(this, "SELECT * FROM " + this.getDbTableName() + 
                                " WHERE " + FIELD_StringValue + SQL_EQUALS + SQL_AND + FIELD_IntegerValue + SQL_EQUALS + 
                                orderByClause, new Object[] {arg1, arg2});
    }
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="type=finder, finderType=lazyLoad">
    ///   <token name="functionName" replaceText="findByTest2" />
    ///   <token name="arguments" replaceText="String arg1, Integer arg2" />
    ///   <token name="bindParams" replaceText="arg1, arg2" />
    ///   <token name="whereClause" replaceText="FIELD_StringValue + SQL_EQUALS + SQL_AND + FIELD_IntegerValue + SQL_EQUALS" />
    ///   <token name="orderBy" replaceText="FIELD_LongValue" />
    public Vector findByTest2(String arg1, Integer arg2) throws Exception {
        String orderBy = FIELD_LongValue;
        String orderByClause = "";
        if (orderBy != null && orderBy.length() > 0) {
            orderByClause = " order by " + orderBy;
        }

        return this.getEntities(this, "SELECT " + getPKName() + " FROM " + this.getDbTableName() + 
                                " WHERE " + FIELD_StringValue + SQL_EQUALS + SQL_AND + FIELD_IntegerValue + SQL_EQUALS + 
                                orderByClause, new Object[] {arg1, arg2});
    }
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="fk=true">
    ///   <token name="functionName" replaceText="FkValue" />
    ///   <token name="functionName" replaceText="LongValue" />
    ///   <token name="orderBy" replaceText="null" />
    public Collection findByFkValue(Long fk) throws Exception {
        String orderBy = null;
        String orderByClause = "";
        if (orderBy != null && orderBy.length() > 0) {
            orderByClause = " order by " + orderBy;
        }

        return this.getEntities(this, "SELECT * from " + this.getDbTableName() + 
                                "WHERE " + FIELD_LongValue + SQL_EQUALS + orderByClause, new Object[] {fk});
    }

    public Entity findByPkAndFkValue(Long pk, Long fk) throws Exception {
        String orderBy = null;
        String orderByClause = "";
        if (orderBy != null && orderBy.length() > 0) {
            orderByClause = " order by " + orderBy;
        }

        Collection results = this.getEntities
                             (this, "SELECT * from " + this.getDbTableName() + 
                              "WHERE " + getPKName() + SQL_EQUALS + SQL_AND + 
                              FIELD_LongValue + SQL_EQUALS + orderByClause, new Object[] {pk, fk});
        if (results != null && results.size() > 0) {
            return(Entity)results.iterator().next();
        }
        return null;
    }
    /// </foreachEntityProperty>


    public static final String SQL_EQUALS = " = ? ";
    public static final String SQL_AND = " and ";
    public static final String SQL_LIKE = " like ?";


    /// <foreachEntityProperty where="type=tableInfo">
    ///   <token name="tableName" replaceText="template_test_table" />
    public static final String TABLENAME = "template_test_table";
    public String getDbTableName() {
        return TABLENAME;
    }
    /// </foreachEntityProperty>


    /// <foreachEntityProperty where="pk=true">
    ///   <token name="functionName" replaceText="LongValue" />
    public String getPKName() {
        return FIELD_LongValue;
    }
    public Long getPK() throws Exception {
        return getLongValue();
    }

    public void setPK(Long pk) {
        setLongValue(pk);
    }

    public static Dao findByLongValue(Long pk) throws Exception {
        Vector results = new Dao().findBySQL("select * from " + Dao.TABLENAME + 
                                             " where " + Dao.FIELD_LongValue + " = ?", new Object[] {pk});
        if (results == null || results.size() == 0) return null;
        return(Dao) results.elementAt(0);
    }
    /// </foreachEntityProperty>

    public void delete() throws Exception {
        /// <foreachEntityProperty where="dataType=filesystemFile">
        ///   <token name="functionName" replaceText="FilesystemFile" />
        File dirFilesystemFile = null;
        if (getFilesystemFileFilePath() != null) {
            dirFilesystemFile = new File(getFilesystemFileFilePath());
        }
        /// </foreachEntityProperty>
        doDelete();
        /// <foreachEntityProperty where="dataType=filesystemFile">
        ///   <token name="functionName" replaceText="FilesystemFile" />
        if (dirFilesystemFile != null && dirFilesystemFile.exists()) {
            String fileStart = getFilesystemFileFileNameStart();
            String fileName = getFilesystemFileFileName();
            File[] files = dirFilesystemFile.listFiles();
            for (int i = 0;i < files.length;i++) {
                if (files[i].getName().startsWith(fileStart)) {
                    m_log.debug("Deleting filesystemFile by removing file: " + files[i].getName());
                    files[i].delete();
                }
            }
        }
        /// </foreachEntityProperty>

    }

    public Database getDatabase() {
        return super.getDatabase();
    }


    public void insertPre() throws Exception {
        /// <foreachEntityProperty where="dataType=date, isCreateDate=true">
        ///   <token name="functionName" replaceText="DateValue" />
        ///   <token name="_REMOVE" replaceText='//' />
        //  if (getDateValue() == null) setDateValue(Util.getCurrentDate());
        /// </foreachEntityProperty>
    }

    public void updatePre() throws Exception {
        /// <foreachEntityProperty where="dataType=date, isModifyDate=true">
        ///   <token name="functionName" replaceText="DateValue" />
        ///   <token name="_REMOVE" replaceText='//' />
        //setDateValue(Util.getCurrentDate());
        /// </foreachEntityProperty>
    }

    public void savePost() throws Exception {
        /// <foreachEntityProperty where="dataType=file">
        ///   <token name="functionName" replaceText="FileValue" />
        if (this.hasPropertyChanged(PROPERTY_FileValue) && !Util.isBlankOrNull(getFileValue())) {
            String fileSystemStorage = Config.getInstance().getProperty(Config.S_FILESYSTEM_STORAGE);
            String fileSystemUpload = Config.getInstance().getProperty(Config.S_FILESYSTEM_UPLOAD);

            // Make directory for object
            File storageDir = new File(fileSystemStorage + "Dao");
            if (!storageDir.exists()) {
                storageDir.mkdir();
            }

            // Erase any old files
            File oldFile = new File(getFileValueLocation());
            if (oldFile.exists()) {
                oldFile.delete();
            }

            // Move the file to the real location
            File uploadedFile = new File(fileSystemUpload + getFileValue());
            if (uploadedFile.exists()) {
                uploadedFile.renameTo(oldFile);
            }
        }
        /// </foreachEntityProperty>
        /// <foreachEntityProperty where="dataType=filesystemFile">
        ///   <token name="functionName" replaceText="FilesystemFile" />
        if (this.hasPropertyChanged(PROPERTY_FilesystemFile) && !Util.isBlankOrNull(getFilesystemFile())) {
            if (!Util.isBlankOrNull(m_newFileNameFilesystemFile)) {
                m_log.debug("Renaming new FilesystemFile file to " + getFilesystemFileFileLocation());
                // Move the file to the real location
                File uploadedFile = new File(m_newFileNameFilesystemFile);
                if (uploadedFile.exists()) {
                    uploadedFile.renameTo(new File(getFilesystemFileFileLocation()));
                }
            }
            File dir = new File(getFilesystemFileFilePath());
            if (dir.exists()) {
                String fileStart = getFilesystemFileFileNameStart();
                String fileName = getFilesystemFileFileName();
                File[] files = dir.listFiles();
                for (int i = 0;i < files.length;i++) {
                    if (files[i].getName().startsWith(fileStart) && !files[i].getName().equals(fileName)) {
                        m_log.debug("Cleaning up filesystemFile by removing file: " + files[i].getName());
                        files[i].delete();
                    }
                }
            }
        }
        /// </foreachEntityProperty>

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

/// </foreachEntityProperty>


