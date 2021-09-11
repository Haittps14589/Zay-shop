package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Category;
import utils.JpaUtils;

public class CategoryDAO extends abstractSQLDAO<Category, String> {
private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		em.close();
	}
	
	@Override
	public boolean insert(Category entity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Category entity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Category selectById(String id) {
		
		return em.find(Category.class, id);
	}

	@Override
	public List<Category> selectAll() {
		TypedQuery<Category> query = em.createQuery("Select o from Category o", Category.class);
		return query.getResultList();
	}

}
