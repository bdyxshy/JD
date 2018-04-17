package service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.CartService;
import dao.CartDao;
import dao.ProductDao;
import entity.Cart;
import entity.Product;
import entity.User;
@Service
public class CartServiceImpl implements CartService{
	@Autowired
	CartDao cartDao;
	@Autowired
	ProductDao productDao;
	@Override
	public boolean addCart(Cart cart) {
		boolean flag=false;
		int rs=0;
		Cart oldCart=cartDao.searchByProductAndUser(cart);
		Product product=productDao.searchById(cart.getProduct().getId());
		double price=product.getPrice();
		if(oldCart==null){
			double total=price*cart.getNum();
			cart.setTotal(total);
			rs=cartDao.add(cart);
		}else{
			cart.setId(oldCart.getId());
			int num=cart.getNum()+oldCart.getNum();
			double total=price*num;
			cart.setNum(num);
			cart.setTotal(total);
			rs=cartDao.update(cart);
		}
		if(rs>0){
			return true;
		}else{
			return false;	
		}
	}
	@Override
	public List<Cart> searchByUser(User user) {
		// TODO Auto-generated method stub
		return cartDao.searchByUser(user);
	}
	public Cart modify(Cart cart){
		int id=cart.getId();
		Cart  oldCart=cartDao.searchById(id);
		double price=oldCart.getProduct().getPrice();
		double total=price*cart.getNum();
		cart.setTotal(total);
		int rs=cartDao.update(cart);
		if(rs>0){
			return cart;
		}
		return cart;
	}
	@Override
	public int del(int id) {
		int rs=cartDao.delete(id);
		return rs;
	}
}
