/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="description" replaceText="class_description_here" />
///   <token name="className" replaceText="Dao" />
////===================================================================================================
package com.templates.dao.sync;

import java.io.*;
import java.text.*;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;
import com.templates.dao.*;
import com.templates.customtag.*;
import com.infomata.data.*;

/**
 * class_description_here
 */
public class SyncDao {

  private static Logger m_log = Config.getLogger(SyncDao.class);

  public Vector getPropertyInfo() {
     Vector fieldInfo = new Vector();
     /// <foreachEntityProperty where="dataType=long">
     ///   <token name="functionName" replaceText="LongValue" />
     fieldInfo.add(new String[] {Dao.LABEL_LongValue, Dao.PROPERTY_LongValue});
     /// </foreachEntityProperty>
     /// <foreachEntityProperty where="dataType=integer">
     ///   <token name="functionName" replaceText="IntegerValue" />
     fieldInfo.add(new String[] {Dao.LABEL_IntegerValue, Dao.PROPERTY_IntegerValue});
     /// </foreachEntityProperty>
     /// <foreachEntityProperty where="dataType=string">
     ///   <token name="functionName" replaceText="StringValue" />
     fieldInfo.add(new String[] {Dao.LABEL_StringValue, Dao.PROPERTY_StringValue});
     /// </foreachEntityProperty>
     return fieldInfo;
  }

  public Dao loadFromRowData(DataRow row) throws Exception {
     /// <foreachEntityProperty where="pk=true">
     /// <token name="functionName" replaceText="LongValue" />
     Long pk = Util.toLong(row.getString(Dao.LABEL_LongValue), null);
     if (pk != null) {
        Dao entity = new Dao();
        entity.setLongValue(pk);
        entity.loadFullInfo();
        if (entity.getLongValue() == null) return null;
        return entity;
     }
     /// </foreachEntityProperty>
     return null;
  }

  public Vector importDaos(File file, Vector messages) throws Exception {
     Vector fields = getPropertyInfo();
     Vector entities = new Vector();
     DataFile read = DataFile.createReader("8859_1");
     read.setDataFormat(new CSVFormat());
     read.containsHeader(true);
     try {
        read.open(file);
        int i = 1;
        for (DataRow row = read.next(); row != null; row = read.next()) {
           Dao entity = new Dao();
           String fieldLabel = null;
           String propertyName = null;
           try {
              Dao existingDao = loadFromRowData(row);
              if (existingDao != null) entity = existingDao;
              Iterator it = fields.iterator();
              Vector updatedFields = new Vector();
              while (it.hasNext()) {
                 String[] fieldInfo = (String[])it.next();
                 fieldLabel = fieldInfo[0];
                 propertyName = fieldInfo[1];
                 if (setPropertyValue(propertyName, row.getString(fieldLabel), entity)) {
                    updatedFields.add(fieldLabel);
                 }
              }
              if (!updatedFields.isEmpty()) {
                 if (existingDao == null) {
                    messages.add("new");
                 } else {
                    messages.add("updated (" + Util.join(", ", updatedFields) + ")");
                 }
              } else {
                 messages.add("same");
              }
           } catch (Exception e) {
              messages.add("Exception setting " + fieldLabel + " for row " + i);
           } finally {
              entities.add(entity);
           }
           i++;
           // use the retrieved data ...
        }
     } finally {
        read.close();
     }
     return entities;
  }

  public String exportDaos(Vector entities) throws Exception {

     Vector fields = getPropertyInfo();
     StringBuffer results = new StringBuffer();

     // Do the first row
     Iterator it = fields.iterator();
     results.append(getHtmlTableStart());
     results.append(getHtmlHeaderRowStart());
     while (it.hasNext()) {
        String[] fieldInfo = (String[]) it.next();
        String fieldLabel = fieldInfo[0];
        String propertyName = fieldInfo[1];
        results.append(getHtmlHeaderColumnStart(propertyName));
        results.append(fieldLabel);
        results.append(getHtmlHeaderColumnEnd(propertyName));
     }
     results.append(getHtmlHeaderRowEnd());

     // Do each row individually
     Iterator it2 = entities.iterator();
     int row = 0;
     while (it2.hasNext()) {
        Dao entity = (Dao) it2.next();
        it = fields.iterator();
        results.append(getHtmlDataRowStart(row));
        while (it.hasNext()) {
           String[] fieldInfo = (String[]) it.next();
           String fieldLabel = fieldInfo[0];
           String propertyName = fieldInfo[1];
           results.append(getHtmlDataColumnStart(propertyName));
           results.append(getStringValue(propertyName, entity));
           results.append(getHtmlDataColumnEnd(propertyName));
        }
        results.append(getHtmlDataRowEnd(row));
        row++;
     }
     results.append(getHtmlTableEnd());
     return results.toString();

  }

  public String getFriendlyListValue(String listName, Long key) throws Exception {
     Vector options = new SelectOptionsFactory().getSelectOptions(listName);
     Iterator it = options.iterator();
     while (it.hasNext()) {
        String[] optionValue = (String[]) it.next();
        if (optionValue[0].equals(key + "")) return optionValue[1];
     }
     return "";
  }

  public Long getListKey(String listName, String value) throws Exception {
     Vector options = new SelectOptionsFactory().getSelectOptions(listName);
     Iterator it = options.iterator();
     while (it.hasNext()) {
        String[] optionValue = (String[]) it.next();
        if (optionValue[1].equalsIgnoreCase(value)) return Util.toLong(optionValue[0], null);
     }
     return null;
  }

  public boolean setPropertyValue(String propertyName, String value, Dao entity) throws Exception {
     /// <foreachEntityProperty where="dataType=long, inputType=select">
     ///   <token name="functionName" replaceText="LongValue" />
     ///   <token name="selectOptionsList" replaceText="listName" />
     ////=======================================================================
     if (propertyName.equals(Dao.PROPERTY_LongValue)) {
        if (value == null) return false;
        if (Util.isBlankOrNull(value) && entity.getPK() != null && entity.getLongValue() == null) return false;
        Long keyValue = getListKey("listName", value);
        if (keyValue == null) {
           if (entity.getLongValue() != null) {
              entity.setLongValue(keyValue);
              return true;
           }
           return false;
        } else if (keyValue.equals(entity.getLongValue())) {
             return false;
        }
        entity.setLongValue(keyValue);
        return true;
     }
     /// </foreachEntityProperty>    
     /// <foreachEntityProperty where="dataType=string">
     ///   <token name="functionName" replaceText="StringValue" />
     ////=======================================================================
     if (propertyName.equals(Dao.PROPERTY_StringValue)) {
        if (value == null) return false;
        if (Util.isBlankOrNull(value) && Util.isBlankOrNull(entity.getStringValue())) {
           return false;
        }
        if (entity.getPK() != null) {
           if (value != null && entity.getStringValue() != null &&
               value.trim().equals(entity.getStringValue().trim())) {
              return false;
           }
        }
        entity.setStringValue(value);
        return true;
     }
     /// </foreachEntityProperty>    
     return false;
  }

  public String getStringValue(String propertyName, Dao entity) throws Exception {
     /// <foreachEntityProperty where="dataType=integer, inputType!=select">
     ///   <token name="functionName" replaceText="IntegerValue" />
     ///   <token name="selectOptionsList" replaceText="listName" />
     ////=======================================================================
     if (propertyName.equals(Dao.PROPERTY_IntegerValue)) {
        return Util.toString(entity.getIntegerValue(), "");
     }
     /// </foreachEntityProperty>    
     /// <foreachEntityProperty where="dataType=long, inputType=select">
     ///   <token name="functionName" replaceText="LongValue" />
     ///   <token name="selectOptionsList" replaceText="listName" />
     ////=======================================================================
     if (propertyName.equals(Dao.PROPERTY_LongValue)) {
        return getFriendlyListValue("listName", entity.getLongValue());
     }
     /// </foreachEntityProperty>    
     /// <foreachEntityProperty where="dataType=string">
     ///   <token name="functionName" replaceText="StringValue" />
     ////=======================================================================
     if (propertyName.equals(Dao.PROPERTY_StringValue)) {
        return Util.toString(entity.getStringValue(), "");
     }
     /// </foreachEntityProperty>    
     return "";
  }

  public String getHtmlTableStart() {
     return "<html xmlns:o=\"urn:schemas-microsoft-com:office:office\" xmlns:x=\"urn:schemas-microsoft-com:office:excel\" xmlns=\"http://www.w3.org/TR/REC-html40\"><table border=1>";
  }
  public String getHtmlHeaderRowStart() {
     return "<tr bgcolor=lightgrey valign=top>";
  }
  public String getHtmlHeaderColumnStart(String propertyName) {
     return "<td>";
  }
  public String getHtmlHeaderColumnEnd(String propertyName) {
     return "</td>";
  }
  public String getHtmlHeaderRowEnd() {
     return "</tr>";
  }
  public String getHtmlDataRowStart(int row) {
     return "<tr valign=top>";
  }
  public String getHtmlDataColumnStart(String propertyName) {
     return "<td>";
  }
  public String getHtmlDataColumnEnd(String propertyName) {
     return "</td>";
  }
  public String getHtmlDataRowEnd(int row) {
     return "</tr>";
  }
  public String getHtmlTableEnd() {
     return "<table>";
  }
}

/// </foreachEntityProperty>

