package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.LoginService;
import dao.LoginDao;
import entity.User;
@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginDao loginDao;
	public User searchUserName(String regName) {
		return loginDao.searchUserName(regName);
	}
	public int addUser(String regName, String pwd) {
		return loginDao.addUser(regName,pwd);
	}
	public User validate(String loginname, String loginpwd) {
		return loginDao.validate(loginname,loginpwd);
	}

}
