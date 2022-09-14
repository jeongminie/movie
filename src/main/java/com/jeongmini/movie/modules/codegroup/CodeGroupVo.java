package com.jeongmini.movie.modules.codegroup;

public class CodeGroupVo {
	
	private Integer shOption;
	private String shValue;
	private Integer shDelNy;
	private Integer shDate;
	private String shStartDate;
	private String shEndDate;
	private Integer seq;
	private Integer cgSeq;
	private Integer total;
	
	public Integer getShOption() {
		return shOption;
	}
	public String getShValue() {
		return shValue;
	}
	public void setShOption(Integer shOption) {
		this.shOption = shOption;
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
	public Integer getCgSeq() {
		return cgSeq;
	}
	public void setCgSeq(Integer cgSeq) {
		this.cgSeq = cgSeq;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}


	//페이징
	private int nowPage;
	private int perPageNum; //한 페이지당 보여지는 게시글 수
	
	public int getPageStart() {
		//       p2-1=1*10개 10행 부터 시작
		return (this.nowPage-1)*perPageNum;
	}
	
	CodeGroupVo() {
		this.nowPage = 1;
		this.perPageNum = 10;
	}

	public int getNowPage() {
		return nowPage;
	}
	
	//페이지가 음수값이 되지 않게 설정. 음수가 되면 1페이지를 나타낸다.
	public void setNowPage(int nowPage) {
		if(nowPage <= 0) {
			this.nowPage = 1;
		} else {
			this.nowPage = nowPage;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	//페이지당 보여줄 게시글 수가 변하지 않게 설정.
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}
	
}
