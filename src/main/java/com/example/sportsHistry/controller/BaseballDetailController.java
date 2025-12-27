package com.example.sportsHistry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sportsHistry.model.TimeLineEvent;
import com.example.sportsHistry.service.TimeLineService;

@Controller
public class BaseballDetailController {
	@Autowired
	private TimeLineService timeLineService;
	
	@GetMapping("/timeLine")
	public String showTimeLine(@RequestParam String country, Model model) {
        List<TimeLineEvent> list = timeLineService.getByCountry(country);
        model.addAttribute("events", list);
        model.addAttribute("country", country);
        return "baseballDetail";  // baseballDetail.jspを返す想定
	}
}
