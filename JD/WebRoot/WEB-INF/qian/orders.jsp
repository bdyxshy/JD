<%@ page language="java" import="java.util.*,entity.*,java.text.DecimalFormat" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>订单页</title>
	<link href="css/style.css" rel="stylesheet"/>
	<link href="css/orders.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script>
		$().ready(function(){
			if(typeof console !== 'undefined') {
			    console.log('%c想测网络通不通，不上百度上京东。', 'color: #C81623');
			}
			$(".order-del").click(function(){
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
<!--顶部灰色导航-->
<div id="shortcut">
  <div class="w">
    <div class="fl">
      <div class="tripleWenzi"> 送至：<span >山东</span></div>
      <i class="ci-right"><s>◇</s></i> </div>
    <div class="fr">
      <ul>
        <%User user= (User)session.getAttribute("user");%>
		<%if(user==null){
			out.print("<li><a href='login/showLogin'>您好，请登录</a></li><li><a href='login/showRegister' class='red'> 免费注册</a></li>");
		}else{
			out.print("<li>您好，"+user.getName()+"</li>");
		} %>
        <li class="spacer"></li>
        <li> 我的订单 </li>
        <li class="spacer"></li>
        <li class="HasTriple">
          <div class="tripleWenzi">我的京东</div>
          <i class="ci-right"><s>◇</s></i> </li>
        <li class="spacer"></li>
        <li> 京东会员 </li>
        <li class="spacer"></li>
        <li> 企业采购 </li>
        <li class="spacer"></li>
        <li id="mobile" class="HasTriple"> <i class="ci-left"></i>
          <div class="tripleWenzi"> 手机京东</div>
          <i class="ci-right"><s>◇</s></i></li>
        <li class="spacer"></li>
        <li class="HasTriple">
          <div class="tripleWenzi"> 关注京东</div>
          <i class="ci-right"><s>◇</s></i></li>
        <li class="spacer"></li>
        <li class="HasTriple">
          <div class="tripleWenzi"> 客服服务</div>
          <i class="ci-right"><s>◇</s></i></li>
        <li class="spacer"></li>
        <li class="HasTriple">
          <div class="tripleWenzi">网站导航 </div>
          <i class="ci-right"><s>◇</s></i></li>
      </ul>
    </div>
  </div>
</div>
<!--顶部灰色导航结束--> 
<!--logo search 购物车-->
<div id="logoTop">
  <div id="logo"> <a href="" class="logo">京东</a> </div>
  <div id="settleup" class="dorpdown"> <i class="ci-left"></i> <i class="ci-right">&gt;</i> <!-- <i class="ci-count" id="shopping-amount">0</i> --> <a target="_blank" href="cart/show">我的购物车</a> </div>
</div>
<!--logo search 购物车结束--> 
<!-- 内容 -->
<div id="container">
	<div id="main">
		<div id="biaoti">我的订单</div>
		<div id="table">
			<table>
				<thead>
					<tr>
						<th>订单详情</th>
						<th>收货人</th>
						<th>金额</th>
						<th>订单状态</th>
						<th>操作</th>
					</tr>
				</thead>
		  <%List<Object> osList=(List<Object>)request.getAttribute("osList"); %>
		  <%for(int i=0;i<osList.size();i++){
			  List<Order>list=( List<Order>)osList.get(i);
			  int size= list.size();
			  double total=0;
			  for(int z=0;z<size;z++){
				total=total+list.get(z).getTotal();
			  }
		  %>
				<tbody>
					<tr class="sep-row"><td colspan="5"></td></tr>
					<tr class="orderNumTr">
						<td colspan="5">
							<span class="orderNum">订单号：<a name="orderIdLinks"><%out.print(list.get(0).getNumber()); %></a></span>
							<div class="tr-operate" data-id="<%out.print(list.get(0).getId()); %>">
								<a class="order-del" title="删除"></a>
							</div>
							<div style="clear:both;"></div>
						</td>
					</tr>
					<tr>
						<td class="xiangqing">
							<div class="product">
								<div class="p-img">
									<a href="">
										<img width="60" height="60" alt="" src="img/<%out.print(list.get(0).getProduct().getPics().get(0).getName()); %>">
									</a>
								</div>
								<div class="p-msg">
									<a><%out.print(list.get(0).getProduct().getName()); %></a>
								</div>
							</div>
							<div class="number">x<%out.print(list.get(0).getNum()); %></div>
							<div class="repair">
								<a>申请售后</a>
							</div>
						</td>
						<td rowspan="<%out.print(size); %>">
							<div class="userName">
								<span><%out.print(user.getName()); %></span>
							</div>
						</td>
						<td rowspan="<%out.print(size); %>">
							<div class="total">
							<%DecimalFormat    df   = new DecimalFormat("######0.00"); %>
								<span>￥<%out.print(df.format(total)); %></span>
							</div>
						</td>
						<td rowspan="<%out.print(size); %>">
							<div class="state">
								<span>已完成</span>
							</div>
						</td>
						<td rowspan="<%out.print(size); %>">
							<div class="buy">
								<span>立即购买</span>
							</div>
						</td>
					</tr>
					<%for(int j=1;j<size;j++){%>
					<tr>
						<td class="xiangqing">
							<div class="product">
								<div class="p-img">
									<a href="">
										<img width="60" height="60" alt="" src="img/<%out.print(list.get(j).getProduct().getPics().get(0).getName()); %>">
									</a>
								</div>
								<div class="p-msg">
									<a><%out.print(list.get(j).getProduct().getName()); %></a>
								</div>
							</div>
							<div class="number">x<%out.print(list.get(j).getNum()); %></div>
							<div class="repair">
								<a>申请售后</a>
							</div>
						</td>
					</tr>
					<%} %>
				</tbody>
				<%} %>
			</table>
		</div>
	</div>
</div>


<!--底部开始-->
<div id="bottom">
	<div class="slogen">
		
	</div>
<div id="GLOBAL_FOOTER">        


	<div id="footer">
		<div class="links">
			<a rel="nofollow" target="_blank" href="//www.jd.com/intro/about.aspx">关于我们</a>|<a rel="nofollow" target="_blank" href="//www.jd.com/contact/">联系我们</a>|<a rel="nofollow" target="_blank" href="//www.jd.com/contact/joinin.aspx">商家入驻</a>|<a rel="nofollow" target="_blank" href="//jzt.jd.com">营销中心</a>|<a rel="nofollow" target="_blank" href="//app.jd.com/">手机京东</a>|<a target="_blank" href="//club.jd.com/links.aspx">友情链接</a>|<a target="_blank" href="//media.jd.com/">销售联盟</a>|<a href="//club.jd.com/" target="_blank">京东社区</a>|<a href="//gongyi.jd.com" target="_blank">京东公益</a>|<a href="//en.jd.com/" target="_blank">English Site</a>|<a href="//en.jd.com/help/question-58.html" target="_blank">Contact Us</a>
		</div>
		<div class="copyright">
			北京市公安局朝阳分局备案编号110105014669&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证070359号&nbsp;&nbsp;|&nbsp;&nbsp;<a target="_blank" href="//img14.360buyimg.com/da/jfs/t256/349/769670066/270505/3b03e0bb/53f16c24N7c04d9e9.jpg">互联网药品信息服务资格证编号(京)-经营性-2014-0008</a>&nbsp;&nbsp;|&nbsp;&nbsp;新出发京零&nbsp;字第大120007号<br><a rel="nofollow" href="//misc.360buyimg.com/skin/df/i/com/f_music.jpg" target="_blank">音像制品经营许可证苏宿批005号</a>&nbsp;&nbsp;|&nbsp;&nbsp;出版物经营许可证编号新出发(苏)批字第N-012号&nbsp;&nbsp;|&nbsp;&nbsp;互联网出版许可证编号新出网证(京)字150号<br><a href="//misc.360buyimg.com/wz/wlwhjyxkz.jpg" target="_blank">网络文化经营许可证京网文[2014]2148-348号</a>&nbsp;&nbsp;违法和不良信息举报电话：4006561155&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2004-2016&nbsp;&nbsp;京东JD.com&nbsp;版权所有<br>京东旗下网站：<a href="https://www.jdpay.com/" target="_blank">京东钱包</a>
  		</div>
        <div class="authentication">
			<a rel="nofollow" target="_blank" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202007080200026">
				<img width="103" height="32" alt="经营性网站备案中心" src="image/54b8871eNa9a7067e.png">
			</a>
			
		
			<a rel="nofollow" target="_blank" href="http://www.bj.cyberpolice.cn/index.do">
				<img width="103" height="32" alt="网络警察" src="image/56a89b8fNfbaade9a.jpg">
			</a>
			<a rel="nofollow" target="_blank" href="https://search.szfw.org/cert/l/CX20120111001803001836">
				<img width="103" height="32" src="image/54b8875fNad1e0c4c.png">
			</a>
			<a target="_blank" href="http://www.12377.cn"><img width="103" height="32" src="image/5698dc03N23f2e3b8.jpg"></a>
			<a target="_blank" href="http://www.12377.cn/node_548446.htm"><img width="103" height="32" src="image/5698dc16Nb2ab99df.jpg"></a>
		</div>
    </div>
</div></div>

</div>
</body>
</html>
