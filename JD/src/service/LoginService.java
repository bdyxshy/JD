package service;

import entity.User;

public interface LoginService {
	public User searchUserName(String regName);
	public int addUser(String regName, String pwd);
	public User validate(String loginname, String loginpwd);
}
