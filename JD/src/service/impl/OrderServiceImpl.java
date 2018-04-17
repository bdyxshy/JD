package service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.OrderService;
import dao.CartDao;
import dao.OrderDao;
import entity.Cart;
import entity.Order;
import entity.Product;
import entity.User;
@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	OrderDao orderDao;
	@Autowired
	CartDao cartDao;
	@Override
	public boolean addOrder(List<Cart> list,User user) {
		boolean flag=false;
//		String number=UUID.randomUUID().toString();
		String number=generateOrderNumber(user.getId());
		double total=0;
		int cartId=0;
		Product product;
		int num=0;
		for(int i=0;i<list.size();i++){
			cartId=list.get(i).getId();
			Cart cart=cartDao.searchById(cartId);
			if(cart!=null){
				total=cart.getTotal();
				product=cart.getProduct();
				num=cart.getNum();
			}else{
				break;
			}
			Order order=new Order();
			order.setNumber(number);
			order.setProduct(product);
			order.setNum(num);
			order.setTotal(total);
			order.setUser(user);
			int oId=orderDao.addOrder(order);
			oId=order.getId();
			if(oId>0){
				int r=cartDao.delete(cartId);
				if(r>0){
					flag=true;
				}else{
					flag=false;
					break;
				}
			}
		}
		return flag;
	}
	public String generateOrderNumber(int userId){
		Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmssSS");
		String orderNumber=format.format(date);
		String id=String.valueOf(userId);
		String prev="";
		for(int i=id.length();i<4;i++){
			prev+="0";
		}
		id=prev+id;
		orderNumber+=id;
		return orderNumber;
	}
	public List<Order> showOrder(String number){
		List<Order> orderList=orderDao.showOrder(number);
		return orderList;
	}
	@Override
	public boolean delOrder(int orderId, User user) {
		int uId=user.getId();
		int rs=orderDao.delOrder(orderId,uId);
		if(rs>1){
			return true;
		}else{
			return false;
		}
	}
	@Override
	public List<Order> searchNumber(User user) {
		int uId=user.getId();
		return orderDao.searchNumber(uId);
	}
}
