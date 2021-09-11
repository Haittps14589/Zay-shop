package dao;

import java.util.List;

import javax.persistence.EntityManager;

import model.CartDetail;
import utils.JpaUtils;

public class CartDetailDAO extends abstractSQLDAO<CartDetail, Integer>{
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	public boolean insert(CartDetail entity) {
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		return true;
	}

	@Override
	public boolean update(CartDetail entity) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public CartDetail selectById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CartDetail> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public List<CartDetail> selectAllbyIdCart(Integer id) {
//		Typed
		return null;
	}
	
}
