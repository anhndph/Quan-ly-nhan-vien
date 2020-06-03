package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dao.*;
import poly.entity.*;

@Controller
//@RequestMapping("/QLPhongBan/")
public class DepartsController {
	@Autowired
	DepartsDao departsDao;

	@Autowired
	StaffsDao staffDao;

	public void reload(ModelMap model) {
		List<Departs> list = new ArrayList<Departs>();
		list = departsDao.getAll();
		model.addAttribute("newdepart", new Departs());
		model.addAttribute("listDeparts", list);
	}

	// đẩy dữ liệu phòng ban sang trang update
	@RequestMapping(value = "QLPBupdate", method = RequestMethod.GET)
	public String updatePhongBan(@RequestParam("id") String id, ModelMap model) {
		Departs depart = departsDao.getDepartById(id);
		model.addAttribute("depart", depart);
		return "admin/updateDepart";
	}
	
	// cập nhật phòng ban
	@RequestMapping(value = "updateqlpb", method = RequestMethod.POST)
	public String updateFunction(@ModelAttribute Departs depart, ModelMap model) {
		if (departsDao.update(depart)) {
			model.addAttribute("message", "update thành công");
		} else {
			model.addAttribute("message", "update thất bại");
		}
		this.reload(model);

		return "admin/QLPhongBan";
	}

	@RequestMapping("QLPBdelete")
	public String deletePhongBan(@RequestParam("id") String id, ModelMap model) {
		Departs depart = departsDao.getDepartById(id);
		if (staffDao.deleteByIdDepart(depart.getIdDeparts())) {
			System.out.println("oke");
		}
		if (departsDao.delete(depart)) {
			model.addAttribute("message", "delete thành công thành công");
		} else {
			model.addAttribute("message", "delete thất bại");
		}
		this.reload(model);
		return "redirect:/QLPhongBan";
	}

	@RequestMapping(value = "QLPhongBan")
	public String QLPhongBan(ModelMap model, HttpSession session) {
		try {
			this.reload(model);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "admin/QLPhongBan";
	}

	// Thêm phòng ban
	@RequestMapping(value = "addNewDepart", method = RequestMethod.POST)
	public String addnewPhongBan(ModelMap model,@Validated @ModelAttribute("newdepart") Departs newdepart,BindingResult errors) {
		
		try {
			System.out.println("validate");
			if(errors.hasErrors()) {
				List<Departs> list = new ArrayList<Departs>();
				list = departsDao.getAll();
				model.addAttribute("listDeparts", list);
				return "admin/QLPhongBan";
			}
			
			if (departsDao.addNew(newdepart)) {
				model.addAttribute("message", "thêm mới thành công");
			} else {
				model.addAttribute("message", "thêm mới thất bại");
			}
			this.reload(model);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return "admin/QLPhongBan";
	}

}
