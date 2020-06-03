package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.apache.catalina.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dao.DepartsDao;
import poly.dao.StaffsDao;
import poly.dao.UserDao;
import poly.entity.Departs;
import poly.entity.Staffs;
import poly.entity.Users;
import poly.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserDao userDao;
	@Autowired
	StaffsDao staffDao;

	@RequestMapping(value = "/CheckLoginDashboard", method = RequestMethod.POST)
	public String Dashboard(ModelMap model, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpSession session) {
		try {
			List<Users> list = userDao.getAll();
			for (Users user : list) {
				if (user.getUsername().equals(username) && user.getPassword().equals(password)
						&& user.getUsername().equals("ducanh") && user.getPassword().equals("ducanh")) {
					session.setAttribute("admin", user.getFullname());
					return "redirect:/Dashboard";
				} else if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
					session.setAttribute("user", user.getFullname());
					return "redirect:/homepage";
				}
			}
		} catch (Exception e) {
			// TODO: handle exception m
			e.printStackTrace();
		}
		model.addAttribute("messageLoginFail", "Đăng nhập thất bại, kiểm tra lại thông tin");
		return "ReLogin";
	}
	
	@RequestMapping(value = "Login")
	public String lg() {
		return "ReLogin";
	}

	@RequestMapping(value = "homepage")
	public String homepage(ModelMap model) {
		List<Object[]> list = staffDao.topStaffsExcellent();
		model.addAttribute("topstaff", list);
		return "HomePage";
	}

	@RequestMapping(value = "Dashboard", method = RequestMethod.GET)
	public String reLoad() {
		return "admin/Dashboard";
	}
	
	@RequestMapping(value = "logout")
	public String logOut(HttpSession session) {
		session.removeAttribute("admin");
		session.removeAttribute("user");
		return "redirect:/homepage";
	}

}
