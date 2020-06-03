package poly.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Repository;

import poly.entity.Users;
import poly.itface.UserDaoInterface;

@Repository

@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS)
public class UserDao implements UserDaoInterface {
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public List<Users> getAll() {
		Session session = sessionFactory.getCurrentSession();
		try {
			Query query = session.createQuery("from Users");
			List<Users> list = query.list();
			return list;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}
	
}
