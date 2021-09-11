package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity

@Table(name = "giohangchitiet", uniqueConstraints={
@UniqueConstraint(columnNames = {"masp" , "magh"})
})
public class CartDetail{
	@Id
	@Column(name="maghct")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="masp")
	private Product product;
	
	@ManyToOne
	@JoinColumn(name="magh")
	private Cart cart;
	
	@Column(name="soluong")
	private int quantity;
	
	public int getId() {
		return id;
	}

	public CartDetail() {
		super();
	}
	
	public CartDetail(int id, Product product, int quantity) {
		super();
		this.id = id;
		this.product = product;
		this.quantity = quantity;
	}



	public void setId(int id) {
		this.id = id;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
	public int getquantity() {
		return quantity;
	}
	public void setquantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return " [Mã: " + id + ", Tên sản phẩm: " + product.getName() + "Giá sản phẩm: "+ product.getPrice() +", Số lượng: " + quantity +", thành tiền: " + quantity * product.getPrice() + "]";
	}
	
	
	
	
	
}
