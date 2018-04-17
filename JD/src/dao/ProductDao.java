package dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import entity.Product;

public interface ProductDao {
	public List<Product> searchAll();
	public List<Product> search(@Param(value="text")String text);
	public Product searchById(Integer id);
}
