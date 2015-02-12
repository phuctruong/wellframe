package com.wellframe.dao;

import java.io.*;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.*;
import java.util.*;

import org.apache.log4j.*;

import java.sql.DriverManager;
import org.apache.commons.dbcp.PoolingDriver;
import org.apache.commons.pool.impl.GenericObjectPool;

import com.zoomlane.database.Database;
import com.zoomlane.database.DatabasePool;
import com.zoomlane.entity.*;
import com.zoomlane.util.*;

/**
 * Base Dao for 
 */
public abstract class BaseDao extends com.zoomlane.entity.Entity implements Cloneable, Serializable {

    public Database getDatabase() {
        return getDatabase("wellframe");
    }

    public static Database getDatabase(String database) {
	return new Database(database);
    }

}

