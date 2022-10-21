package com.jeongmini.movie.common.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("resources/**")
		.addResourceLocations("file:///D:\\factory\\ws_sts_4151\\movie\\src\\main\\webapp\\resources\\uploaded\\member/*");
	}

}
