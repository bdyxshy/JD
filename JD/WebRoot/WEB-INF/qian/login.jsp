<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>京东-欢迎登陆</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			$("#code").click(function(){
				$("#code").prop("src","login/randomImage?rnd=" + Math.random());
				$("#validate").removeClass();
			})
			$("#logincode").blur(function(){
				$.ajax({
					url:"login/validate",
					type:"post",
					data:{"code":$("#logincode").val()},
					dataType:"text",
					success:function(data){
						if(data=="success"){
							$("#validate").addClass("i-status");
							$(".item-fore4").html("");
						}else{
							$("#validate").removeClass();
							$(".item-fore4").html("您输入的验证码有误!");
						}
					}
				})
			})
			$("#loginsubmit").click(function(){
				var loginname=$("#loginname").val();
				var loginpwd=$("#loginpwd").val();
				var logincode=$("#logincode").val();
				//用户名密码验证码都不为空并且不提示验证码错误的情况下用AJAX post方式提交url
				if(loginname!=""&&loginpwd!=""&&logincode!=""&&$("#validate").attr("class")=="i-status"){
					$.ajax({
						url:"login/login",
						type:"post",
						data:{
							loginname:loginname,
							loginpwd:loginpwd,
							logincode:logincode
						},
						dataType:"text",
						success:function(data){
							if(data=="success"){
								$("body").html("<div style='width:200px; margin:200 auto;'><a href=''>登录成功！点击进入首页》》</a></div>");
							}else{
								$("body").html("<div style='width:200px; margin:200 auto;'><a href='login/showLogin'>登录失败！点击重新登录》》</a></div>");
							}
						}
					})
				}
			})
		})
	</script>
	<style>
		*{
			margin:0;
			padding:0;
		}
		body {
		    font-family: "Microsoft YaHei","Hiragino Sans GB";
		    font-size:14px;
		}
		a {
		    color: #666;
		    text-decoration: none;
		}
		i{
			font-style: normal;
		}
		.cl{
			clear:both;
		}
		button{
			cursor:pointer;
		}
		img{
			cursor:pointer;
		}
		.header{
			height:110px;
		}
		.w{
			width: 990px;
			margin:0 auto;
		}
		.header .logo {
		    width: 160px;
		    height: 50px;
		    float: left;
		    margin-top: 24px;
		    background:url(image/icon.png) no-repeat;
		}
		.header .logo-title {
		    float: left;
		    height: 34px;
		    line-height: 34px;
		    font-size: 24px;
		    color: #333;
		    padding-left: 20px;
		    margin-top: 34px;
		}
		.header .have-account {
		    font-size: 16px;
		    float: right;
		    margin-top: 55px;
		    color: #999;
		}
		.header .have-account a {
		    color: #333;
		}
		.main {
		    margin: 50px auto 60px;
		    width: 830px;
		}
		#content .login-wrap {
		    margin-top: 0;
		}
		.login-wrap {
		    position: relative;
		    height: 475px;
		    margin: 10px 0 20px;
		    z-index: 5;
		}
		.login-wrap .login-banner {
		    position: absolute;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 475px;
		    background: #e93854;
		}
		.login-wrap .i-inner {
		    position: relative;
		    z-index: 3;
		    height: 475px;
		}
		.login-form{
			float: right;
    		top: 10px;
    		position: relative;
		    z-index: 4;
		    background: #fff;
		    overflow: visible;
		    width: 346px;
		    height:400px;
		}
		.login-form .login-tab {
		    height: 54px;
		    width:346px;
		    font-size: 18px;
		    font-family: "microsoft yahei";
		    text-align: center;
		    border-bottom: 1px solid #f4f4f4;
		    background: #fff;
		    display: block;
		}
		.login-form .login-tab a {
		    width: 99%;
		    height: 18px;
		    position: absolute;
		    left: 0;
		    top: 18px;
		    border-right: 1px solid #f4f4f4;
		    text-decoration: none;
		    font-weight: 700;
   			color: #e4393c;
		}
		.login-form .item-fore1 {
		    z-index: 6;
		}
		.login-form .item-fore1, .login-form .item-fore2 {
		    border: 1px solid #bdbdbd;
		    height: 38px;
		    width: 304px;
		    margin: 0 auto;
		}
		.login-form .item {
		    position: relative;
		    margin-top: 20px;
		 }
		 .login-form .item .name-label {
		    background-position: 0 0;
		}
		 .login-form .item .login-label {
		    position: absolute;
		    z-index: 3;
		    top: 0;
		    left: 0;
		    width: 38px;
		    height: 38px;
		    border-right: 1px solid #bdbdbd;
		    background: url(image/pwd-icons-new.png) no-repeat;
		    float: none;
		    font-size:12px;
		}
		.login-form label {
		    float: none;
		}
		.login-form .itxt {
		    height: 38px;
		    line-height: 38px;
		    border: 0;
		    padding: 10px 0 10px 50px;
		    width: 304px;
		    float: none;
		    overflow: hidden;
		    font-size: 14px;
		    font-family: '\5b8b\4f53';
		}
		.login-form .item .pwd-label {
		    background-position: -48px 0;
		}
		.form input[type=password] {
		    font-family: Tahoma,Helvetica,Arial;
		}
		.login-form .item-fore5 {
		    margin-bottom: 10px;
		    margin-top:20px;
		}
		.login-form  .login-btn {
		    border: 1px solid #cb2a2d;
		    margin: 0 auto;
		    height: 32px;
		    width: 304px;
		    position: relative;
		}
		.login-form .login-btn .btn-img {
		    border: 1px solid #e85356;
		    display: block;
		    width: 302px;
		    background: #e4393c;
		    height: 31px;
		    line-height: 31px;
		    color: #fff;
		    font-size: 20px;
		    font-family: 'Microsoft YaHei';
		}
		.btn-img, .button {
		    margin: 0;
		    padding: 0;
		    text-align: center;
		    cursor: pointer;
		}
		#logincode{
			padding: 0;
		    width: 220px;
		    padding: 10px;
		    height: 38px;
		    float:left;
		}
		.login-form .item-fore3{
			border: 1px solid #bdbdbd;
		    height: 38px;
		    width: 304px;
		    margin: 20px auto 0px;
		}
		.login-form .item-fore3 .i-status {
		float:left;
		    display: inline-block;
		    position: absolute;
		    width: 16px;
		    height: 16px;
		    top: 10px;
		    right:90px;
		    background-image: url(image/icon.png);
		    background-repeat: no-repeat;
		    background-position: 0 -117px;
		}
		.item-fore3 img{
			float: right;
   			height: 38px;
		}
		.login-form .item-fore4{
			height: 38px;
		    line-height: 38px;
		    font-size: 12px;
		    color: red;
		    width: 304px;
		    margin: 0px auto;
		}
		#register{
			width:304px;
			margin:20px auto;
			color: #b61d1d;
   			font-size: 14px;
		}
		#register a{
			float:right;
		}
		#register a b {
		    display: inline-block;
		    width: 16px;
		    height: 16px;
		    overflow: hidden;
		    background: url(image/pwd-icons-new.png) -104px -75px no-repeat;
		    vertical-align: middle;
		    margin-right: 5px;
		}
		.footer {
		    font-size: 12px;
		    text-align: center;
		    border-top: solid 1px #e6e6e6;
		    color: #999;
		    padding-bottom: 30px;
		}
		.footer .links {
		    padding-top: 30px;
		    padding-bottom: 15px;
		}
		.footer a {
		    color: #999;
		    margin: 0 10px;
		}
		
	</style>

  </head>
  
  <body>
   		<div class="header">
   			<div class="w">
   				<a href="" target="_blank" class="logo"></a>
   				<div class="logo-title">欢迎登录</div>
   			</div>
   		</div>
   		<div id="content">
   			<div class="login-wrap">
   				<div class="login-banner" style="background-color: #e93854">
   					<div class="w">
	   					<div id="banner-bg" class="i-inner" style="background: url(image/5aa68632Nd7790d0c.png) 0px 0px no-repeat;background-color: #e93854">
	   						<div class="login-form">
								<div class="login-tab">
				                    <a href="javascript:void(0)"  style="outline: rgb(109, 109, 109) none 0px;" class="checked">账户登录</a>
				                </div>
				                <div class="item item-fore1">
                                    <label for="loginname" class="login-label name-label"></label>
                                    <input id="loginname" type="text" class="itxt" name="loginname" autocomplete="off" maxlength="16" size="16" placeholder="邮箱/用户名/已验证手机">
                                </div>
                                <div class="item item-fore2">
                                    <label for="loginname" class="login-label pwd-label"></label>
                                    <input type="password" id="loginpwd" name="loginpwd" class="itxt itxt-error"  autocomplete="off" maxlength="16" size="16" placeholder="密码">
                                </div>
                                 <div class="item item-fore3">
                                    <input type="text" id="logincode" name="logincode" maxlength="4" size="4" class="itxt itxt-error"  autocomplete="off" placeholder="验证码">
                                    <i id="validate"></i>
                                    <img id="code" src="login/randomImage">
                                </div>
                                <div class="item item-fore4"></div>
                                <div class="item item-fore5">
                                    <div class="login-btn">
                                        <a href="javascript:;" class="btn-img btn-entry" id="loginsubmit" tabindex="6"  style="outline: rgb(109, 109, 109) none 0px;">登&nbsp;&nbsp;&nbsp;&nbsp;录</a>
                                    </div>
                                </div>
                                <div id="register">
                                	<a href="login/showRegister" target="_blank"><b></b>立即注册</a>
                                </div>
							</div>
	   					</div>
					</div>
		        </div>
   			</div>
   		</div>
		

   			<div id="form-footer" class="footer w">
			    <div class="links">
			        <a> 关于我们</a>|
			        <a>联系我们</a>|
			        <a>人才招聘</a>|
			        <a>商家入驻</a>|
			        <a>广告服务</a>|
			        <a>手机京东</a>|
			        <a>友情链接</a>|
			        <a>销售联盟</a>|
			        <a>京东社区</a>|
			        <a>京东公益</a>|
			        <a>English Site</a>
			    </div>
			    <div class="copyright">
			        Copyright©2004-2016&nbsp;&nbsp;京东JD.com&nbsp;版权所有
			    </div>
			</div>
  </body>
</html>
