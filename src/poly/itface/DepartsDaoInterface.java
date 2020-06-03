package poly.itface;

import java.util.List;

import poly.dao.*;
import poly.entity.Departs;

public interface DepartsDaoInterface {
	List<Departs> getAll();

	boolean addNew(Departs departs);

	Departs getDepartById(String id);

	boolean update(Departs depart);

	boolean delete(Departs depart);

}
