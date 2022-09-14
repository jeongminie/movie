package com.jeongmini.movie.common.util;

import com.jeongmini.movie.modules.codegroup.CodeGroupVo;

public class PageMaker {
	
	private CodeGroupVo codeGroupVo;
	//총 개시글 수
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 5; 
	
	public CodeGroupVo getCodeGroupVo() {
		return codeGroupVo;
	}
	
	public void setCodeGroupVo(CodeGroupVo codeGroupVo) {
		this.codeGroupVo = codeGroupVo;
	}
	public int getTatalCount() {
		return totalCount;
	}
	
	//총 개시글 수
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calc();
	}
	
	//페이징의 버튼들을 생성하는 계산식. 끝 페이지 번호, 시작 페이지 번호, 이전, 다음 버튼들을 구한다.
	public void calc() {
		endPage = (int) (Math.ceil(codeGroupVo.getNowPage() / (double) displayPageNum) * displayPageNum);
		
		startPage = (endPage - displayPageNum) +1;
		if(startPage <= 0 ) startPage = 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double) codeGroupVo.getPerPageNum()));
		if(endPage > tempEndPage) endPage = tempEndPage;
		
		prev = startPage == 1 ? false : true;
		next = endPage * codeGroupVo.getPerPageNum() < totalCount ? true : false;
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
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

}
