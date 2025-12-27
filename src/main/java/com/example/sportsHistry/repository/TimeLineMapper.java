package com.example.sportsHistry.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.sportsHistry.model.TimeLineEvent;

@Mapper
public interface TimeLineMapper {
	List<TimeLineEvent> selectTimeLine(@Param("country") String country,
            @Param("startYear") Integer startYear,
            @Param("endYear") Integer endYear);
	
	 List<TimeLineEvent> findByCountry(@Param("country") String country);
	 
	 List<TimeLineEvent> findByCountryAndSports(String country, String sports);

	 String findBySports(String sports);
}
