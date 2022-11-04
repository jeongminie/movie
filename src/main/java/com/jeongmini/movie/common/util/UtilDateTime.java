package com.jeongmini.movie.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilDateTime {
	
	public static String dateTimeToString(Date dateTimeParam) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateTimeRt = simpleDateFormat.format(dateTimeParam);
		return dateTimeRt;
	}

}
