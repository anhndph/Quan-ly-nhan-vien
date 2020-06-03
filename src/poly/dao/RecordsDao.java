package poly.dao;

import java.util.List;

import javax.transaction.Transactional;

import poly.entity.*;
import poly.itface.RecordsDaoInterface;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import poly.entity.*;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
@Transactional
public class RecordsDao  implements RecordsDaoInterface{
	@Autowired
	SessionFactory sessionFactory;

	public List<Records> getAllRecords() {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("from Records");
			List<Records> list = query.list();

			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	public boolean addNewRecords(Records record) {
		Session session = sessionFactory.openSession();
		Transaction tran = session.beginTransaction();
		try {

			session.save(record);
			tran.commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean deleteRecordByIdStaffs(String idStaff) {
		Session session = sessionFactory.openSession();
		Transaction tran = session.beginTransaction();
		try {
			String hql = "from Records WHERE IdStaffs like '" + idStaff + "'";
			Query query = session.createQuery(hql);
			List<Records> list = query.list();
			for (Records record : list) {
				session.delete(record);
			}
			tran.commit();
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			tran.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	
	
	public List<Object[]> getTongTTvaKLOfStaff() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "SELECT staffs.idStaffs,staffs.nameStaffs, " + "sum(case when type = 1 then 1 else 0 end), "
				+ "sum(case when type = 0 then 1 else 0 end) " + "FROM Records "
				+ "GROUP BY staffs.idStaffs,staffs.nameStaffs";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}

	public List<Object[]> getTongTTvaKLOfDepart() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "select d.idDeparts, d.nameDeparts, "
				+ "SUM(case when r.type = 1 then 1 else 0 end), "
				+ "SUM(case when r.type = 0 then 1 else 0 end) "
				+ "from Records r join r.staffs as s "
				+ "join s.departs as d GROUP BY d.idDeparts,d.nameDeparts";
		Query query = session.createQuery(hql);
		List<Object[]> list = query.list();
		return list;
	}
	
	

}
