package com.example.sportsHistry.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.sportsHistry.model.SportsNameEntity;

@Mapper
public interface SportsNameMapper {
	//完全一致検索
	SportsNameEntity selectSportsName(@Param("sportName") String sportName) ;
	//本日のスポーツ用
	SportsNameEntity selectTodaysSports();
}
