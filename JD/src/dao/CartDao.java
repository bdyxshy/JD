package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Cart;
import entity.Product;
import entity.User;

public interface CartDao {
	public Cart searchByProductAndUser(@Param(value="cart")Cart cart);
	public int add(@Param(value="cart")Cart cart);
	public int update(@Param(value="cart")Cart cart);
	public List<Cart> searchByUser(@Param(value="user")User user);
	public Cart searchById(int id);
	public int delete(int id);
}
