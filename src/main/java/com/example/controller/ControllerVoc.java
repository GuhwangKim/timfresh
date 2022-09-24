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
	
	//voc 상세보기 
	@RequestMapping(value = "vocView")
	public String vocView() {
		return "VocView";
	}
	
	//voc 등록 
	@RequestMapping(value = "vocSave")
	public String vocwrite() {
		return "VocSave";
	}
	
	// voc 상세 (배상등록-운송사)
	@RequestMapping(value = "refSaveD")
	public String refPushD(int claimno, Model model) {
		model.addAttribute("claimno", claimno);
		return "RefSaveD";
	}
	
	// 배상 정보 등록 (고객사) 
	@RequestMapping(value = "refSaveC")
	public String refPushC() {
		return "RefSaveC";
	}
	
	// 배상 목록 
	@RequestMapping(value = "refList")
	public String refList() {
		return "RefList";
	}
	
	// 배상 상세보기 
	@RequestMapping(value = "refView")
	public String refView() {
		return "RefView";
	}
	
	// 기사 승인 확인 
	@RequestMapping(value = "driverChk")
	public String driverChk(int claimno, Model model) {
		model.addAttribute("claimno", claimno);
		return "DriverChk";
	}
	
	

}
