package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;

import model.ReportProduct;
import utils.JpaUtils;

public class CallProcedure {
	EntityManager em = JpaUtils.getEntityManager();
	
	@SuppressWarnings("unchecked")
	public List<ReportProduct> spReportProduct(int month){		
		StoredProcedureQuery query = em.createNamedStoredProcedureQuery("Report.countProduct");
				query.setParameter("month", month);
		return query.getResultList();
	}
}
