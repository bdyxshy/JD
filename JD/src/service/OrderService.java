package service;

import java.util.List;

import entity.Cart;
import entity.Order;
import entity.User;

public interface OrderService {
	public boolean addOrder(List<Cart> list,User user);

	public List<Order> showOrder(String number);

	public boolean delOrder(int orderId, User user);
	public List<Order> searchNumber(User user);
}
