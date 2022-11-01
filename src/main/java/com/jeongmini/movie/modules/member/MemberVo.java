package com.jeongmini.movie.modules.member;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.jeongmini.movie.common.constants.Constants;

public class MemberVo {
	
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	private Integer shDate;
	private String shStartDate;
	private String shEndDate;
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
	private String redirectUrl;
	
	private Integer pseq;
	
	public Integer getShOption() {
		return shOption;
	}
	public void setShOption(Integer shOption) {
		this.shOption = shOption;
	}
	public String getShValue() {
		return shValue;
	}
	public void setShValue(String shValue) {
		this.shValue = shValue;
	}
	public Integer getShDelNy() {
		return shDelNy;
	}
	public void setShDelNy(Integer shDelNy) {
		this.shDelNy = shDelNy;
	}
	public Integer getShDate() {
		return shDate;
	}
	public void setShDate(Integer shDate) {
		this.shDate = shDate;
	}
	public String getShStartDate() {
		return shStartDate;
	}
	public void setShStartDate(String shStartDate) {
		this.shStartDate = shStartDate;
	}
	public String getShEndDate() {
		return shEndDate;
	}
	public void setShEndDate(String shEndDate) {
		this.shEndDate = shEndDate;
	}
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
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEmailFull() {
		return emailFull;
	}
	public void setEmailFull(String emailFull) {
		this.emailFull = emailFull;
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
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}
	public Integer getPseq() {
		return pseq;
	}
	public void setPseq(Integer pseq) {
		this.pseq = pseq;
	}
	
//	paging
	private int thisPage = 1;									// 현재 페이지
	private int rowNumToShow = Constants.ROW_NUM_TO_SHOW;		// 화면에 보여줄 데이터 줄 갯수
	private int pageNumToShow = Constants.PAGE_NUM_TO_SHOW;		// 화면에 보여줄 페이징 번호 갯수

	private int totalRows;										// 전체 데이터 갯수
	private int totalPages;										// 전체 페이지 번호
	private int startPage;										// 시작 페이지 번호
	private int endPage;										// 마지막 페이지 번호
	
	private int startRnumForOracle = 1;							// 쿼리 시작 row
	private int endRnumForOracle;								// 쿼리 끝 row
	private Integer RNUM;

	private int startRnumForMysql = 0;							// 쿼리 시작 row
	
//	public int getStartRnumForMysql() {
//		return (this.thisPage-1)*rowNumToShow;
//	}
	
	public void setParamsPaging(int totalRows) {
		setTotalRows(totalRows);

		if (getTotalRows() == 0) {
			setTotalPages(1);
		} else {
			setTotalPages(getTotalRows() / getRowNumToShow());
			System.out.println(getRowNumToShow());
			System.out.println(getTotalRows());
		}

		if (getTotalRows() % getRowNumToShow() > 0) {
			setTotalPages(getTotalPages() + 1);
		}

		if (getTotalPages() < getThisPage()) {
			setThisPage(getTotalPages());
		}
		
		setStartPage(((getThisPage() - 1) / getPageNumToShow()) * getPageNumToShow() + 1);

		setEndPage(getStartPage() + getPageNumToShow() - 1);

		if (getEndPage() > getTotalPages()) {
			setEndPage(getTotalPages());
		}
		
		setEndRnumForOracle((getRowNumToShow() * getThisPage()));
		setStartRnumForOracle((getEndRnumForOracle() - getRowNumToShow()) + 1);
		if (getStartRnumForOracle() < 1) setStartRnumForOracle(1);
		
		if (thisPage == 1) {
			setStartRnumForMysql(0);
		} else {
			setStartRnumForMysql((getRowNumToShow() * (getThisPage()-1)));
		}
		
		System.out.println("getThisPage():" + getThisPage());
		System.out.println("getTotalRows():" + getTotalRows());
		System.out.println("getRowNumToShow():" + getRowNumToShow());
		System.out.println("getTotalPages():" + getTotalPages());
		System.out.println("getStartPage():" + getStartPage());
		System.out.println("getEndPage():" + getEndPage());		
		System.out.println("getStartRnumForOracle():" + getStartRnumForOracle());
		System.out.println("getEndRnumForOracle():" + getEndRnumForOracle());
		System.out.println("getStartRnumForMysql(): " + getStartRnumForMysql());
		
	}
	
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public int getRowNumToShow() {
		return rowNumToShow;
	}
	public void setRowNumToShow(int rowNumToShow) {
		this.rowNumToShow = rowNumToShow;
	}
	public int getPageNumToShow() {
		return pageNumToShow;
	}
	public void setPageNumToShow(int pageNumToShow) {
		this.pageNumToShow = pageNumToShow;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartRnumForOracle() {
		return startRnumForOracle;
	}
	public void setStartRnumForOracle(int startRnumForOracle) {
		this.startRnumForOracle = startRnumForOracle;
	}
	public int getEndRnumForOracle() {
		return endRnumForOracle;
	}
	public void setEndRnumForOracle(int endRnumForOracle) {
		this.endRnumForOracle = endRnumForOracle;
	}
	public Integer getRNUM() {
		return RNUM;
	}
	public void setRNUM(Integer rNUM) {
		RNUM = rNUM;
	}
	public void setStartRnumForMysql(int startRnumForMysql) {
		this.startRnumForMysql = startRnumForMysql;
	}
	public int getStartRnumForMysql() {
		return startRnumForMysql;
	}
	

}
