package com.jeongmini.movie.modules.codegroup;

import java.util.Date;

public class CodeGroup {
	//DTO
	
	private Integer cgSeq;
	private Integer userSeq;
	private String cgName;
	private String chNameEng;
	private Integer useNy;
	private Integer delNy;
	private Date createdAt;
	private Date updatedAt;
	
	public Integer getCgSeq() {
		return cgSeq;
	}
	public void setCgSeq(Integer cgSeq) {
		this.cgSeq = cgSeq;
	}
	public Integer getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(Integer userSeq) {
		this.userSeq = userSeq;
	}
	public String getCgName() {
		return cgName;
	}
	public void setCgName(String cgName) {
		this.cgName = cgName;
	}
	public String getChNameEng() {
		return chNameEng;
	}
	public void setChNameEng(String chNameEng) {
		this.chNameEng = chNameEng;
	}
	public Integer getUseNy() {
		return useNy;
	}
	public void setUseNy(Integer useNy) {
		this.useNy = useNy;
	}
	public Integer getDelNy() {
		return delNy;
	}
	public void setDelNy(Integer delNy) {
		this.delNy = delNy;
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

}
