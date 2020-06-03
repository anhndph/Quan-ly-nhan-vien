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

import poly.entity.Departs;
import poly.entity.Records;
import poly.entity.Staffs;
import poly.itface.StaffsDaoInterface;

@Repository
@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class StaffsDao implements StaffsDaoInterface {

	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	RecordsDao recordDao;

	@Transactional
	public List<Staffs> getAll() {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("from Staffs");
			List<Staffs> list = query.list();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public List<Object[]> topStaffsExcellent() {
		Session session = sessionFactory.getCurrentSession();
		try {
			String hql = "select s.nameStaffs, s.photo, d.nameDeparts, "
					+ "SUM(case when r.type = 1 then 1 else 0 end), " + "SUM(case when r.type = 0 then 1 else 0 end) "
					+ "FROM Staffs s join s.departs as d " + "JOIN s.records as r "
					+ "GROUP BY s.nameStaffs, s.photo,d.nameDeparts "
					+ "ORDER BY (SUM(case when r.type = 1 then 1 else 0 end)-SUM(case when r.type = 0 then 1 else 0 end)) "
					+ " DESC";

			Query query = session.createQuery(hql);
			query.setMaxResults(8);
			List<Object[]> list = query.list();

			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public List<Staffs> findStaffsByName(String nameStaff) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("FROM Staffs WHERE nameStaffs LIKE '%" + nameStaff + "%'");
			List<Staffs> list = query.list();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Transactional
	public boolean addNew(Staffs staff) {
		Session session = sessionFactory.openSession();
		Transaction tran = session.beginTransaction();
		try {
			session.save(staff);
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
	public boolean update(Staffs staff) {
		Session session = sessionFactory.openSession();
		Transaction tran = session.beginTransaction();
		try {
			session.update(staff);
			tran.commit();
			return true;
		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}

	}

	@Transactional
	public boolean delete(Staffs staff) {
		Session session = sessionFactory.openSession();
		Transaction tran = session.beginTransaction();
		try {
			System.out.println(staff.getIdStaffs());
			// Thực hiện xóa các Record có id của staff muốn xóa
			recordDao.deleteRecordByIdStaffs(staff.getIdStaffs());
			// xóa staff
			session.delete(staff);
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
	public boolean deleteByIdDepart(String idDepart) {
		Session session = sessionFactory.openSession();
		Transaction tran = session.beginTransaction();
		try {
			String hql = "from Staffs WHERE IdDeparts = '" + idDepart + "'";
			Query query = session.createQuery(hql);
			List<Staffs> list = query.list();
			for (Staffs staff : list) {
				recordDao.deleteRecordByIdStaffs(staff.getIdStaffs());
				session.delete(staff);
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

	@Transactional
	public Staffs getStafftById(String id) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Staffs staff = (Staffs) session.get(Staffs.class, id);
			return staff;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}

	}

}
