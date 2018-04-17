package entity;

public class SmallClass {
	private int id;
	private String name;
	private BigClass bigClass;
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
	public BigClass getBigClass() {
		return bigClass;
	}
	public void setBigClass(BigClass bigClass) {
		this.bigClass = bigClass;
	}
}
