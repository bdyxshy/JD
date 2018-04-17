<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人注册</title>
    
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
			$("[name=regName]").keyup(function(){
				var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
				//输出 true
				var flag=uPattern.test($("[name=regName]").val());
				if(flag==true){
					$("[name=regName]").parent().next().children().html("");
					searchUserName();
				}else{
					$("[name=regName]").next().removeClass();
					$("[name=regName]").parent().next().children().html("请输入4-16个字符的字母、数字、'-'、'_'的组合");
				}
			})
			function searchUserName(){
					$.ajax({
						url:"login/searchUserName",
						type:"post",
						data:{
							regName:$("[name=regName]").val(),
						},
						dataType:"text",
						success:function(data){
							if(data=="false"){
								$("[name=regName]").next().addClass("i-status");
								$("[name=regName]").parent().next().children().html("");
							}else{
								$("[name=regName]").next().removeClass();
								$("[name=regName]").parent().next().children().html("该用户名已存在");
							}
						}
					})
			}
			$("[name=pwd]").keyup(function(){
				var uPattern = /^[a-zA-Z0-9_-]{6,16}$/;
				//输出 true
				var flag=uPattern.test($("[name=pwd]").val());
				if(flag==true){
					$("[name=pwd]").parent().next().children().html("");
					$("[name=pwd]").next().addClass("i-status");
				}else{
					$("[name=pwd]").next().removeClass();
					$("[name=pwd]").parent().next().children().html("请输入6-16个字符的字母、数字、'-'、'_'的组合");
				}
			})
			$("[name=code]").blur(function(){
				$.ajax({
					url:"login/validate",
					type:"post",
					data:{"code":$("[name=code]").val()},
					dataType:"text",
					success:function(data){
						if(data=="success"){
							$("#validate").addClass("i-status");
							$("[name=code]").parent().next().children().html("");
						}else{
							$("#validate").removeClass();
							$("[name=code]").parent().next().children().html("您输入的验证码有误!");
						}
					}
				})
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
			background:url(image/headbg.jpg) repeat-x left bottom;
			height:110px;
		}
		.w{
			width: 1210px;
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
		.reg-form {
		    width: 400px;
		}
		.fl {
		    float: left;
		}
		.form-item {
		    position: relative;
		    border: solid 1px #ddd;
		    width: 398px;
		    height: 52px;
	    }
	    .form-item label {
		    float: left;
		    width: 90px;
		    height: 52px;
		    line-height: 52px;
		    padding-left: 20px;
		}
		.form-item .field {
		    border: 0 none;
		    font-size: 14px;
		    width: 230px;
		    padding-bottom: 17px;
		    padding-left: 20px;
		    padding-top: 16px;
		    font-family: "Microsoft YaHei","Hiragino Sans GB";
		    float:left;
		}
		 .i-status {
		    display: block;
		    position: absolute;
		    width: 16px;
		    height: 16px;
		    top: 20px;
		    right: 20px;
 		    background-image: url('image/icon.png');
			background-repeat: no-repeat;
			background-position:0 -117px;
		}
		.input-tip {
		    color: #c5c5c5;
		    height: 27px;
		    font-size: 12px;
		    padding-top: 5px;
		}
		.input-tip .error {
		    color: #e22;
		}
		#code{
			height:52px;
			float:right;
		}
		.btn-register {
		    width: 100%;
		    height: 54px;
		    color: #fff;
		    background: #e22;
		    border: 0;
		    font-size: 16px;
		    font-family: "Microsoft YaHei","Hiragino Sans GB";
		}
		.reg-other {
		    float: left;
		    margin-left: 104px;
		    height: 350px;
		    padding-left: 90px;
		    border-left: solid 1px #e6e6e6;
		}
		.reg-other .company-reg {
		    width: 160px;
		    height: 60px;
		    border-bottom: solid 1px #ddd;
		    margin-left: 30px;
		}
		.reg-other .company-reg a {
		    display: block;
		    width: 160px;
		    height: 30px;
		}
		.reg-other .company-reg a i {
		    display: inline-block;
		    width: 30px;
		    height: 29px;
		    vertical-align: middle;
		    margin-right: 15px;
		    background-image: url(image/icon.png);
		    background-repeat: no-repeat;
		    background-position: 0 -50px;
		}
		.reg-other .company-reg a span {
		    vertical-align: middle;
		}
		.reg-other .inter-cust {
		    width: 160px;
		    margin-left: 30px;
		    margin-top: 30px;
		}
		.reg-other .inter-cust a {
		    display: block;
		    width: 170px;
		    height: 40px;
		}
		.reg-other .inter-cust a i {
		    display: inline-block;
		    width: 30px;
		    height: 30px;
		    vertical-align: text-bottom;
		    margin-right: 15px;
		    float: left;
		    margin-top: 7px;
		    background-position: -50px -50px;
		    background-image: url(image/icon.png);
		    background-repeat: no-repeat;
		}
		.reg-other .inter-cust a span {
		    display: inline-block;
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
		#validate{
			right:120px;
		}
	</style>

  </head>
  
  <body>
   		<div class="header">
   			<div class="w">
   				<a href="" target="_blank" class="logo"></a>
   				<div class="logo-title">欢迎注册</div>
   				<div class="have-account">已有账号?
   					<a href="login/showLogin">请登录</a>
   				</div>
   			</div>
   		</div>
   		<div class="container w">
   				<div class="main">
   					<div class="reg-form fl">
   						<form action="login/register" method="post">
   							<div class="form-item">
   								<label>用　户　名</label>
   								<input type="text" name="regName" class="field" maxlength="16" size="16" placeholder="请输入用户名">
   								<i></i>
   							</div>
   							<div class="input-tip">
   								<span class="error"></span>
   							</div>
   							<div class="form-item">
   								<label>设 置 密 码</label>
   								<input type="password" name="pwd" maxlength="16" size="16" class="field" placeholder="请输入密码">
   								<i></i>
   							</div>
   							<div class="input-tip">
   								<span class="error"></span>
   							</div>
   							<div class="form-item">
   								<label>验　证　码</label>
   								<input type="text" name="code" class="field" maxlength="4" size="4" style="width:176px;" placeholder="请输入验证码">
   								<i id="validate" ></i>
   								<img id="code" src="login/randomImage">
   								<div class="cl"></div>
   							</div>
   							<div class="input-tip">
   								<span  class="error"></span>
   							</div>
   							<div>
			                    <button type="submit" class="btn-register">立即注册</button>
			                </div>
   						</form>
   					</div>
   					<div id="form-company" class="reg-other">
                        <div class="company-reg">
                            <a>
		                        <i class="i-company"></i>
		                        <span>企业用户注册</span>
		                    </a>
			            </div>
			            <div class="inter-cust">
			                <a>
			                    <i class="i-global"></i>
			                    <span>INTERNATIONAL<br>CUSTOMERS</span>
			                </a>
			            </div>
                     </div>
   				</div>
   			</div>
   			<div class="cl"></div>
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
