package com.example.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.Refund;
import com.example.domain.Voc;
import com.example.service.ServiceInter;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class RestControllerV {

	private final ServiceInter sv;

	// voc 목록 보기
	@GetMapping("/vboard")
	public List<VocView> rview() {
		List<Voc> list = sv.findall();
		// 기사확인여부 (0 확인중, 1 승인, 2 거절, 3 확인필요없음)
		List<Refund> chk = sv.chkdynd();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getRefyn() == 12) {
				for (int j = 0; j < chk.size(); j++) {
					if (list.get(i).getClaimno() == chk.get(j).getVoc().getClaimno()) {
						list.get(i).setDriverynd(chk.get(j).getDriverynd());
					}
				}
			} else {
				list.get(i).setDriverynd(3);
			}
		}
		List<VocView> result = list.stream()
				.map(m -> new VocView(m.getClaimno(), m.getResp(), m.getRespcont(), m.getRefyn(), m.getDriverynd()))
				.collect(Collectors.toList());

		return result;
	}

	
	// voc 목록 보기 (객체)
	@Data
	@AllArgsConstructor
	class VocView {
		private int claimno;
		private int resp;
		private String respcont;
		private int refyn;
		private int driverynd;
	}

	
	// voc 목록 (일반) 상세보기
	@GetMapping("/vboard/{claimno}")
	public Voc vboard(@PathVariable("claimno") int claimno) {
		Voc voc = sv.view(claimno);
		return voc;
	}
	
	// voc 목록 (배송등록) 상세보기
	@GetMapping("/vrboard/{claimno}")
	public VocRview vrboard(@PathVariable("claimno") int claimno) {
		Voc voc = sv.view(claimno);
		VocRview vocRview=new VocRview(claimno, voc.getDelcorp().getDelname(),  voc.getDelcorp().getDempname(),  voc.getDelcorp().getDempphone());
		return vocRview;
	}
	
	@Data
	@AllArgsConstructor
	class VocRview {
		private int claimno;
		private String delname;
		private String dempname;
		private int dempphone;
	}
	
	// 배상 정보 등록 (귀책당사자 2-운송사/배상요청여부 1 (등록전) -> 2 로 변경) 
	@PostMapping("/vboard/rpush")
	public Refund rpush(@RequestBody Refund refund, @RequestBody int claimno, int refyn) {
		Refund refsave=sv.save(refund, claimno, refyn);
		return refsave;
	}
	
	// 배상 정보 목록
	@GetMapping("/rboard")
	public List<Refund> rboard(){
		List<Refund> rlist=sv.chkdynd();
		return rlist;
	}
	
	// voc 등록

}
