<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+
            request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

%>
<meta charset="UTF-8">
<base href="<%=basePath%>" >
	<script src="bootstrap3/jquery.js"></script>
	<link rel="stylesheet" href="bootstrap3/js/bootstrap-3.3.7/dist/css/bootstrap.min.css"/>
	<script src="bootstrap3/js/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="bootstrap3/css/mycss.css"/>
	<script type="text/javascript" src="res/js/oc.min.js"></script>
	<script type="text/javascript" src="res/js/highcharts-4.1.min.js"></script>
	<script type="text/javascript" src="res/js/jquery.form.js"></script>
	<!-- <script type="text/javascript" src="res/js/jquery-1.11.3.min.js"></script> -->
	<!-- <link rel="stylesheet" href="bootstrap3/css/font-awesome.css"/> -->