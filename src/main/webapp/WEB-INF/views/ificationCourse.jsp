<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@include file="../common/receptions.jsp"%>
<%-- <script type="text/javascript" src="${APP_PATH }/bootstrap3/jquery.js"></script> --%>
</head>
<body>
<c:import url="../common/receptop.jsp"/>
<div class="container" style="box-shadow: 0 4px 4px 0px rgba(7,17,27,.1);margin-top: 20px">
    <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">方向：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills"><!-- ${APP_PATH}/classes/findByAllClass -->
            <c:if test="${classFid == null }">
                        <li class="active" ><a href="${APP_PATH}/classes/findByAllClass" >全部</a></li>
              </c:if>
                        
            <c:if test="${classFid != null }">
                        <li  ><a href="${APP_PATH}/classes/findByAllClass" >全部</a></li>
             </c:if>
                        
                   <c:forEach items="${allClass }" var="item">
                     <c:choose>
                        <c:when test="${item.fid eq 0 }">       <!-- onclick="classId(${item.id})" -->
                         <c:if test="${classFid eq item.id }">
                         <li class="active"><a href="${APP_PATH}/classes/findByAllClass?classFid=${item.id}" >${item.classname}</a></li>
                         </c:if>
                         <c:if test="${classFid != item.id }">
                         <li ><a href="${APP_PATH}/classes/findByAllClass?classFid=${item.id}" >${item.classname}</a></li>
                         </c:if>
                         </c:when>
                     </c:choose>
                   </c:forEach>
                           <!-- <li><a href="javascript:void(0)">前端</a></li>
                           <li><a href="javascript:void(0)">网站架构</a></li> -->
            </ul>
        </div>
    </div>
  <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">分类：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills">
            
            <c:if test="${classCid == null }">			<!-- ?classFid=${classFid} -->
                  <li class="active" ><a href="${APP_PATH}/classes/findByAllClass" >全部</a></li>
              </c:if>
              <c:if test="${classCid != null }">
                  <li><a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}" >全部</a></li>
             </c:if>
              
                          <%--  <li class="active">
                       			 <a href="${APP_PATH}/classes/findByAllClass?classFid=${childrenClasses.fid}">全部</a>
                   		   </li> --%>
                   		   <c:choose>
                   		   	<c:when test="${!empty childrenClasses  }">
                   		   	<c:forEach items="${childrenClasses }" var="item"> 
	                           <c:if test="${classCid eq item.id}">
	                           <li class="active">
	                            
	                              <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}">${item.classname}</a>
	                           </li>
	                           </c:if>
	                           <c:if test="${classCid != item.id}">
	                           	<li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}">${item.classname}</a>
	                           </li>
	                           </c:if>
                            </c:forEach>
                   		   	</c:when>
                   		   	<c:otherwise>
                           	<c:forEach items="${allClass }" var="item"> 
                           	<c:choose>
                           		<c:when test="${item.fid!=0 }">
	                           <li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}">${item.classname}</a>
	                           </li>
	                           </c:when>
	                           </c:choose>
                            </c:forEach>
                           	</c:otherwise>
                            </c:choose>
                             <!-- 
                               <li class="">
                                <a href="javascript:void(0)">微服务/SOA</a>
                            </li>-->
              </ul>
        </div>
    </div>
    
    
    <div class="row" style="min-height: 250px;background-color: whitesmoke;min-height: 80px;padding-top: 15px; padding-bottom: 10px">
        <div class="col-sm-12 col-md-1">
                <span style="width: 52px;
                display: block;
                line-height: 30px;
                font-weight: 700;
                font-size: 14px;
                color: #07111b;
                text-align: right;">类型：</span>
        </div>
        <div class="col-sm-12 col-md-11">
            <ul class="nav nav-pills" >
            
             <c:if test="${baseid == null }">
                        <li class="active" ><a href="${APP_PATH}/classes/findByAllClass" >全部</a></li>
              </c:if>
                        
            <c:if test="${baseid != null }">
                        <li><a href="${APP_PATH}/classes/findByAllClass" >全部</a></li>
             </c:if>
             		<c:choose>
             		
             			<c:when test="${!empty classFid && empty classCid }">
             				<c:if test="${baseid eq null }">
             				<li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=0">基础</a>
                            </li>
              				 <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=1">进阶</a>
                            </li>
                              <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=2">实战</a>
                            </li>
                            </c:if>
             				<c:if test="${baseid eq 0 }">
             				<li class="active">
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=0">基础</a>
                            </li>
              				 <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=1">进阶</a>
                            </li>
                              <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=2">实战</a>
                            </li>
                            </c:if>
                            
                            <c:if test="${baseid eq 1 }">
             				<li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=0">基础</a>
                            </li>
              				 <li class="active">
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=1">进阶</a>
                            </li>
                              <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=2">实战</a>
                            </li>
                            </c:if>
                            <c:if test="${baseid eq 2 }">
             				<li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=0">基础</a>
                            </li>
              				 <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=1">进阶</a>
                            </li>
                              <li class="active">
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${classFid}&baseid=2">实战</a>
                            </li>
                            </c:if>
             			</c:when>
             		
             			<c:when test="${!empty childrenClasses }">
             				<c:forEach items="${childrenClasses}" var="item">
             			 	<c:if test="${classCid eq item.id}">
             			 	<c:if test="${baseid eq null }">
             				<li>
                               <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=0">基础</a>
                            </li>
              				<li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=1">进阶</a>
                            </li>
                            <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=2">实战</a>
                            </li>
                            </c:if>
             				<c:if test="${baseid eq 0 }">
             				<li  class="active">
                               <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=0">基础</a>
                            </li>
              				<li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=1">进阶</a>
                            </li>
                            <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=2">实战</a>
                            </li>
                            </c:if>
                            
                            <c:if test="${baseid eq 1 }">
             				<li>
                               <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=0">基础</a>
                            </li>
              				<li  class="active">
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=1">进阶</a>
                            </li>
                            <li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=2">实战</a>
                            </li>
                            </c:if>
                            <c:if test="${baseid eq 2 }">
             				<li>
                               <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=0">基础</a>
                            </li>
              				<li>
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=1">进阶</a>
                            </li>
                            <li  class="active">
                                <a href="${APP_PATH}/classes/findByAllClass?classFid=${item.fid}&classCid=${item.id}&baseid=2">实战</a>
                            </li>
                            </c:if>
             			 	
                            </c:if>
             				</c:forEach>
             			</c:when>

             			<c:otherwise>
             			
							          				
             				<c:if test="${baseid ==null }">
                         		<li>
                         			<a href="${APP_PATH}/classes/findByAllClass?baseid=0">基础</a>
                         		</li>
	                            <li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=1">进阶</a>
	                           </li>
	                            <li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=2">实战</a>
	                           </li>
	                         </c:if>
             				
             				<c:if test="${baseid ==0 }">
                         		<li class="active">
                         			<a href="${APP_PATH}/classes/findByAllClass?baseid=0">基础</a>
                         		</li>
	                            <li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=1">进阶</a>
	                           </li>
	                            <li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=2">实战</a>
	                           </li>
	                         </c:if>
	                         <c:if test="${baseid ==1 }">
                         		<li>
                         			<a href="${APP_PATH}/classes/findByAllClass?baseid=0">基础</a>
                         		</li>
	                            <li class="active"> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=1">进阶</a>
	                           </li>
	                            <li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=2">实战</a>
	                           </li>
	                         </c:if>
	                         <c:if test="${baseid ==2 }">
                         		<li>
                         			<a href="${APP_PATH}/classes/findByAllClass?baseid=0">基础</a>
                         		</li>
	                            <li> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=1">进阶</a>
	                           </li>
	                            <li  class="active"> 
	                              <a href="${APP_PATH}/classes/findByAllClass?baseid=2">实战</a>
	                           </li>
	                         </c:if>
                        
                        </c:otherwise>
             		</c:choose>
             	 			
                           <!--  <li>
                                <a href="javascript:void(0)">框架</a>
                            </li> -->
                   </ul>
        </div>
    </div>
</div>

<div class="row " id="videoClass" align="center">
		<c:choose>
			<c:when test="${!empty list }">
				<c:forEach items="${list }" var="item">
					<!--链接开始-->	<!-- play/player?id=${item.id} -->
					<a href="play/player?id=${item.id}" class="thumbnail col-md-6" style="width:220px;height:150px; border-radius: 8px;margin:50px auto auto 40px;">
						<div class="panel panel-default" style="margin:auto; height:147px; "  >
						    <div class="panel-heading" style="height:50px;background-color: #FFDCB9" align="center">
							<h3 class="panel-title">
							    ${item.coursename}
							</h3>
						    </div>
						    <div class="panel-body" style="margin: auto;">
								<p>${item.describe}</p>
								<div  style="margin:30px auto  auto 45px">
								<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
								</div>
						    </div>
						</div>
					</a><!--链接结束-->
				</c:forEach>
			</c:when>
		
			<c:when test="${!empty videoClass  }">
				<c:forEach items="${videoClass }" var="item">
					<!--链接开始-->	<!-- play/player?id=${item.id} -->
					<a href="play/player?id=${item.id}" class="thumbnail col-md-6" style="width:220px;height:150px; border-radius: 8px;margin:50px auto auto 40px;">
						<div class="panel panel-default" style="margin:auto; height:147px; "  >
						    <div class="panel-heading" style="height:50px;background-color: #FFDCB9" align="center">
							<h3 class="panel-title">
							    ${item.coursename}
							</h3>
						    </div>
						    <div class="panel-body" style="margin: auto;">
								<p>${item.describe}</p>
								<div  style="margin:30px auto  auto 45px">
								<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
								</div>
						    </div>
						</div>
					</a><!--链接结束-->
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach items="${allVideo}" var="item"> 
					<!--链接开始-->	<!-- play/player?id=${item.id} -->
					<a href="play/player?id=${item.id}" class="thumbnail col-md-6" style="width:220px;height:150px; border-radius: 8px;margin:50px auto auto 40px;">
						<div class="panel panel-default" style="margin:auto; height:147px; "  >
						    <div class="panel-heading" style="height:50px;background-color: #FFDCB9" align="center">
							<h3 class="panel-title">
							    ${item.coursename}
							</h3>
						    </div>
						    <div class="panel-body" style="margin: auto;">
								<p>${item.describe}</p>
								<div  style="margin:30px auto  auto 45px">
								<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
								</div>
						    </div>
						</div>
					</a><!--链接结束-->			
			 </c:forEach> 
			
			</c:otherwise> 
		</c:choose>
		
</div>


	
	<script type="text/javascript">
	
	 $("li").on('click',function() {
	    $(this).addClass('active').siblings().removeClass('active');
	}) 

	  /* function classId(result){
			alert(result);
			var html="";
			$.ajax({
				async: true,
				url:"${APP_PATH }/video/getByCidVideo",
				type:"GET",
				success:function(result){
					console.log(result);
					$("#videoClass").empty();
					var aTd="";
					$.each(result.extend.videoClass,function(index,item){
						alert(item.coursename);
						aTd +=`<a href="play/player?id=item.id" class="thumbnail col-md-4" style="width:220px;height:150px; border-radius: 8px;margin:10px auto auto 17px;">
						<div class="panel panel-default" style="margin:auto; height:147px; "  >
					    <div class="panel-heading" style="height:50px;background-color: #FFDCB9" align="center">
						<h3 class="panel-title">
						    'item.coursename'
						</h3>
					    </div>
					    <div class="panel-body" style="margin: auto;">
							<p>"+${item.describe}+"</p>
							<div  style="margin:30px auto  auto 45px">
							<fmt:formatDate value= "${item.uploadtime }" pattern="yyyy年MM月dd日 hh:mm:ss"/>
							</div>
					    </div>
					</div>
				</a>`;
					
					});
					$("#videoClass").html(aTd);
				}
			});
		}  */
 
 </script>
 <c:import url="../common/recepfoot.jsp"></c:import>
</body>
</html>