<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cart.jsp' starting page</title>
    
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
			$("[name=jian]").click(function(){
				$("#select"+$(this).data("index")).prop("checked","true");//默认修改数量就选中商品
				var id=$(this).parent().data("id");
				var num=$("#num"+$(this).data("index")).val();
				if(num>1){
					num--;
				}
				$("#num"+$(this).data("index")).val(num);
				var totalTd=$("#total"+$(this).data("index"));
				$.ajax({
					url:"cart/modify",
					type:"post",
					data:{
						id:id,
						num:num
					},
					dataType:"text",
					success:function(data){
						totalTd.html(data);
						setZongJia();
					}
				})
			})
			$("[name=jia]").click(function(){
				$("#select"+$(this).data("index")).prop("checked","true");//默认修改数量就选中商品
				var id=$(this).parent().data("id");
				var num=$("#num"+$(this).data("index")).val();
				if(num<100){
					num++;
				}
				$("#num"+$(this).data("index")).val(num);
				var totalTd=$("#total"+$(this).data("index"));
				$.ajax({
					url:"cart/modify",
					type:"post",
					data:{
						id:id,
						num:num
					},
					dataType:"text",
					success:function(data){
						totalTd.html(data);
						setZongJia();
					}
				})
			})
			$("[name=num]").keyup(function(){
				var id=$(this).parent().data("id");
				var index=$(this).data("index");
				setTimeout(setNum(index),1000);
				var num=$("#num"+index).val();
				var totalTd=$("#total"+index);
				$.ajax({
					url:"cart/modify",
					type:"post",
					data:{
						id:id,
						num:num
					},
					dataType:"text",
					success:function(data){
						totalTd.html(data);
						$("#select"+index).prop("checked","true");//默认修改数量就选中商品
						setZongJia();
					}
				})
			})
			function setNum(index){
				var num=$("#num"+index).val();
				if(num<1){
					$("#num"+index).val(1);
				}else if(num>100){
					$("#num"+index).val(99);
				}else if(num>1 && num<100){
					$("#num"+index).val($("#num"+index).val().replace(/\D/g,''));
				}else{
					$("#num"+index).val(1);
				}
			}
			function setZongJia(){
				var zongJia=0;
				$("[name=select]").each(function(index,element){
					if($(this).prop("checked")==true){
						var index=$(this).data("index");
						var xiaoJi=$("#total"+index).html();
						zongJia+=parseFloat(xiaoJi);
					}
				})
				$("#zongJia").html(zongJia);
			}
			$("[name=select]").click(setZongJia);
			$("#addOrder").click(function(){
				var array=new Array();
				$("[name=select]").each(function(index,element){
					if($(this).prop("checked")==true){
						var id=$(this).data("id");
						var index=$(this).data("index");
						var num=$("#num"+index).val();
						var obj=new Object();
						obj.id=id;
						obj.num=num;
						array.push(obj);
					}
				})
				var list=JSON.stringify(array);
				if(list.length>2){
					$.ajax({
						url:"order/addOrder",
						async:false,
						type:"post",
						data:list,
						contentType:"application/json",
						dataType:"text",
						success:function(data){
						}
					})
					window.location.href="order/showOrder";
				}	
			})
		})
	</script>
  </head>
  
  <body>
  <table>
    <c:forEach items="${carts}" var="cart" varStatus="status">
    	<tr>
    		<td><input type="checkbox" name="select" data-index="${status.index}" id="select${status.index}"  data-id="${cart.id}"></td>
    		<td>${cart.product.name}</td>
    		<td><img src="img/${cart.product.pics[0].name}" width="50px" height="50px"></td>
    		<td>${cart.product.price}</td>
    		<td data-id="${cart.id}">
	    		<input type="button" value="-" name="jian" data-index="${status.index}">
	    		<input id="num${status.index}" type="text" value="${cart.num}" name="num" data-index="${status.index}">
	    		<input type="button" value="+" name="jia" data-index="${status.index}">
	    	</td>
    		<td id="total${status.index}">${cart.total}</td>
    		<td><input type="button" value="删除"></td>
    	</tr>
    </c:forEach>
   </table>
   <div>
   		总价:<span id="zongJia">0</span>
   		<input type="button" id="addOrder" value="提交订单">
   </div>
  </body>
</html>
