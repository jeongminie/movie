package com.jeongmini.movie.modules.codegroup;

import java.util.Date;

public class CodeGroup {
	//DTO
	
	private Integer seq;
	private Integer cgSeq;
	private Integer userSeq;
	private String cgName;
	private String cgNameEng;
	private Integer useNy;
	private Integer delNy;
	private Date createdAt;
	private Date updatedAt;
	private Integer cnt;

	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public Integer getCnt() {
		return cnt;
	}
	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}
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
	public String getCgNameEng() {
		return cgNameEng;
	}
	public void setCgNameEng(String cgNameEng) {
		this.cgNameEng = cgNameEng;
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
