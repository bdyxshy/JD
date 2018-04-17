package dao;

import org.apache.ibatis.annotations.Param;

import entity.User;

public interface LoginDao {
	public User searchUserName(String regName) ;
	public int addUser(@Param(value="regName")String regName,@Param(value="pwd")String pwd);
	public User validate(@Param(value="loginname")String loginname, @Param(value="loginpwd")String loginpwd);
}
