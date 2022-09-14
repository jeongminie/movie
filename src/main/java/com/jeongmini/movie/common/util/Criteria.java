package com.jeongmini.movie.common.util;

public class Criteria {
	
	private int nowPage;
	private int perPageNum; //한 페이지당 보여지는 게시글 수
	
	public int getPageStart() {
		//       p2-1=1*10개 10행 부터 시작
		return (this.nowPage-1)*perPageNum;
	}
	
	Criteria() {
		this.nowPage = 1;
		this.perPageNum = 10;
	}

	public int getnowPage() {
		return nowPage;
	}
	
	//페이지가 음수값이 되지 않게 설정. 음수가 되면 1페이지를 나타낸다.
	public void setnowPage(int nowPage) {
		if(nowPage <= 0) {
			this.nowPage = 1;
		} else {
			this.nowPage = nowPage;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}
	
	//페이지당 보여줄 게시글 수가 변하지 않게 설정했다.
	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		} else {
			this.perPageNum = pageCount;
		}
	}

}
