package controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.User;
import service.LoginService;
import util.CreateMD5;

@Controller
@RequestMapping(value="login")
public class LoginController {
	@Autowired
	LoginService loginService;
	@RequestMapping(value="login")
	@ResponseBody
	public String login(String loginname,String loginpwd,String logincode,HttpSession httpSession){
		if(logincode.equals(httpSession.getAttribute("numrand"))){
			loginpwd=CreateMD5.getMd5(loginpwd+"马蹄南去人北望");
			User user=loginService.validate(loginname,loginpwd);
			if(user!=null){
				httpSession.setAttribute("user",user);
				return "success";
			}
		}
		return "faild";
		
	}
	@RequestMapping(value="showLogin")
	public ModelAndView showLogin(){
		ModelAndView mv=new ModelAndView("qian/login");
		return mv;
	}
	@RequestMapping(value="showRegister")
	public ModelAndView showRegister(){
		ModelAndView mv=new ModelAndView("qian/register");
		return mv;
	}
	@ResponseBody
	@RequestMapping(value="register",produces="text/html;charset=UTF-8")
	public String register(String regName,String pwd,String code,HttpSession httpSession){
		if(httpSession.getAttribute("numrand").equals(code)){
			// 表达式规则
			String regEx  = "[a-zA-Z0-9_-]{4,16}";
			// 编译正则表达式
			Pattern pattern = Pattern.compile(regEx);
			// 验证表达式
			Matcher matcher = pattern.matcher(regName);
			// 字符串是否与正则表达式相匹配
			boolean rs = matcher.matches();
			if(rs){
				regEx="[a-zA-Z0-9_-]{6,16}";
				pattern = Pattern.compile(regEx);
				matcher = pattern.matcher(pwd);
				rs = matcher.matches();
				if(rs){
					pwd=CreateMD5.getMd5(pwd+"马蹄南去人北望");
					int temp=loginService.addUser(regName,pwd);
					if(temp>0){
						return "<div style='width:200px; margin:200 auto;'>注册成功,<a href='showLogin'>点击登录</a></div>";
					}
				}
			}
		}
		return "<div style='width:200px; margin:200 auto;'>注册失败,<a href='showRegister'>点击重新注册</a></div>";
	}
	@RequestMapping(value="randomImage")
	public ModelAndView randomImage(){
		ModelAndView mv=new ModelAndView("qian/code");
		return mv;
	}
	@RequestMapping(value="searchUserName")
	@ResponseBody
	public boolean searchUserName(String regName){
		User user=loginService.searchUserName(regName);
		if(user!=null){
			return true;
		}else{
			return false;
		}
	}
	@RequestMapping(value="validate")
	@ResponseBody
	public String validate(String code,HttpSession httpSession){
		if(code.equals(httpSession.getAttribute("numrand"))&&!code.equals("")){
			return "success";
		}else{
			return "faild";
		}
	}
}
