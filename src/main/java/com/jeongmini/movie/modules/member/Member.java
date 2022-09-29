package com.jeongmini.movie.modules.member;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Member {
	
	private Integer seq;
	private String loginId;
	private String password;
	private String phone;
	private String name;
	private Integer gender;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date birth;
	private String emailFull;
	private Integer marketingAgree;
	private Date createdAt;
	private Date updatedAt;
	private String email;
	private String domain;
	private Integer postcode;
	private String address;
	private String detailAddress;
	private Integer adminNy; 
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Integer getMarketingAgree() {
		return marketingAgree;
	}
	public void setMarketingAgree(Integer marketingAgree) {
		this.marketingAgree = marketingAgree;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getEmailFull() {
		return emailFull;
	}
	public void setEmailFull(String emailFull) {
		this.emailFull = emailFull;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public Integer getPostcode() {
		return postcode;
	}
	public void setPostcode(Integer postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public Integer getAdminNy() {
		return adminNy;
	}
	public void setAdminNy(Integer adminNy) {
		this.adminNy = adminNy;
	}
	
}
