<html>
<head>
<%
    String baseUrl = request.getScheme() + "://" + request.getServerName();
    if (request.getServerPort() != 80) baseUrl += ":" + request.getServerPort();
    baseUrl += request.getContextPath() + "/";
%>
    <base href="<%= baseUrl %>" />

    <script type="text/javascript" src="<%= baseUrl %>/_js/base.js"></script>

    <script type="text/javascript" src="<%= baseUrl %>/_js/jquery-1.7.1.min.js"></script>
    <link rel="stylesheet" href="<%= baseUrl %>/_css/styles.css" type="text/css" />

</head>
<body>

