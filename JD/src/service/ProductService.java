package service;

import java.util.List;

import entity.Product;

public interface ProductService {
	public List<Product> searchAll();

	public List<Product> search(String text);

	public Product searchById(Integer id);
}
