package com.mailorderpharma.authservice.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**Model class for the business details*/
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "user")
@Table
public class UserData {

//	public String getUserid() {
//		return userid;
//	}
//	public void setUserid(String userid) {
//		this.userid = userid;
//	}
//	public String getUpassword() {
//		return upassword;
//	}
//	public void setUpassword(String upassword) {
//		this.upassword = upassword;
//	}
//	public String getUname() {
//		return uname;
//	}
//	public void setUname(String uname) {
//		this.uname = uname;
//	}
//	public String getAuthToken() {
//		return authToken;
//	}
//	public void setAuthToken(String authToken) {
//		this.authToken = authToken;
//	}
	/**
	 *Id for user 
	 */
	@Id
	@Column(name = "userid", length = 20)
	private String userid;
	/**
	 *Password for user 
	 */
	@Column(name = "upassword", length = 20)
	private String upassword;
	/**
	 *Name for user 
	 */
	@Column(name = "uname", length = 20)
	private String uname;
	/**
	 *Generated authentication token for the user
	 */
	private String authToken;

}
