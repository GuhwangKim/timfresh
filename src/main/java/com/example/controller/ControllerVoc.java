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
	
	//voc 목록
	@RequestMapping(value = "vocList")
	public String vocList() {
		return "VocList";
	}
	
	// voc 상세 (배상등록)
	@RequestMapping(value = "refPush")
	public String refPush(int claimno, Model model) {
		model.addAttribute("claimno", claimno);
		return "RefPush";
	}
	
	// 배상 목록 
	@RequestMapping(value = "refList")
	public String refList() {
		return "RefList";
	}

}
