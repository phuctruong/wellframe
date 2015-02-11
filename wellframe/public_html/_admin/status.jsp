<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.zoomlane.util.*" %>
<%@ page import="com.zoomlane.database.*" %>
<%@ page import="com.metrosite.util.*" %>

<%
		StringBuffer message = new StringBuffer();
        	
      	Database db = new Database();
      	try {
        	db.executeQuery("select 1 from user", new Object[]{});
        } catch (Exception e) {
        	message.append("*Unable to query the user database.*\n");
        } finally {
        	db.close();
        }
        
        org.apache.commons.pool.impl.GenericObjectPool connectionPool = com.zoomlane.database.DatabasePool.getConnectionPool("mysql");
        long numActive = connectionPool.getNumActive();
		if (numActive > 40)
			message.append("*Number of database connections is alarmingly high: " + numActive + "*\n");
		
%>

<html>
	<head>
		<title>Status</title>
	</head>
	<body>
		<h1> Problems: </h1>
		<%= message %>
	</body>
</html>
