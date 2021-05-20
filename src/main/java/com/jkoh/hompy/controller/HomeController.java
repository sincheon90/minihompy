package com.jkoh.hompy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/")
public class HomeController {
	@RequestMapping
	public String welcome(Model model, RedirectAttributes redAttrs) {
		String greeting = "환영합니다!";
		String tagline = "세상에서 하나 뿐인";
		
		model.addAttribute("greeting", greeting);
		model.addAttribute("tagline", tagline);
		redAttrs.addFlashAttribute("greeting", greeting);
		redAttrs.addFlashAttribute("tagline", tagline);
		return "welcome";
	}
}
