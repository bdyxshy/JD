<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			var num=$("#num").val();
			$("#jian").click(function(){
				if(num>1){
					num--;
				}
				$("#num").val(num);
			})
			$("#jia").click(function(){
				if(num<100){
					num++;
				}
				$("#num").val(num);
			})
			$("#num").keyup(function(){
				setTimeout(setNum,1000);
			})
			$("#addCart").click(function(){
				$.ajax({
					url:"cart/add",
					type : "post",
					data:{
						"product.id":"${product.id}",
						num:$("#num").val()
					},
					dataType:"text",
					success:function(data){
						if(data=="true"){
							$("#mes").html("添加成功!")
						}else{
							$("#mes").html("添加失败!")
						}
					}
				})
			})
			function setNum(){
				
				if($("#num").val()<1){
					$("#num").val(1);
				}else if($("#num").val()>100){
					$("#num").val(99);
				}else if($("#num").val()>1 && $("#num").val()<100){
					$("#num").val($("#num").val().replace(/\D/g,''));
				}else{
					$("#num").val(1);
				}
			}
		})
	</script>
  </head>
  
  <body>
   <c:forEach items="${product.pics }" var="pic">
   		<img src="img/${pic.name}"/>
   </c:forEach>
   <br/>${product.name}
   <br/>${product.price}
   <br/>${product.author}
   <br/>${product.smallClass.name}
   <br/>${product.smallClass.bigClass.name}
   <br/>${product.publish.name}
   <br/>
   <input type="button" value="-" id="jian">
   <input type="text" value="1" id="num">
   <input type="button" value="+" id="jia">
   <input type="button" value="加入购物车" id="addCart">
   <div id="mes"></div>
   <a href="cart/show">查看购物车</a>
  </body>
</html>
