package com.jeongmini.movie.modules.movie;

public class MovieVO {
	
	private Integer userSeq;
	
	private Integer seq;
	private Integer openYear;
	private Integer movieCode;
	private String title;
	private String genre;
	private String nation;
	private String runningTime;
	private String age;
	private String openDate;
	private String directors;
	private String actors;
	private String story;
	
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public Integer getOpenYear() {
		return openYear;
	}
	public void setOpenYear(Integer openYear) {
		this.openYear = openYear;
	}
	public Integer getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(Integer movieCode) {
		this.movieCode = movieCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getRunningTime() {
		return runningTime;
	}
	public void setRunningTime(String runningTime) {
		this.runningTime = runningTime;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getDirectors() {
		return directors;
	}
	public void setDirectors(String directors) {
		this.directors = directors;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getStory() {
		return story;
	}
	public void setStory(String story) {
		this.story = story;
	}
	public Integer getUserSeq() {
		return userSeq;
	}
	public void setUserSeq(Integer userSeq) {
		this.userSeq = userSeq;
	}
	
	private Integer totalCountLike;
	public Integer getTotalCountLike() {
		return totalCountLike;
	}
	public void setTotalCountLike(Integer totalCountLike) {
		this.totalCountLike = totalCountLike;
	}

	//박스오피스
	private Integer ranking;
	private String movieNm;
	private String openDt;
	private String audiCnt;
	private String audiAcc;

	public Integer getRanking() {
		return ranking;
	}
	public void setRanking(Integer ranking) {
		this.ranking = ranking;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getOpenDt() {
		return openDt;
	}
	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	public String getAudiCnt() {
		return audiCnt;
	}
	public void setAudiCnt(String audiCnt) {
		this.audiCnt = audiCnt;
	}
	public String getAudiAcc() {
		return audiAcc;
	}
	public void setAudiAcc(String audiAcc) {
		this.audiAcc = audiAcc;
	}
	
	
	

}
