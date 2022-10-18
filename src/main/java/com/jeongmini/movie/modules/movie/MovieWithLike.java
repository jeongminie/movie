package com.jeongmini.movie.modules.movie;

import java.util.List;

public class MovieWithLike {
	private Movie movie;
	private Integer totalCountLike;
	private boolean existSympathy;
	
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	public Integer getTotalCountLike() {
		return totalCountLike;
	}
	public void setTotalCountLike(Integer totalCountLike) {
		this.totalCountLike = totalCountLike;
	}
	public boolean isExistSympathy() {
		return existSympathy;
	}
	public void setExistSympathy(boolean existSympathy) {
		this.existSympathy = existSympathy;
	}


	

}
