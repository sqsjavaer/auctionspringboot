package com.baizhi.ssm.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

public class DateConserver implements Converter<String, Date> {

	@Override
	public Date convert(String arg0) {
		SimpleDateFormat   sdf = new SimpleDateFormat("yyyy-MM-dd");
		 		
		try {
			Date date = sdf.parse(arg0);
			return date;
		} catch (ParseException e) {	
			e.printStackTrace();
		}
		return null;
	}

}
