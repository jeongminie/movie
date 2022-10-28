package com.jeongmini.movie.modules.movie;

import org.python.util.PythonInterpreter;
import org.apache.*;
import org.python.modules.*;

public class test {
	
	private static PythonInterpreter interpreter;

	public static void main(String[] args) {
		System.setProperty("python.import.site", "false");
		interpreter = new PythonInterpreter();
		interpreter.exec("import requests");
		interpreter.exec("import sched");
		interpreter.exec("import pymysql");
		interpreter.exec("import telegram");
		interpreter.exec("import datetime as dt");
		interpreter.exec("from apscheduler.schedulers.blocking import BlockingScheduler");
		
		interpreter.execfile("C:\\Users\\ezen\\Desktop\\test.py");

	}

}
