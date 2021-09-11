package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "danhmuc")
public class Category {
	@Id
	@Column(name="madm")
	private String id;
	
	@Column(name="tendanhmuc")
	private String name;
	
	@Column(name="ghichu")
	private String note;

	@OneToMany(mappedBy = "category", fetch = FetchType.LAZY)
	private List<Product> products;
	
	public Category() {
	}

	public Category(String id, String name, String note) {
		this.id = id;
		this.name = name;
		this.note = note;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	
	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", name=" + name + ", note=" + note + "]";
	}

	public void add(Product tempProduct) {
		if(products == null) {
			products = new ArrayList<>();
		}
		
		products.add(tempProduct);
		tempProduct.setCategory(this);
	}
	
}
