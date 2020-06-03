package poly.entity;


import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;




@Entity
@Table(name = "Departs")
public class Departs implements Serializable {
	@Id
	@Column(name = "IdDeparts")
	@NotBlank(message = "Không để trống mã phòng ban")
	private String idDeparts;
	
	@Column(name="NameDeparts")
	@NotBlank(message = "Không để trống tên phòng ban")
	private String nameDeparts;
	
	@OneToMany(mappedBy = "departs",fetch = FetchType.EAGER)
	private Collection<Staffs> staffs;

	
	public Departs() {
		
	}

	public String getIdDeparts() {
		return idDeparts;
	}

	public void setIdDeparts(String idDeparts) {
		this.idDeparts = idDeparts;
	}

	public String getNameDeparts() {
		return nameDeparts;
	}

	public void setNameDeparts(String nameDeparts) {
		this.nameDeparts = nameDeparts;
	}

	public Collection<Staffs> getStaffs() {
		return staffs;
	}

	public void setStaffs(Collection<Staffs> staffs) {
		this.staffs = staffs;
	}
	
	
	
	
	
	
	
	
}
