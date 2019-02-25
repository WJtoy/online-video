<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String basePath = request.getScheme()+"://"+
            request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

%>
<meta charset="UTF-8">
<base href="<%=basePath%>" >
<script src="backui/easyui/jquery.min.js"></script>
<script src="backui/easyui/jquery.easyui.min.js"></script>
<script src="backui/easyui/locale/easyui-lang-zh_CN.js"></script>
<script src="backui/js/bootstrap.min.js"></script>
<script src="backui/js/datagrid-filter.js"></script>
<script src="backui/js/utils.js"></script>
<link href="backui/css/bootstrap.min.css" rel="stylesheet">
<link id = "styleId" href="backui/easyui/themes/gray/easyui.css" rel="stylesheet">
<link href="backui/easyui/themes/icon.css" rel="stylesheet">
