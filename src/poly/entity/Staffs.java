package poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Staffs")
public class Staffs  {
	@Id
	@Column(name="IdStaffs")
	@NotBlank(message = "Không để trống Mã Nhân viên")
	private String idStaffs;
	
	
	@Column(name="NameStaffs")
	@NotBlank(message = "Không để trống tên Nhân viên")
	private String nameStaffs;
	
	@Column(name="Gender")
	private boolean gender;
	
	@Column(name="Birthday")
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date birthday;
	
	@Column(name="Photo")
	@NotBlank(message = "Không để trống ảnh")
	private String photo;
	
	@Column(name="Email")
	@Email(message = "Không đúng định dạng email")
	@NotBlank(message = "Không để trống email")
	private String email;
	
	@Column(name="Phone")
	@NotBlank(message = "Không để trống số ĐT")
	@Pattern(regexp="[0-9]{9,10}",message = "Số DT không hợp lệ")
	private String phone;
	
	@Column(name="Salary")
	@DecimalMin(value = "0",message = "Lương không hợp lệ")
	private double salary;
	
	@Column(name="Notes")
	private String notes;
	
	
	@ManyToOne
	@JoinColumn(name = "IdDeparts")
	private Departs departs;
	
	@OneToMany(mappedBy = "staffs",fetch = FetchType.EAGER)
	private Collection<Records> records;

	public Staffs() {	
	}

	public String getIdStaffs() {
		return idStaffs;
	}

	public void setIdStaffs(String idStaffs) {
		this.idStaffs = idStaffs;
	}

	public String getNameStaffs() {
		return nameStaffs;
	}

	public void setNameStaffs(String nameStaffs) {
		this.nameStaffs = nameStaffs;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Departs getDeparts() {
		return departs;
	}

	public void setDeparts(Departs departs) {
		this.departs = departs;
	}

	public Collection<Records> getRecords() {
		return records;
	}

	public void setRecords(Collection<Records> records) {
		this.records = records;
	}

	
	
	
	
	
}
