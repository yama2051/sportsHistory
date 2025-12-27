package com.example.sportsHistry.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sportsHistry.model.SportsNameDTO;
import com.example.sportsHistry.model.SportsNameEntity;
import com.example.sportsHistry.repository.SportsNameMapper;

@Service
public class SportsNameService {

	@Autowired
	private SportsNameMapper sportsNameMapper;

	//検索ボックス
	public SportsNameDTO findSportsUrl(String sportName) {
		SportsNameEntity sportsName = sportsNameMapper.selectSportsName(sportName);

		if (sportsName != null) {
			SportsNameDTO sportsDto = new SportsNameDTO();
			sportsDto.setId(sportsName.getId());
			sportsDto.setName(sportsName.getName());
			sportsDto.setPathUrl(sportsName.getPathUrl());
			return sportsDto;
		} else {
			return null;
		}
	}
	
    //注目スポーツ
	public SportsNameDTO todaysSports() {
		SportsNameEntity sportsName = sportsNameMapper.selectTodaysSports();

		if (sportsName != null) {
			SportsNameDTO sportsDto = new SportsNameDTO();
			sportsDto.setId(sportsName.getId());
			sportsDto.setName(sportsName.getName());
			sportsDto.setPathUrl("/detail/baseball");
			sportsDto.setHighlight(sportsName.isHighlight());
			sportsDto.setComment(sportsName.getComment());
			return sportsDto;
		} else {
			return null;
		}
	}
}