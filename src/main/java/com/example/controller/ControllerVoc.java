package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.service.ServiceInter;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ControllerVoc {
	
	private final ServiceInter sv;
	
	@RequestMapping(value = "vocList")
	public String vocList(Model model) {
		return "VocList";
	}

}
