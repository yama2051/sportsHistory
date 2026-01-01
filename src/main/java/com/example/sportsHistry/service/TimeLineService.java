package com.example.sportsHistry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sportsHistry.model.PageUrlEntity;
import com.example.sportsHistry.model.TimeLineEvent;
import com.example.sportsHistry.repository.PageUrlMapper;
import com.example.sportsHistry.repository.TimeLineMapper;

@Service
public class TimeLineService {
	@Autowired
	private TimeLineMapper timeLineMapper;
	@Autowired
	private PageUrlMapper pageUrlMapper;
	
	public List<TimeLineEvent> getEvents(String country, Integer startYear, Integer endYear) {
	    return timeLineMapper.selectTimeLine(country, startYear, endYear);
	}
	
	//国の取得
    public List<TimeLineEvent> getByCountry(String country) {
        return timeLineMapper.findByCountry(country);
    }
    
    //国と競技の取得
    public List<TimeLineEvent> getByCountryAndSports(String country, String sports) {
        return timeLineMapper.findByCountryAndSports(country, sports);
    }
    
    //スポーツの取得
    public String getBySports(String sports) {
    	
    	String timeLineDto ;
    	timeLineDto = timeLineMapper.findBySports(sports);
    	
        return timeLineDto;
    }
    
    //参考ページの取得
    public List<PageUrlEntity> getReferencePage(String sportsCode,String country) {
    	List<PageUrlEntity> pageUrlDto;
    	pageUrlDto = pageUrlMapper.findUrlPage(sportsCode,country);
		return pageUrlDto;
    	
    	
    }
    
    //カテゴリ抽出
    public List<PageUrlEntity> getFindCategory(String sportsCode){
    	List<PageUrlEntity> pageUrlDto;
    	pageUrlDto = pageUrlMapper.findCategory(sportsCode);
    	return pageUrlDto;
    }
    
}
