package poly.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import poly.dao.DepartsDao;
import poly.dao.StaffsDao;
import poly.entity.Departs;
import poly.entity.Staffs;

@Controller
public class StaffsController {
	@Autowired
	StaffsDao staffsDao;
	@Autowired
	DepartsDao departsDao;

	

	@RequestMapping(value = "QLNhanVien")
	public String QLNhanVien(ModelMap model, @RequestParam(required = false) Integer page) {
		List<Staffs> list = new ArrayList<Staffs>();
		list = staffsDao.getAll();
		
		PagedListHolder<Staffs> pagedListHolder = new PagedListHolder<>(list);
		pagedListHolder.setPageSize(4);
		
		model.addAttribute("maxPages", pagedListHolder.getPageCount());
		if (page == null || page < 1 || page > pagedListHolder.getPageCount())
			page = 1;
		model.addAttribute("page", page);
		
		if (page == null || page < 1 || page > pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(0);
			model.addAttribute("listStaffs", pagedListHolder.getPageList());
		
		} else if (page <= pagedListHolder.getPageCount()) {
			pagedListHolder.setPage(page - 1);
			model.addAttribute("listStaffs", pagedListHolder.getPageList());
		
		}	
		model.addAttribute("newstaff", new Staffs());
		return "admin/QLNhanVien";
	}
	
	@RequestMapping("seachstaff")
	public String findStaff(ModelMap model, @RequestParam("namestaff") String namestaff) {
		
		
		List<Staffs> findStaff = staffsDao.findStaffsByName(namestaff);
		model.addAttribute("findStaff", findStaff);
		return "redirect:/QLNhanVien";
	}

	@Autowired
	ServletContext context;

	// Thêm Mới nhân viên
	@RequestMapping(value = "addStaff", method = RequestMethod.POST)
	public String addnewStaff(ModelMap model, @Validated @ModelAttribute("newstaff") Staffs newstaff,
			BindingResult errors, @RequestParam("uploadFile") MultipartFile photo) {
		System.out.println("controller thêm mới");
		try {
			String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
			System.out.println(photoPath);
			photo.transferTo(new File(photoPath));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		// kiểm tra validate
		if (errors.hasErrors()) {
			List<Staffs> list = new ArrayList<Staffs>();
			list = staffsDao.getAll();
			model.addAttribute("listStaffs", list);
			return "admin/QLNhanVien";
		}

		staffsDao.addNew(newstaff);
		return "redirect:/QLNhanVien";
	}

	@RequestMapping(value = "QLNVdelete")
	public String deleteStaff(@RequestParam("id") String id, ModelMap model) {
		Staffs staff = staffsDao.getStafftById(id);
		if (staffsDao.delete(staff)) {
			model.addAttribute("message", "xóa thành công");
		} else {
			model.addAttribute("message", "xóa thất bại, kiểm tra lại");
		}

		return "redirect:/QLNhanVien";
	}

	// Lấy dữ liệu nhân viên đẩy sang trang update
	@RequestMapping(value = "QLNVupdate")
	public String updateST(@RequestParam("id") String id, ModelMap model) {
		Staffs udstaff = staffsDao.getStafftById(id);
		model.addAttribute("udstaff", udstaff);
		return "admin/updateStaff";
	}

	// thực hiện update nhân viên
	@RequestMapping(value = "updateStaff", method = RequestMethod.POST)
	public String updatedStaff(ModelMap model, @Validated @ModelAttribute("udstaff") Staffs udstaff,
			BindingResult errors, @RequestParam("uploadFile") MultipartFile photo) {
		try {
			String photoPath = context.getRealPath("/images/" + photo.getOriginalFilename());
			System.out.println(photoPath);
			photo.transferTo(new File(photoPath));
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (errors.hasErrors()) {

			return "admin/updateStaff";
		} else {
			staffsDao.update(udstaff);

		}

		return "redirect:/QLNhanVien";
	}

	@ModelAttribute("departs")
	public List<Departs> getItem() {
		List<Departs> list = new ArrayList<Departs>();
		list = departsDao.getAll();
		return list;
	}

}
