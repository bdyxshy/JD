package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Cart;
import entity.Product;
import entity.User;
import service.CartService;
import service.ProductService;
@Controller
@RequestMapping(value="cart")
public class CartController {
	@Autowired
	CartService cartService;
	@Autowired
	ProductService productService;
	@RequestMapping(value="add")
	@ResponseBody
	public boolean add(Cart cart,HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
//		User user=new User();
//		user.setId(1);
		cart.setUser(user);
		boolean flag=cartService.addCart(cart);
		return flag;
	}
	@RequestMapping(value="show")
	public ModelAndView show(HttpSession httpSession){
		User user=(User)httpSession.getAttribute("user");
		if(user==null){
			ModelAndView mv=new ModelAndView("qian/login");
			return mv;
		}else{
			ModelAndView mv=new ModelAndView("qian/cart");
//			user=new User();
//			user.setId(1);
			List<Cart>carts=cartService.searchByUser(user);
			if(carts.size()==0){
				mv.addObject("test","[0]");
			}else{
				mv.addObject("carts",carts);
			}
			return mv;
		}
	}
	@RequestMapping(value="showAddCart")
	public ModelAndView showAddCart(int productId,int num,HttpSession httpSession){
		ModelAndView mv=new ModelAndView("qian/addCart");
		User user=(User)httpSession.getAttribute("user");
//		User user=new User();
//		user.setId(1);
		Product p=productService.searchById(productId);
		mv.addObject("num",num);
		mv.addObject("p",p);
		return mv;
	}
	@RequestMapping(value="modify")
	@ResponseBody
	public double modify(Cart cart){
		Cart c=cartService.modify(cart);
		return c.getTotal();
	}
	@RequestMapping(value="del")
	public void del(int id,HttpSession httpSession){
		//等做完了登录从session中获取用户
//		User user=new User();
//		user.setId(1);
		User user=(User)httpSession.getAttribute("user");
		cartService.del(id);
		cartService.searchByUser(user);
	}
}
