package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="giohang")
public class Cart {
	@Id
	@Column(name="magh")
	private int id;
	@Column(name="tongtien")
	private double Total;
	@Column(name="maNV")
	private String user_id;
	@Temporal(TemporalType.DATE)
	@Column(name="ngayTao")
	private Date date;
	
	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private List<CartDetail> cartDetails;
	
	
	
	public Cart(int id, double total, String user_id, Date date) {
		super();
		this.id = id;
		Total = total;
		this.user_id = user_id;
		this.date = date;
	}

	public Cart() {
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTotal() {
		return Total;
	}

	public void setTotal(double total) {
		Total = total;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
	public List<CartDetail> getCartDetails() {
		return cartDetails;
	}
	public void setCartDetails(List<CartDetail> cartDetails) {
		this.cartDetails = cartDetails;
	}
	
	
	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Cart [id=" + id + ", Total=" + Total + ", user_id=" + user_id + "]";
	}
	
	public void add(CartDetail tempCartDetail) {
		if(cartDetails == null) {
			cartDetails = new ArrayList<>();
		}
		
		cartDetails.add(tempCartDetail);
		tempCartDetail.setCart(this);
	}
	
	
}
