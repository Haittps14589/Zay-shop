package dao;

import java.util.List;

import javax.management.Query;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Product;
import utils.JpaUtils;

public class ProductDAO extends abstractSQLDAO<Product, String>{
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}
	
	@Override
	public boolean insert(Product entity) {
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		return true;
	}

	@Override
	public boolean update(Product entity) {
		em.getTransaction().begin();
		em.merge(entity);
		em.getTransaction().commit();
		return true;
	}

	@Override
	public boolean delete(String id) {
		em.getTransaction().begin();
		Product product = em.find(Product.class, id);
		em.remove(product);
		em.getTransaction().commit();
		return true;
	}

	@Override
	public Product selectById(String id) {
		// TODO Auto-generated method stub
		return em.find(Product.class, id);
	}

	@Override
	public List<Product> selectAll() {
		TypedQuery<Product> query =  em.createQuery("Select o from Product o", Product.class);
		return query.getResultList();
	}
	
	public List<Product> selectPage(int page, int size) {
		TypedQuery<Product> query =  em.createQuery("Select o from Product o", Product.class);
		query.setFirstResult((page-1)*size);
		query.setMaxResults(size);
		return query.getResultList();
	}
	
	public List<Product> RandomProduct(){
		List<Product> products= em.createNativeQuery("SELECT TOP 3 * FROM sanpham ORDER BY newid()", Product.class).getResultList();
		return products;
	}

}
