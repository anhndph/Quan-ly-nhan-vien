package poly.itface;

import java.util.List;

import poly.entity.Staffs;

public interface StaffsDaoInterface {

	List<Staffs> getAll();

	List<Object[]> topStaffsExcellent();

	List<Staffs> findStaffsByName(String nameStaff);

	boolean addNew(Staffs staff);

	boolean update(Staffs staff);

	boolean delete(Staffs staff);

	boolean deleteByIdDepart(String idDepart);

	Staffs getStafftById(String id);
}
