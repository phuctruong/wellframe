<%
Enumeration keys = request.getAttributeNames();
while (keys.hasMoreElements()) {
   String keyname = (String) keys.nextElement();
   Object value = request.getAttribute(keyname);
   out.println(keyname + " => " + value + "<br>");
}
org.apache.struts.action.ActionErrors errors = (org.apache.struts.action.ActionErrors) request.getAttribute("org.apache.struts.action.ERROR");
Iterator it = errors.get();
while (it.hasNext()) {
   org.apache.struts.action.ActionError error = (org.apache.struts.action.ActionError) it.next();
   out.println("HERE: " + error.getKey() + "<BR>");
   out.println("HERE: " + com.zoomlane.util.Util.join(", ", error.getValues()) + "<BR>");
}
%>

