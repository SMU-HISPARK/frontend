package com.virtual_idol.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GameController {
	
	@GetMapping("/game")
	public String gamepage_start() {
		
		
		return "gamepage_start";
	}
	
	
	@GetMapping("/game/result")
	public String gamepage_result() {
		
		return "gamepage_result";
	}
}
