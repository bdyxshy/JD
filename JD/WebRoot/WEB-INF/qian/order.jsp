<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单页</title>
    
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
			$("[name=del]").click(function(){
				var type=confirm("确定要删除数据吗？");
				var orderId=$(this).parent().data("id");
				if(type){
					$.ajax({
						url:"order/delOrder",
						type:"post",
						data:{
							"orderId":orderId,
						},
						dataType:"text",
						success:function(data){
							window.location.href="order/showOrder";
						}
					})
				}
			})
		})
	</script>
  </head>
  
  <body>
  	<table>
  		<tr>
  			<td>订单号</td>
  			<td>总价</td>
  		</tr>
   		<c:forEach items="${orderList}" var="order">
   			<tr>
   				<td>${order.number}</td>
   				<td>${order.total}</td>
   				<td data-id="${order.id}">
   					<input type="button" name="del" value="取消订单">
   					<input type="button" name="pay" value="确认支付">
   				<td>
   			</tr>
   		</c:forEach>
   	</table>
  </body>
</html>
