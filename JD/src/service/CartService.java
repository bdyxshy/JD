package service;

import java.util.List;

import entity.Cart;
import entity.Product;
import entity.User;

public interface CartService {
	public boolean addCart(Cart cart);
	public List<Cart> searchByUser(User user);
	public Cart modify(Cart cart);
	public int del(int id);
}
