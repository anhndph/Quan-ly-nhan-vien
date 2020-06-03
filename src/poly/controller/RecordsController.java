package poly.controller;

import java.util.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import poly.dao.*;
import poly.entity.*;

@Controller
public class RecordsController {

	@Autowired
	RecordsDao recordsDao;
	@Autowired
	DepartsDao departDao;
	@Autowired
	StaffsDao staffDao;

	@Autowired
	Mailer mailer;

	@RequestMapping(value = "addnewRecords", method = RequestMethod.POST)
	public String addnewRecords(ModelMap model, @ModelAttribute("newRecord") Records record)
			throws MessagingException, javax.mail.MessagingException {
		Date date = new Date();
		record.setDate(date);
		if (record.getStaffs().getIdStaffs().equals("") || record.getReason().equals("")) {
			model.addAttribute("message", "Điền đầy đủ thông tin");
			return "admin/TTvaKL";
		}
		if (recordsDao.addNewRecords(record)) {
			String content = record.getReason();
			try {
				String email = staffDao.getStafftById(record.getStaffs().getIdStaffs()).getEmail();
				if (record.isType()) {
					mailer.send("ducanhn2206@gmail.com", email, "Thành tích", "Bạn ghi nhận thành tích: " + content);
				} else {
					mailer.send("ducanhn2206@gmail.com", email, "Kỉ Luật", "Bạn ghi nhận kỉ luật: " + content);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			model.addAttribute("message", "Thêm Thành công");
		}

		List<Records> list = recordsDao.getAllRecords();
		model.addAttribute("newRecord", new Records());
		model.addAttribute("listRecords", list);
		return "admin/TTvaKL";
	}

	@RequestMapping(value = "TTvaKL")
	public String TTvaKL(ModelMap model) {
		List<Records> list = recordsDao.getAllRecords();
		model.addAttribute("newRecord", new Records());
		model.addAttribute("listRecords", list);
		return "admin/TTvaKL";
	}

	@RequestMapping(value = "tonghopTTvaKL")
	public String TongHopTTvaKL(ModelMap model) {
		List<Object[]> listTTKLStaff = recordsDao.getTongTTvaKLOfStaff();

		List<Object[]> listTTKLDepart = recordsDao.getTongTTvaKLOfDepart();

		model.addAttribute("THTTvaKLstaffs", listTTKLStaff);
		model.addAttribute("THTTvaKLdeparts", listTTKLDepart);

		return "admin/TonghopTTvaKL";
	}

}
