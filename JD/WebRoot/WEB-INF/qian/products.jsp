<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
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
	<title>商品列表页</title>
	<link href="css/style.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script>
		$().ready(function(){
			if(typeof console !== 'undefined') {
			    console.log('%c想测网络通不通，不上百度上京东。', 'color: #C81623');
			    }
			$("#search .button").click(function(){
				$.ajax({
					url:"product/search",
					type:"post",
					data:{
						text:$("#searchText").val(),
					},
					dataType:"json",
					success:function(data){
						var str="";
						$.each(data,function(index,element){
							str+="<li class='gl-item'><div class='gl-i-wrap'><div class='p-img'>"+
							"<a target='_blank' href='product/detail?id="+element.id+"' title='"+element.name+"'>"+
							"<img width='200' height='200' src='img/"+element.pics[0].name+"'></a></div>"+
							"<div class='p-price'><strong><em>￥</em><i>"+parseFloat(element.price).toFixed(2)+"</i></strong>"+
							"<div class='p-icons' id='J_pro_11511624'></div></div>"+
							"<div class='p-name'><a target='_blank' href='#' title='"+element.contenct+"'>"+
							"<em>"+element.name+"</em><i class='promo-words'><!--出版社 --></i></a></div>"+
							"<div class='p-commit'><strong>已有<a id='J_comment_11511624' target='_blank' href='#'>2600+</a>个评价</strong></div>"+
							"<div class='p-shopnum'><span class='curr-shop'>京东自营</span></div></div></li>"
						})
						$("#product").html(str);
					}
				})
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
        <li><a href="order/showOrder"> 我的订单 </a></li>
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
  <div id="search">
    <div class="form">
      <input type="text" class="text" id="searchText" >
      <button  class="button">搜索</button>
    </div>
    <div id="hotwords"><strong>热门搜索：</strong> <a href="#" target="_blank" style="color: #ff0303">暑期满减 </a> <a href="#" target="_blank">TED</a> <a href="#" target="_blank">别生气</a> <a href="#" target="_blank">二手时间</a> <a href="#" target="_blank">开学季</a> <a href="#" target="_blank">八万四千问</a> <a href="#" target="_blank">曹文轩</a> <a href="#" target="_blank">200减100</a> </div>
  </div>
  <div id="settleup" class="dorpdown"> <i class="ci-left"></i> <i class="ci-right">&gt;</i>  <a target="_blank" href="cart/show">我的购物车</a> </div>
</div>
<!--logo search 购物车结束--> 
<!--横竖导航-->
<div id="nav">
  <div class="nav-heng">
    <div class="nav-shu"> <a target="_blank" href="#">
      <div class="wenzi">全部商品分类</div>
      <i class="ci-right"><s>◇</s></i></a> </div>
    <ul id="navitems">
      <li class="fore1"  id="nav-home"> <a href="#">首页</a> </li>
      <li class="fore2"  id="nav-fashion"> <a target="_blank" href="#">服装城</a> </li>
      <li class="fore3"  id="nav-beauty"> <a target="_blank" href="#">美妆馆</a> </li>
      <li class="fore4"  id="nav-chaoshi"> <a target="_blank" href="#">京东超市</a> </li>
      <li class="fore5" > <a target="_blank" href="#">生鲜</a> </li>
      <li class="fore6" id="nav-jdww"> <a target="_blank" href="#">全球购</a> </li>
      <li class="fore1"  id="nav-red"> <a target="_blank" href="#">闪购</a> </li>
      <li class="fore2"  id="nav-tuan"> <a target="_blank" href="#">团购</a> </li>
      <li class="fore3" id="nav-auction"> <a target="_blank" href="#">拍卖</a> </li>
      <li class="fore4"  id="nav-jr"> <a target="_blank" href="#">金融</a> </li>
    </ul>
  </div>
</div>
<!--横竖导航结束--> 
<!--面包屑导航-->
<div id="root-nav">
  <div class="breadcrumb"> 
	<strong><a href="#">图书</a></strong>
	<span>&nbsp;&gt;&nbsp;
<!-- 	<a href="#" >中华书局</a> -->
  </div>
</div>
<!--面包屑导航结束--> 
<!--商品列表开始-->
<div class="p-box">
<div id="good-list">
<ul id="product">
<c:forEach items="${products}" var="p">
	<li  class="gl-item">
		<div class="gl-i-wrap">
			<div class="p-img">
				<a target="_blank" href="product/detail?id=${p.id}"   title="${p.content}">
					<img width="200" height="200"  src="img/${p.pics[0].name}">
				</a>
			
			</div>
			<div class="p-price">
				<strong><em>￥</em><i><fmt:formatNumber value="${p.price}" pattern="#,#00.00"/></i></strong>			<div class="p-icons" id="J_pro_11511624"></div>
			</div>
			<div class="p-name">
				<a target="_blank" href="#"  title="${p.content}">
					<em>${p.name}</em>
					<i class="promo-words"  ><!--出版社 --></i>
				</a>
			</div>
		<div class="p-commit"><strong>已有<a id="J_comment_11511624" target="_blank" href="#">2600+</a>个评价</strong></div>
			<div class="p-shopnum"  >
				<span class="curr-shop">京东自营</span>
			</div>
	</li>
	</c:forEach>
</ul>
<!--分页-->
<!-- 
<div class="page clearfix"><div id="J_bottomPage" class="p-wrap"><span class="p-num"><a class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a><a href="javascript:;" class="curr">1</a><a onclick="SEARCH.page(3, true)" href="javascript:;">2</a><a onclick="SEARCH.page(5, true)" href="javascript:;">3</a><a onclick="SEARCH.page(7, true)" href="javascript:;">4</a><a onclick="SEARCH.page(9, true)" href="javascript:;">5</a><a onclick="SEARCH.page(11, true)" href="javascript:;">6</a><a onclick="SEARCH.page(13, true)" href="javascript:;">7</a><b class="pn-break">...</b><a class="pn-next" onclick="SEARCH.page(3, true)" href="javascript:;" title="使用方向键右键也可翻到下一页哦！"><em>下一页</em><i>&gt;</i></a></span><span class="p-skip"><em>共<b>83</b>页&nbsp;&nbsp;到第</em><input class="input-txt" type="text" value="1" onkeydown="javascript:if(event.keyCode==13){SEARCH.page_jump(83,1);return false;}"><em>页</em><a class="btn btn-default" onclick="SEARCH.page_jump(83,1)" href="javascript:;">确定</a></span></div></div>
 -->
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
