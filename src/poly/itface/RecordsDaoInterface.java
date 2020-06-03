package poly.itface;

import java.util.List;

import poly.entity.Records;

public interface RecordsDaoInterface {

	List<Records> getAllRecords();

	boolean addNewRecords(Records record);

	boolean deleteRecordByIdStaffs(String idStaff);

	List<Object[]> getTongTTvaKLOfStaff();

	List<Object[]> getTongTTvaKLOfDepart();

}
