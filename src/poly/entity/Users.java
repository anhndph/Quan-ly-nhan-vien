package poly.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class Users implements Serializable {

	/**
	 * 
	 */
	private String username;
	private String password;
	private String fullname;

	public Users() {
	}

	public Users(String username, String password, String fullname) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
	}

	@Id
	@Column(name = "Username", unique = true, nullable = false)
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "Password", nullable = false)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "Fullname", nullable = false)
	public String getFullname() {
		return this.fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

}
