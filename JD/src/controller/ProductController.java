package controller;

import java.util.List;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import entity.Product;
import service.ProductService;
@Controller
@RequestMapping(value="product")
public class ProductController {
	@Autowired
	ProductService productService;
	@RequestMapping(value="searchAll")
	public ModelAndView searchAll(){
		ModelAndView mv=new ModelAndView("qian/products");
		List<Product> list=productService.searchAll();
		mv.addObject("products",list);
		return mv;
	}
	@RequestMapping(value="search")
	@ResponseBody
	public List<Product> search(String text){
		List<Product> list=productService.search(text);
		return list;
	}
	@RequestMapping(value="detail")
	public ModelAndView detail(Integer id){
		Product p=productService.searchById(id);
		ModelAndView mv=new ModelAndView("qian/detail");
		mv.addObject("product",p);
		return mv;
	}
}
