<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'products.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
		*{
			margin:0px;
			padding:0px;
		}
		li{
			list-style:none;
		}
		#product img{
			width:200px;
			height:200px;
		}
		#product li{
			float:left;
			width:200px;
			height:260px;
			border:1px solid #ddd;
		}
		#product{
			width:840px;
			margin:20px auto;
		}
	</style>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script>
		$().ready(function(){
			$("#search").click(function(){
				$.ajax({
					url:"product/search",
					type:"post",
					data:{
						text:$("#searchText").val(),
					},
					resultType:"json",
					success:function(data){
						var str="";
						$.each(data,function(index,element){
							str+="<li><div>"+
							"<img src='img/"+element.pics[0].name+"'/>"+
							"</div>"+
							"<div>"+element.name+"</div>"+
							"<div>"+element.price+"</div>"+
				    		"</li>"
						})
						$("#product").html(str);
					}
				})
			})
		})
	</script>
  </head>
  <body>
  	<input id="searchText" type="text">
  	<input id="search" type="button" value="搜索">
  	<ul id="product">
    	<c:forEach items="${products}" var="p">
    	<li>
    		<div>
    			<a href="product/detail?id=${p.id}"><img src="img/${p.pics[0].name}"/></a>
    		</div>
    		<div>${p.name}</div>
    		<div>${p.price}</div>
    	</li>
    	</c:forEach>
    	</ul>
  </body>
</html>
