<%@ page language="java" import="java.util.*,entity.*" pageEncoding="utf-8"%>
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
	<title>商品详情页</title>
	<link href="css/style.css" rel="stylesheet"/>
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
				var user = '<%= session.getAttribute("user")%>';
				if(user=="null"){
					window.location.href="login/showLogin";
				}else{
					$.ajax({
						url:"cart/add",
						type : "post",
						data:{
							"product.id":"${product.id}",
							num:$("#num").val()
						},
						dataType:"text",
						success:function(data){
	// 						if(data=="true"){
	// 							$("#mes").html("添加成功!")
	// 						}else{
	// 							$("#mes").html("添加失败!")
	// 						}
							if(data=="true"){
								window.location.href="cart/showAddCart?productId="+${product.id}+"&num="+$("#num").val();
							}
						}
					})
				}
			})
			function setNum(){
				
				if($("#num").val()<1){
					num=1;
					$("#num").val(num);
				}else if($("#num").val()>100){
					num=99;
					$("#num").val(num);
				}else if($("#num").val()>1 && $("#num").val()<100){
					num=$("#num").val().replace(/\D/g,'');
					$("#num").val(num);
				}else{
					num=1;
					$("#num").val(num);
				}
			}
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
		  	 <a href="#" >${product.smallClass.bigClass.name}</a>&nbsp;&gt;&nbsp;
		 	 <a href="#" >${product.smallClass.name}</a>&nbsp;&gt;&nbsp;
		 	 <a href="#">${product.name}</a>
		  </span> 
	  </div>
	</div>
	<!--面包屑导航结束--> 
	<!--商品开始-->
	<div class="p-box">
	  <div id="product-intro"> 
	    <!--商品右边图片开始-->
	    <div id="preview">
	    <%
	     Product p=(Product)request.getAttribute("product");
	     int size=p.getPics().size();
	    %>
	      <div id="spec-n1" class="jqzoom"> <img data-img="1" width="350" height="350" src="img/${product.pics.get(0).getName()}"> </div>
	      <div id="spec-list">
	        <div class="spec-items">
	          <ul class="lh">
	          <li><img src="img/<%=p.getPics().get(0).getName() %>" width="50" height="50" class="img-hover"></li>
	          <%for(int i=1;i<size;i++){
	        	  String str="<li><img src='img/"+p.getPics().get(i).getName()+"' width='50' height='50' class='img-out'></li>";
	        	  out.print(str);
	          } %>
	          </ul>
	        </div>
	      </div>
	      <div id="short-share">
	        <div class="fl"><span>商品编号：</span><span>11999374</span></div>
	        <a id="choose-btn-coll"  href="#"><b></b><em id="">关注商品</em></a> <a id="share-list" class="share-list" href="#none" > <b></b><em>分享</em> </a> </div>
	    </div>
	    <!--右边结束--> 
	    
	    <!--中间部分-->
	    <div id="m-item-inner">
	      <div id="itemInfo">
	        <div id="name">
	          <h1>${product.name} </h1>
	          <div id="p-ad" class="p-ad" >${product.content}</div>
	          <div class="p-author" id="p-author" > <a>${product.author}</a> 著 </div>
	          <div><a>${product.publish.name}</a></div> 
	        </div>
	        <div id="summary">
	          <div class="summary-info ">
	            <div id="comment-count" > <span class="comment">累计评价</span> <a class="count" href="#comment">74392</a> </div>
	          </div>
	          <div id="summary-price">
	            <div class="dt">京 东 价：</div>
	            <div class="dd"> 
	            <strong class="p-price" id="jd-price">￥
	            	<fmt:formatNumber value="${product.price}" pattern="#,#00.00"/>
	            </strong> 
	            
	            <span class="p-discount">[7.6折]</span> <span class="pricing">[定价：<del id="page_maprice">￥39.00</del>]</span> </div>
	          </div>
	          <div id="summary-order">
	            <div class="dt">排　　名：</div>
	            <div class="dd">自营 <a href="#" target="_blank">小说销量榜 </a>第 <font style="color:red;">1</font> 位</div>
	          </div>
	          <div id="summary-stock" >
	            <div id="summary-service" >
	              <div class="dt">服　　务：</div>
	              <div class="dd">由 京东 发货，并提供售后服务。现在至明天16:00前完成下单,预计<b>08月26日(周五)</b>送达</div>
	              <div class="dt">提　　示：</div>
	              <div class="dd">支持7天无理由退货</div>
	            </div>
	          </div>
	          
	          <!--添加到购物车控件-->
	          <div id="choose-btns">
	            <div class="choose-amount fl" >
	              <div class="wrap-input"> 
	              <a class="btn-reduce" style="cursor:pointer;" id="jian">-</a> 
	              <a class="btn-add" style="cursor:pointer;"id="jia">+</a>
	                <input class="text" id="num" value="1" >
	              </div>
	            </div>
	            <div class="btn" id="choose-btn-append" > <a class="btn-append " id="addCart" style="cursor:pointer;" ></a> </div>
	          	<div id="mes" style="clear:left;"></div>
	          </div>
	        </div>
	        <!--添加到购物车控件结束--> 
	        
	      </div>
	    </div>
	  </div>
	</div>
	<!--中间结束--> 
	<!--人气单品-->
	<div class="p-box">
	<div id="fitting-suit">
	  <div class="tab"> 人气单品 </div>
	  <div class="mc">
	
	        <ul class="lh">
	          <li > 
	            <div class="p-img"> <a href="#" target="_blank"> <img width="130" height="130" src="image/rBEhU1Nd33IIAAAAAAFbHX75EAsAAMjgAMdgs0AAVs1993.jpg"> </a> </div>
	            <div class="p-name ac"> <a href="#" title="解忧杂货店" target="_blank">解忧杂货店</a> </div>
	            <div class="p-price ac"> <strong class="J-p-11452840">￥27.30</strong> </div>
	          </li>
	          <li > <s></s>
	            <div class="p-img"> <a href="#" target="_blank"> <img width="130" height="130" src="image/5799ac16N8248bc5f.jpg"> </a> </div>
	            <div class="p-name ac"> <a href="#" title="生活给你的，一定是你能承受的" target="_blank">生活给你的，一定是你能承受的</a> </div>
	            <div class="p-price"> <strong class="J-p-12001058">￥20.20</strong> </div>
	          </li>
	          <li> <s></s>
	            <div class="p-img"> <a href="#" target="_blank"> <img width="130" height="130" src="image/546d9a25N07687a60.jpg"> </a> </div>
	            <div class="p-name ac"> <a href="#" title="皮囊" target="_blank">皮囊</a> </div>
	            <div class="p-price ac"> <strong class="J-p-11582083">￥30.20</strong> </div>
	          </li>
	          <li > <s></s>
	            <div class="p-img"> <a href="//item.jd.com/11999242.html" target="_blank"> <img width="130" height="130" src="image/57a2d9bfNf730d966.jpg"> </a> </div>
	            <div class="p-name ac"> <a href="#" title="爵迹：雾雪零尘" target="_blank">爵迹：雾雪零尘</a> </div>
	            <div class="p-price ac"> <strong class="J-p-11999242">￥24.00</strong> </div>
	          </li>
	          <li> <s></s>
	            <div class="p-img"> <a href="#" target="_blank"> <img width="130" height="130" src="image/573d821aN9de83d79.jpg"> </a> </div>
	            <div class="p-name ac"> <a href="#" title="自在独行：贾平凹的独行世界" target="_blank">自在独行：贾平凹的独行世界</a> </div>
	            <div class="p-price ac"> <strong class="J-p-11941728">￥27.90</strong> </div>
	          </li>
	          <li> <s></s>
	            <div class="p-img"> <a href="#" target="_blank"> <img width="130" height="130" src="image/5757b871Nab7c813d.jpg"> </a> </div>
	            <div class="p-name ac"> <a href="#" title="巨人的陨落（全3册）【荐书联盟推荐】" target="_blank">巨人的陨落（全3册）【荐书联盟推荐】</a> </div>
	            <div class="p-price ac"> <strong class="J-p-11892161">￥89.60</strong> </div>
	          </li>
	        </ul>
	
	  </div>
	</div>
	<!--人气单品结束-->
	<!--商品介绍-->
	<div id="content">
	
	<div class="item-mt">
	            <h3>内容简介</h3>
	        </div>
	        
	<div class="item-content">
	<p>善良是一种天性，善意是一种选择。
	善意能消戾，善意能得缘，善意能带业往生，善意能回头是岸。
	善意能够帮人捕捉并建立起独特的幸福感。</p>
	<p>好吗好的，是一句自度度人的自问自答，也是一份坦然随缘的善意。</p>
	
	<p>《好吗好的》——百万级销量作家大冰2016年新书。在冷的地方，写就暖心的、真实的、善意的、舍不得读完的江湖故事。</p>
	
	<p>《好吗好的》中的江湖故事，铺满牵引你踏上归程的乡愁、给你盔甲也给你软肋的爱意，有有回头是岸的浪子，有深沉执着的兄弟，有既做事又做梦还做自己的男人和兰之猗猗、幽幽其香、五“毒”俱全的美少女壮士。</p>
	<p>他们的故事是真实生活，他们存在于这个世界上。用能量强大的小宇宙为你冲破刻板冰冷的生活壁垒，让你看到那些你永远无法去体会的生活，见识那些可能你永远都无法结交的人。他们用行动教会你善意对待世界、对待生活、对待他人，同时也善意地对待自己。</p>
	<p>他们走在你的前面，为你指路，为你鼓气，也为你照亮前进的方向。</p>
	
	<p>《好吗好的》这是一本超超超超值的书。</p>
	除了读到暖心、深情，让你咂咂称奇的故事之外，它还可以听。</p>
	<p>《好吗好的》一书中的每篇文章后，都缀有音乐二维码，送给你共计数十首有钱也买不到的原创民谣。</p>
	<p>《好吗好的》还送给你一道北极光！只要你是大冰的读者，就有机会得到一张远洋船票，目的地是——北极！食宿全包！带上《好吗好的》，去地球上冷的地方，读暖的故事，好吗好的！</p>
	</div>
	        
	        
	</div>
	
	<!--商品介绍结束-->
	<!--评论-->
	
	<!--评论结束-->
	
	
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
