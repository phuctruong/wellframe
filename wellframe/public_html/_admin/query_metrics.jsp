<%@page import="java.util.*" %>
<%@page import="com.zoomlane.database.*" %>
<%@page import="com.zoomlane.util.*" %>
<%@ include file="security.jsp" %>
<%
Iterator it;
String databaseName = (String)request.getSession().getAttribute("_queryMetricsDb");
if (request.getParameter("db") != null) {
   databaseName = request.getParameter("db");
   request.getSession().setAttribute("_queryMetricsDb", databaseName);
}
if (databaseName == null) {
   databaseName = "all";
   request.getSession().setAttribute("_queryMetricsDb", databaseName);
}
Vector databasePools = new Vector();
databasePools.add("all");
databasePools.addAll(Util.split(",", Util.toSingleSpace(Config.getInstance().getProperty("database.pools", ""))));

Hashtable metrics = new Hashtable();
int totalAll = 0;
if ("all".equals(databaseName)) {
   it = databasePools.iterator();
   while (it.hasNext()) {
      String poolName = (String) it.next();
	  if (poolName.equalsIgnoreCase("all")) continue;
      Hashtable metricsTmp = Database.getDatabaseQueryMetrics(poolName);
      Enumeration keys = metricsTmp.keys();
	  while (keys.hasMoreElements()) {
		 String query = (String) keys.nextElement();
		 QueryMetric metric = (QueryMetric) metricsTmp.get(query);
		 metrics.put(poolName + ": " + query, metricsTmp.get(query));
      }
   }
} else {
   metrics = Database.getDatabaseQueryMetrics(databaseName);
}
if (request.getParameter("clear") != null) {
	if ("all".equals(databaseName)) {
	   it = databasePools.iterator();
	   while (it.hasNext()) {
		  String poolName = (String) it.next();
		  if (poolName.equalsIgnoreCase("all")) continue;
		  Hashtable metricsTmp = Database.getDatabaseQueryMetrics(poolName);
          metricsTmp.clear();
	   }
	} else {
       metrics.clear();
    }
}
Vector values = new Vector(metrics.values());
int maxResults = Util.toInteger(request.getParameter("maxResults"), new Integer(20)).intValue();
int count = 0;
long totalTime = 0;
it = values.iterator();
while (it.hasNext()) {
   QueryMetric metric = (QueryMetric) it.next();
   totalTime += metric.getTotalTime();
}
%>
<html>
<head>
<script type="text/javascript" src="sorttable.js"></script>
</head>
<body>

Database Pools:
<%
it = databasePools.iterator();
Vector poolLinks = new Vector();

while (it.hasNext()) {
   String poolName = (String) it.next();
   Hashtable metricsTmp = Database.getDatabaseQueryMetrics(poolName);
   if (poolName.equalsIgnoreCase(databaseName)) {
      poolLinks.add("<a href=\"query_metrics.jsp?db=" +  poolName + "\" style=\"font-size: 1.2em\"><b>" + poolName + "</b></a> (" + metricsTmp.size() + ")");
   } else {
      poolLinks.add("<a href=\"query_metrics.jsp?db=" +  poolName + "\">" + poolName + "</a> (" + metricsTmp.size() + ")");
   }
}
out.println(Util.join(" | ", poolLinks));
%>
<br/><br/>

<table>
<tr><td>
<form action="query_metrics.jsp">
<input type="text" name="maxResults" value="<%= maxResults %>" />
<input type="submit" value="Update Max Results" />
</form>
</td><td>
<form action="query_metrics.jsp">
<input type="hidden" name="clear" value="true" />
<input type="submit" value="Clear Metrics" />
</form>
</td><td>
<form action="query_metrics.jsp">
<input type="submit" value="Refresh" />
</form>
</td></tr>
</table>

<h2>Total (<%= databaseName %>): <%= values.size() %> queries, <%= totalTime %> ms</h2>
<br/>
<h2>Slow queries</h2>
<table class="sortable">
  <tr bgcolor="lightblue">
    <th>Pool</th>
    <th>Rank</th>
    <th>Query</th>
    <th>Average</th>
    <th>Min</th>
    <th>Max</th>
    <th>Count</th>
    <th>Time</th>
  </tr>
<%
// Sort by average
Collections.sort(values, new Comparator() {
    public int compare(Object aObject, Object bObject ) {
       try {QueryMetric a = (QueryMetric) aObject;
            QueryMetric b = (QueryMetric) bObject;
            if (a.getTotalTime() > b.getTotalTime()) return -1;
            if (a.getTotalTime() < b.getTotalTime()) return 1;
            return 0;
        } catch (Exception e) {return 0;}
    }
});
it = values.iterator();
count = 0;
while (it.hasNext()) {
   count++;
   if (count == maxResults) {
      break;
   }
   QueryMetric metric = (QueryMetric) it.next();
   %>
   <tr style="border-bottom: lightgrey;vertical-align:top">
   <td style="padding-right: 20px;white-space: nowrap;"><%= metric.getDatabaseAlias() %></td>
   <td><%= count %></td>
   <td><%= metric.getQuery() %></td>
   <td><%= metric.getAverageTime() %></td>
   <td><%= metric.getMinTime() %></td>
   <td><%= metric.getMaxTime() %></td>
   <td><%= metric.getTotalQueries() %></td>
   <td><%= metric.getTotalTime() %></td>
   </tr>
   <%
}

%>

</table>


</body>
</html>
