package model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="nhanvien")
public class User {
	@Id
	@Column(name="maNV")
	private String id;
	@Column(name="matkhau")
	private String password;
	@Column(name="hoten")
	private String fullname;
	@Column(name="email")
	private String email;
	@Column(name="dienthoai")
	private String phone;
	@Column(name="vaitro")
	private boolean role;
	@Column(name="hinh")
	private String image;

	public User() {
		super();
	}
	
	public User(String id, String password, String fullname, String email, String phone, boolean role, String image) {
		super();
		this.id = id;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.phone = phone;
		this.role = role;
		this.image = image;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public boolean isRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", fullname=" + fullname + ", email=" + email + ", phone="
				+ phone + ", role=" + role + "]";
	}
	
	
}
