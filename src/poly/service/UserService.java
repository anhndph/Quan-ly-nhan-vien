package poly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.dao.UserDao;
import poly.entity.Users;

@Service
public class UserService {
	@Autowired
	UserDao userDao;
	
	public List<Users> getAll(){
		List<Users> list = userDao.getAll();
		return list;
	}
}
