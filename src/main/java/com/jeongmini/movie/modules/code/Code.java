package com.jeongmini.movie.modules.code;

import java.util.Date;

public class Code {
	//DTO
	
	private Integer seq;
	private Integer cgSeq;
	private String cgName;
	private Integer ccAnother;
	private String ccName;
	private String ccNameEng;
	private Integer useNy;
	private Integer delNy;
	private Date createdAt;
	private Date updatedAt;
	
	

	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public Integer getCgSeq() {
		return cgSeq;
	}
	public void setCgSeq(Integer cgSeq) {
		this.cgSeq = cgSeq;
	}
	public String getCgName() {
		return cgName;
	}
	public void setCgName(String cgName) {
		this.cgName = cgName;
	}
	public Integer getCcAnother() {
		return ccAnother;
	}
	public void setCcAnother(Integer ccAnother) {
		this.ccAnother = ccAnother;
	}
	public String getCcName() {
		return ccName;
	}
	public void setCcName(String ccName) {
		this.ccName = ccName;
	}
	public String getCcNameEng() {
		return ccNameEng;
	}
	public void setCcNameEng(String ccNameEng) {
		this.ccNameEng = ccNameEng;
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
