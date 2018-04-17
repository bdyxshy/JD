package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.OrderService;
import entity.Cart;
import entity.Order;
import entity.User;

@Controller
@RequestMapping(value="order")
public class OrderController {
	@Autowired
	OrderService orderService;
	@RequestMapping(value="addOrder")
	public void addOrder(@RequestBody List <Cart> list,HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
//		User user=new User();
//		user.setId(1);
		orderService.addOrder(list,user);
	}
	@RequestMapping(value="showOrder")
	@ResponseBody
	public ModelAndView showOrder(HttpSession httpSession){
		ModelAndView mv=new ModelAndView("qian/orders");
		User user=(User)httpSession.getAttribute("user");
//		User user=new User();
//		user.setId(1);
		if(user==null){
			mv=new ModelAndView("qian/login");
			return mv;
		}
		List<Order> list=orderService.searchNumber(user);
		List<Order> orderList=new ArrayList<Order>();
		List<Object>osList=new ArrayList<Object>();
		for(int i=0;i<list.size();i++){
			orderList=orderService.showOrder(list.get(i).getNumber());
			osList.add(orderList);
		}
		mv.addObject("osList",osList);
		return mv;
	}
	@RequestMapping(value="delOrder")
	@ResponseBody
	public boolean delOrder(int orderId,HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
//		User user=new User();
//		user.setId(1);
		boolean flag=orderService.delOrder(orderId,user);
		return flag;
	}
}
