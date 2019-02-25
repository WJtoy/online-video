<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+
            request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

%>
<meta charset="UTF-8">
<base href="<%=basePath%>" >
 <link type="text/css" rel="stylesheet" href="bootstraps4/css/components.css" />
 <link type="text/css" rel="stylesheet" href="bootstraps4/css/custom.css" />
 <link type="text/css" rel="stylesheet" href="bootstraps4/css/pages/index.css">
 <link type="text/css" rel="stylesheet" href="#" id="skin_change"/>
 <script type="text/javascript" src="bootstraps4/js/components.js"></script>
 <script type="text/javascript" src="bootstraps4/js/custom.js"></script>