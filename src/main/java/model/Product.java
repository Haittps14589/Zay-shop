package model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;


@Entity
@Table(name = "sanpham")
public class Product {

	@Id
	@Column(name = "masp")
	private String id;
	
	@Column(name="tensp")
	private String name;
	
	@Column(name="giasp")
	private int price;
	
	@Column(name="mota")
	private String description;

	@Column(name="hinh")
	private String image;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="madm")
	private Category category;
	
	@Column(name="giamgia")
	private String discount;
	
	@Column(name="soluongKho")
	private String inventory;
	


	public Product() {
	}
	
	
	
	public Product(String id, String name, int price, String description, String image, Category category,
			String discount, String inventory) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.description = description;
		this.image = image;
		this.category = category;
		this.discount = discount;
		this.inventory = inventory;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", image="
				+ image + ", category=" + category + ", discount=" + discount + ", inventory=" + inventory + "]";
	}
	
	

}
