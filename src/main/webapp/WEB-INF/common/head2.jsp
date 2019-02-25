<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+
            request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

%>
<meta charset="UTF-8">
<base href="<%=basePath%>" >
<link href="res/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="res/css/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="res/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="res/js/jquery.form.js"></script>
<script type="text/javascript" src="res/js/bootstrap.min.js"></script>
<script type="text/javascript" src="res/js/highcharts-4.1.min.js"></script>
<script type="text/javascript" src="res/js/oc.min.js"></script>
<link rel="icon" type="image/png" href="res/i/ico.png" sizes="16x16">