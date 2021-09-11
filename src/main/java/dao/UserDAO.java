package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Category;
import model.User;
import utils.JpaUtils;

public class UserDAO extends abstractSQLDAO<User, String> {
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	public boolean insert(User entity) {
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		return true;
	}

	@Override
	public boolean update(User entity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User selectById(String id) {
		
		return em.find(User.class, id);
	}

	@Override
	public List<User> selectAll() {
		TypedQuery<User> query = em.createQuery("Select o from User o", User.class);
		return query.getResultList();
	}

}
