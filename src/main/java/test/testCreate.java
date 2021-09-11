package test;

import static org.testng.Assert.assertEquals;

import javax.persistence.RollbackException;

import org.testng.annotations.BeforeClass;
import org.testng.annotations.Ignore;
import org.testng.annotations.Test;

import dao.ProductDAO;
import model.Product;

public class testCreate {	
	ProductDAO dao;
	@BeforeClass
	public void initDAO() {
		dao = new ProductDAO();
	}
	
	@Test
	public void insertproduct() {
		Product p = new Product("SP60","SPMoi",10000,"abc",null,null,"0","10"); // pass vi bị trùng id => exc = rollback
		dao.insert(p);
	}
	
	@Test
	public void updateProduct() {
		Product p = new Product("SP60","SPMoi1",10000,"abc",null,null,"0","10"); 
		boolean testResult = dao.update(p);
		assertEquals(testResult, false);
	}
	
	@Test
	@Ignore
	public void deleteProduct() {
		dao.delete("SP60");
	}
	
}
