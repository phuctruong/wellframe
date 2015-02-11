/// <foreachEntityProperty where="type=classInfo">
///   <token name="package" replaceText="com.templates" />
///   <token name="description" replaceText="class_description_here" />
///   <token name="className" replaceText="DynaDao" />
///   <token name="className" replaceText="Dao" />
////===================================================================================================
package com.templates.dao;

import java.sql.ResultSet;
import java.text.*;
import java.util.*;

import org.apache.log4j.Logger;

import com.zoomlane.database.*;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;
import com.zoomlane.struts.form.*;

/**
 * class_description_here
 */
public class DynaDao extends DaoProperties implements IDynaObject {

    private static Logger m_log = Config.getLogger(DynaDao.class);
    public DynaDao() {super();}

}

/// </foreachEntityProperty>

