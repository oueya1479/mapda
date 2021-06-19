package kosta.mapda;


import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.view.BeanNameViewResolver;

@Configuration
public class AppConfig {
	/**
	 * 업로드 bean
	 */
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		return new CommonsMultipartResolver();
	}
	
	/**
	 * 다운로드 ViewResolver bean
	 */
	@Bean
	public BeanNameViewResolver beanNameViewResolver() {
		BeanNameViewResolver beanNameView = new BeanNameViewResolver();
		beanNameView.setOrder(1);
		return beanNameView;
	}
	
	/**
	 * 		Error 페이지
	 * */
	@Bean
	public SimpleMappingExceptionResolver exceptionResolver() {
		SimpleMappingExceptionResolver smer = new SimpleMappingExceptionResolver();
		Properties pro = new Properties();
		pro.put("Exception", "error/errorView");
		smer.setExceptionMappings(pro);
		
		return smer;
	}
	
}
