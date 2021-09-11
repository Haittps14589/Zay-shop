package model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;

@NamedStoredProcedureQueries({
		@NamedStoredProcedureQuery(name = "Report.countProduct", procedureName = "spCountProduct", parameters = {
				@StoredProcedureParameter(name = "month", type = Integer.class) }, resultClasses = { ReportProduct.class }) })

@Entity
public class ReportProduct implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "masp")
	private String id_product;

	@Column(name = "tensp")
	private String name_product;

	@Column(name = "hinh")
	private String image_product;

	@Column(name = "giasp")
	private String price_product;
	
	@Column(name = "soluong")
	private String quantity;

	public String getId_product() {
		return id_product;
	}

	public void setId_product(String id_product) {
		this.id_product = id_product;
	}

	public String getName_product() {
		return name_product;
	}

	public void setName_product(String name_product) {
		this.name_product = name_product;
	}

	public String getImage_product() {
		return image_product;
	}

	public void setImage_product(String image_product) {
		this.image_product = image_product;
	}

	public String getPrice_product() {
		return price_product;
	}

	public void setPrice_product(String price_product) {
		this.price_product = price_product;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public ReportProduct(String id_product, String name_product, String image_product, String price_product,
			String quantity) {
		super();
		this.id_product = id_product;
		this.name_product = name_product;
		this.image_product = image_product;
		this.price_product = price_product;
		this.quantity = quantity;
	}

	public ReportProduct() {
		super();
	}

	@Override
	public String toString() {
		return "ReportProduct [id_product=" + id_product + ", name_product=" + name_product + ", image_product="
				+ image_product + ", price_product=" + price_product + ", quantity=" + quantity + "]";
	}


	

}
