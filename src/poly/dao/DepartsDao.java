package poly.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import poly.entity.*;
import poly.itface.*;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class DepartsDao implements DepartsDaoInterface {
	@Autowired
	SessionFactory sessionFactory;

	
	@Transactional
	public List<Departs> getAll() {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("from Departs");
			List<Departs> list = query.list();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public boolean addNew(Departs departs) {
		Session session = sessionFactory.openSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(departs);
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

	@Transactional
	public Departs getDepartById(String id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Departs depart = (Departs) session.get(Departs.class, id);
			return depart;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public boolean update(Departs depart) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(depart);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean delete(Departs depart) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.delete(depart);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}
}
