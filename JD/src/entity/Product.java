package entity;

import java.util.List;



public class Product {
	private int id;
	private String name;
	private String content;
	private double price;
	private String author;
	private Publish publish;
	private SmallClass smallClass;
	private List<Picture> pics;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public List<Picture> getPics() {
		return pics;
	}
	public void setPics(List<Picture> pics) {
		this.pics = pics;
	}
	public Publish getPublish() {
		return publish;
	}
	public void setPublish(Publish publish) {
		this.publish = publish;
	}
	public SmallClass getSmallClass() {
		return smallClass;
	}
	public void setSmallClass(SmallClass smallClass) {
		this.smallClass = smallClass;
	}
}
