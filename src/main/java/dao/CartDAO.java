package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import model.Cart;
import utils.JpaUtils;

public class CartDAO extends abstractSQLDAO<Cart, Integer>{
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	public boolean insert(Cart entity) {
		em.getTransaction().begin();
		em.persist(entity);		
		em.getTransaction().commit();
		return true;
	}

	@Override
	public boolean update(Cart entity) {
		em.getTransaction().begin();
		em.merge(entity);		
		em.getTransaction().commit();
		return true;
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Cart selectById(Integer id) {
		
		return em.find(Cart.class, id);
	}

	@Override
	public List<Cart> selectAll() {
		TypedQuery<Cart> query = em.createQuery("select o from Cart o",Cart.class);
		return query.getResultList();
	}
	
	public List<Cart> selectAllByUser(String id_user) {
		TypedQuery<Cart> query = em.createQuery("select o from Cart o where o.user_id = :id_user order by o.date desc",Cart.class);
		query.setParameter("id_user", id_user);
		return query.getResultList();
	}

}
