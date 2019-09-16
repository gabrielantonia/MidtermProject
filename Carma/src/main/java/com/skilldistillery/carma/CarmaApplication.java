package com.skilldistillery.carma;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
@EntityScan("com.skilldistillery.carma")
public class CarmaApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(CarmaApplication.class, args);
	}

}
