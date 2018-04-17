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
			loginpwd=CreateMD5.getMd5(loginpwd+"������ȥ�˱���");
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
			// ���ʽ����
			String regEx  = "[a-zA-Z0-9_-]{4,16}";
			// ����������ʽ
			Pattern pattern = Pattern.compile(regEx);
			// ��֤���ʽ
			Matcher matcher = pattern.matcher(regName);
			// �ַ����Ƿ���������ʽ��ƥ��
			boolean rs = matcher.matches();
			if(rs){
				regEx="[a-zA-Z0-9_-]{6,16}";
				pattern = Pattern.compile(regEx);
				matcher = pattern.matcher(pwd);
				rs = matcher.matches();
				if(rs){
					pwd=CreateMD5.getMd5(pwd+"������ȥ�˱���");
					int temp=loginService.addUser(regName,pwd);
					if(temp>0){
						return "<div style='width:200px; margin:200 auto;'>ע��ɹ�,<a href='showLogin'>�����¼</a></div>";
					}
				}
			}
		}
		return "<div style='width:200px; margin:200 auto;'>ע��ʧ��,<a href='showRegister'>�������ע��</a></div>";
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
