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
	<title>购物车页</title>
	<link href="css/style.css" rel="stylesheet"/>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			//后台如果carts为空，则传来"[0]"
			if(jQuery.isEmptyObject(${test})){
				//如果传来" "则说明carts有数据,隐藏购物车为空。
				$(".cart-empty").css("display","none");
			}else{
				//如果传来"[0]"则显示购物车为空,隐藏购物车
				$(".p-box").css("display","none");
			}
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
						totalTd.html(parseFloat(data).toFixed(2));
						setQx();
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
						totalTd.html(parseFloat(data).toFixed(2));
						setQx();
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
						setQx();
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
				var selectNum=0;
				$("[name=select]").each(function(index,element){
					if($(this).prop("checked")==true){
						var index=$(this).data("index");
						var xiaoJi=$("#total"+index).html();
						zongJia+=parseFloat(xiaoJi);
						selectNum=parseInt(selectNum)+1;
					}
				})
				$("#selectNum").html(selectNum);
				$("#zongJia").html(zongJia.toFixed(2));
			}
			$("[name=select]").click(setZongJia);
			$("[name=del]").click(function(){
				var id=$(this).parent().data("id");
				var type=confirm("确定要删除数据吗？");
				if(type){
					$.ajax({
						url:"cart/del",
						type:"post",
						data:{id:id},
						async: false,
						dataType:"text",
						success:function(data){
							
						}
					})
					location.href="cart/show";
				}
			})
			$("[name=toggle-checkboxes]").click(function(){
				var qx = $("[name=toggle-checkboxes]");
				if(qx.prop("checked") == true) {
					$("[name='select']").prop("checked", true);
					setZongJia();
				} else {
					$("[name='select']").prop("checked", false);
					setZongJia();
				}
			})
			$("[name=select]").click(function(){
				setQx();
			})
			function setQx(){
				var qx = $("[name=toggle-checkboxes]");
				var dx = $("[name=select]");
				if($(this).prop("checked")==false){
					qx.prop("checked",false);
				}else{
					var flag=false;
					dx.each(function(){
						if($(this).prop("checked")==false){
							flag=true;
						}
					})
					if(flag){
						qx.prop("checked",false);
					}else{
						qx.prop("checked",true);
					}
				}
			}
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
	<style>
	
		body{
		font: 12px/150% tahoma,arial,Microsoft YaHei,Hiragino Sans GB,"\u5b8b\u4f53",sans-serif;
		}
		.cart-empty {
		    height: 98px;
		    padding: 80px 0 120px;
		    color: #333;
		    width: 990px;
   			margin: 0 auto;
		}
		.cart-empty .message {
		    height: 98px;
		    padding-left: 341px;
		    background: url(image/no-login-icon.png) 250px 22px no-repeat;
		}
		.cart-empty .message ul {
		    padding-top: 23px;
		        list-style: none;
		}
		.cart-empty .message .txt {
		    font-size: 14px;
		}
		.cart-empty .message li {
		    line-height: 26px;
		}
		.mt10 {
		    margin-top: 10px;
		}
		.ftx-05, .ftx05 {
		    color: #005ea7;
		}
	</style>
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
		
		<div id="cart-top">
			<div id="logo">
				<a href="" class="link1"><img src="image/logo.png" alt="京东商城"></a>
				<a href="#none" class="link2"><b></b></a>
		
			</div>
			<div class="cart-search">
				<div class="form">
					<input id="key" type="text" class="itxt" style="color: rgb(153, 153, 153);">
					<input type="button" class="button" value="搜索" ">
				</div>
			</div>
	</div>
		
		
		</div>
		
		
		<!-- 购物车为空 -->
		<div class="cart-empty">
			<div class="message">
				<ul>
					<li class="txt">购物车空空的哦~，去看看心仪的商品吧~</li>
					<li class="mt10">
						<a href="" class="ftx-05">去购物&gt;</a>
					</li>
			</div>	
		</div>
		
		<!-- 购物车商品 -->
		<div class="p-box">
		  <div class="cart">
		    <div class="cart-main">
		      <div class="cart-thead">
		        <div class="column t-checkbox">
		          <div class="cart-checkbox">
		            <input type="checkbox" name="toggle-checkboxes" class="jdcheckbox" >
		          </div>
		          全选 </div>
		        <div class="column t-goods">商品</div>
		        <div class="column t-props"></div>
		        <div class="column t-price">单价(元)</div>
		        <div class="column t-quantity">数量</div>
		        <div class="column t-sum">小计(元)</div>
		        <div class="column t-action">操作</div>
		      </div>
		      <div id="cart-list">
		        <div class="cart-item-list" id="cart-item-list-01">
		          <div class="cart-tbody" id="vender_8888">
		            <div class="shop">
		              <div class="item-list"> 
		                <!-- 单品-->
		                <c:forEach items="${carts}" var="cart" varStatus="status">
		                <div class="item-single  item-item ">
		                  <div class="item-form">
		                    <div class="cell p-checkbox">
		                      <div class="cart-checkbox"> 
		                        <!--单品-->
		                        <input  type="checkbox" name="select" data-index="${status.index}" id="select${status.index}"  data-id="${cart.id}">
		                        <span class="line-circle"></span> </div>
		                    </div>
		                    <div class="cell p-goods">
		                      <div class="goods-item">
		                        <div class="p-img"> <a href="#" target="_blank" class="J_zyyhq_11892161"><img alt="${cart.product.name}" src="img/${cart.product.pics[0].name}"></a> </div>
		                        <div class="item-msg">
		                          <div class="p-name"> <a  href="#" target="_blank">${cart.product.name}</a> </div>
		                          <div class="p-extend"> <span class="promise" > </span> <span class="promise" > </span> </div>
		                        </div>
		                      </div>
		                    </div>
		                    <div class="cell p-props p-props-new"> </div>
		                    <div class="cell p-price"> <strong><fmt:formatNumber value="${cart.product.price}" pattern="#,#00.00"/></strong> </div>
		                    <div class="cell p-quantity"> 
		                      <!--单品-->
		                      <div class="quantity-form" data-id="${cart.id}"> 
		                      	<a href="javascript:void(0);"  class="decrement disabled" name="jian" data-index="${status.index}">-</a>
		                        <input id="num${status.index}" name="num"  type="text" class="itxt" value="${cart.num}" data-index="${status.index}" style="width:46px;height:22px;" >
		                        <a href="javascript:void(0);"  class="increment" name="jia" data-index="${status.index}">+</a> 
		                       </div>
		                   	 </div>
		                    <div class="cell p-sum"> <strong id="total${status.index}"><fmt:formatNumber value="${cart.total}" pattern="#,#00.00"/></strong> </div>
			                    <div class="cell p-ops" data-id="${cart.id}"> 
			                      <!--单品--> 
			                      <a class="cart-remove" name="del" href="javascript:void(0);">删除</a> 
			                    </div>
		                 	 </div>
		      
		                </div>
		                </c:forEach>
		              </div>
		            </div>
		          </div>
		          <!--结算-->
		          <div class="options-box">
						<div class="toolbar-right">
							<div class="normal">
								<div class="comm-right">
									<div class="btn-area">
										<a id="addOrder" style="cursor:pointer;"  class="submit-btn" >去结算<b></b></a>
									</div>
									<div class="price-sum">
										<div>
											<span class="txt txt-new">总价：</span>
											<span class="price sumPrice"><em>￥</em><em id="zongJia">0.00</em></span>
											
								
									
											</div>
											<br>
											<span class="txt">已节省：</span>
											<span class="price totalRePrice">-￥0.00</span>
										</div>
									</div>
									<div class="amount-sum">
										已选择<em  id="selectNum">0</em>件商品<b class="up" clstag="clickcart|keycount|xincart|cart_thumbnailOpen"></b>
									</div>
									<div class="clr"></div>
								</div>
							</div>
						</div>
						
					</div>
		        </div>
		      </div>
		      
		      <!--分页-->
		      <!--  
		      <div class="page" style="margin-left:200px;">
		        <div id="J_bottomPage" class="p-wrap"><span class="p-num"><a class="pn-prev disabled"><i>&lt;</i><em>上一页</em></a><a href="javascript:;" class="curr">1</a><a onclick="SEARCH.page(3, true)" href="javascript:;">2</a><a onclick="SEARCH.page(5, true)" href="javascript:;">3</a><a onclick="SEARCH.page(7, true)" href="javascript:;">4</a><a onclick="SEARCH.page(9, true)" href="javascript:;">5</a><a onclick="SEARCH.page(11, true)" href="javascript:;">6</a><a onclick="SEARCH.page(13, true)" href="javascript:;">7</a><b class="pn-break">...</b><a class="pn-next" onclick="SEARCH.page(3, true)" href="javascript:;" title="使用方向键右键也可翻到下一页哦！"><em>下一页</em><i>&gt;</i></a></span><span class="p-skip"><em>共<b>83</b>页&nbsp;&nbsp;到第</em>
		          <input class="input-txt" type="text" value="1" onkeydown="javascript:if(event.keyCode==13){SEARCH.page_jump(83,1);return false;}">
		          <em>页</em><a class="btn btn-default" onclick="SEARCH.page_jump(83,1)" href="javascript:;">确定</a></span></div>
		      </div>
		      -->
		    </div>
		  </div>
		  
		  <!--底部开始-->
		  <div id="bottom">
		    <div class="slogen"> </div>
		    <div id="GLOBAL_FOOTER">
		      <div id="footer">
		        <div class="links"> <a rel="nofollow" target="_blank" href="//www.jd.com/intro/about.aspx">关于我们</a>|<a rel="nofollow" target="_blank" href="//www.jd.com/contact/">联系我们</a>|<a rel="nofollow" target="_blank" href="//www.jd.com/contact/joinin.aspx">商家入驻</a>|<a rel="nofollow" target="_blank" href="//jzt.jd.com">营销中心</a>|<a rel="nofollow" target="_blank" href="//app.jd.com/">手机京东</a>|<a target="_blank" href="//club.jd.com/links.aspx">友情链接</a>|<a target="_blank" href="//media.jd.com/">销售联盟</a>|<a href="//club.jd.com/" target="_blank">京东社区</a>|<a href="//gongyi.jd.com" target="_blank">京东公益</a>|<a href="//en.jd.com/" target="_blank">English Site</a>|<a href="//en.jd.com/help/question-58.html" target="_blank">Contact Us</a> </div>
		        <div class="copyright"> 北京市公安局朝阳分局备案编号110105014669&nbsp;&nbsp;|&nbsp;&nbsp;京ICP证070359号&nbsp;&nbsp;|&nbsp;&nbsp;<a target="_blank" href="//img14.360buyimg.com/da/jfs/t256/349/769670066/270505/3b03e0bb/53f16c24N7c04d9e9.jpg">互联网药品信息服务资格证编号(京)-经营性-2014-0008</a>&nbsp;&nbsp;|&nbsp;&nbsp;新出发京零&nbsp;字第大120007号<br>
		          <a rel="nofollow" href="//misc.360buyimg.com/skin/df/i/com/f_music.jpg" target="_blank">音像制品经营许可证苏宿批005号</a>&nbsp;&nbsp;|&nbsp;&nbsp;出版物经营许可证编号新出发(苏)批字第N-012号&nbsp;&nbsp;|&nbsp;&nbsp;互联网出版许可证编号新出网证(京)字150号<br>
		          <a href="//misc.360buyimg.com/wz/wlwhjyxkz.jpg" target="_blank">网络文化经营许可证京网文[2014]2148-348号</a>&nbsp;&nbsp;违法和不良信息举报电话：4006561155&nbsp;&nbsp;Copyright&nbsp;©&nbsp;2004-2016&nbsp;&nbsp;京东JD.com&nbsp;版权所有<br>
		          京东旗下网站：<a href="https://www.jdpay.com/" target="_blank">京东钱包</a> </div>
		        <div class="authentication"> <a rel="nofollow" target="_blank" href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202007080200026"> <img width="103" height="32" alt="经营性网站备案中心" src="image/54b8871eNa9a7067e.png"> </a> <a rel="nofollow" target="_blank" href="http://www.bj.cyberpolice.cn/index.do"> <img width="103" height="32" alt="网络警察" src="image/56a89b8fNfbaade9a.jpg"> </a> <a rel="nofollow" target="_blank" href="https://search.szfw.org/cert/l/CX20120111001803001836"> <img width="103" height="32" src="image/54b8875fNad1e0c4c.png"> </a> <a target="_blank" href="http://www.12377.cn"><img width="103" height="32" src="image/5698dc03N23f2e3b8.jpg"></a> <a target="_blank" href="http://www.12377.cn/node_548446.htm"><img width="103" height="32" src="image/5698dc16Nb2ab99df.jpg"></a> </div>
		      </div>
		    </div>
		  </div>
		</div>
		</body>
</html>
