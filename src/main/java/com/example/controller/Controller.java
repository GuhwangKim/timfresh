package com.example.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.Voc;
import com.example.service.ServiceInter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class Controller {

	private final ServiceInter sv;

	// Voc 게시판 목록 
	@GetMapping("/api/vboard")
	public List<Voc> vboard() {
		List<Voc> list = sv.find();
//		List<VocDto> collec = list.stream().map(m -> new VocDto(m.getClaimno())).collect(Collectors.toList());
		return list;
	}
//
//	@Data
//	@AllArgsConstructor
//	class Result<T> {
//		private T data;
//	}
//
//	@Data
//	@AllArgsConstructor
//	class VocDto {
//		private int claimno;
//	}
	
	// 배상 목록 등록 상세보기 resp 가 1일때 
	@PostMapping("/api/rview/{claimno}")
	public RefView rview(@PathVariable("claimno") int claimno ) {
		System.out.println("1");
		Voc view=sv.view(claimno);
		System.out.println("6");
		RefView refView=null;
//		RefView refView=new RefView(claimno, view.getOrderno(), view.getResp(), view.getRespcont(), 
//				view.getDelCorp().getDelno(), view.getDelCorp().getDempname(), view.getDelCorp().getDempphone());
		return refView;
	}

	
	@Data
	@AllArgsConstructor
	class RefView {
		private int claimno;
		private int orderno;
		private int resp;
		private String respcont;
		private int delno;
		private String dempname;
		private int dempphone;
		
	}
}
