package com.example.sportsHistry;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.sportsHistry.repository")
public class SportHistoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(SportHistoryApplication.class, args);
	}

}
