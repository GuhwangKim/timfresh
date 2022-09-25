package com.example.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.Clientcorp;
import com.example.domain.Delcorp;
import com.example.domain.Refund;
import com.example.domain.RefundP;
import com.example.domain.Voc;
import com.example.domain.VocP;
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
	public List<VocView> vFindall() {
		List<Voc> list = sv.vFindall();
		// 기사확인여부 (0 확인중, 1 승인, 2 거절, 3 확인필요없음)
		List<Refund> chk = sv.rFindall();

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
	public Voc vView(@PathVariable("claimno") int claimno) {
		Voc voc = sv.vView(claimno);
		return voc;
	}

	
	// voc 목록 (배상등록-운송사) 상세보기
	@GetMapping("/vrboard/{claimno}")
	public VocRview vrView(@PathVariable("claimno") int claimno) {
		Voc voc = sv.vView(claimno);
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
	
	// voc 등록
	@PostMapping("/vboard/vpush")
	public Voc vSave(@RequestBody VocP vocp) {
		// 고객사 정보 불러오기 
		Clientcorp clientcorp = sv.cFind(vocp.getClientno());
		// 운송사 정보 불러오기 
		Delcorp delcorp = sv.dFind(vocp.getDelno());

		Voc voc=new Voc();
		voc.setOrderno(vocp.getOrderno());
		voc.setResp(vocp.getResp());
		voc.setRespcont(vocp.getRespcont());
		voc.setRefyn(vocp.getRefyn());
		voc.setClientcorp(clientcorp);
		voc.setDelcorp(delcorp);
		voc = sv.vSave(voc);
		return voc;
	}
	
	// 배상 정보 등록 (운송사/고객사) 
	@PostMapping("/vboard/rpush")
	public Refund rSave(@RequestBody RefundP refundp) {
		
		// refund 에 집어넣을  voc 객체 가져오기 
		Voc voc = new Voc();
		voc=sv.vView(refundp.getClaimno()); 
		voc.setRefyn(refundp.getRefyn()); //등록완료로 변경 
		
		Refund refsave= new Refund();
		refsave.setVoc(voc);
		refsave.setRefcont(refundp.getRefcont());
		refsave.setRefprice(refundp.getRefprice());
		refsave.setDriverynd(refundp.getDriverynd());
		refsave=sv.rSave(refsave);
		return refsave;
	}
	
	// 배상 정보 목록
	@GetMapping("/rboard")
	public List<Refund> rFindall(){
		List<Refund> rlist=sv.rFindall();
		return rlist;
	}
	
	// 배상 정보 상세 
	@GetMapping("/rboard/{refno}")
	public Refund rFind(@PathVariable("refno") int refno) {
		Refund ref = sv.rFind(refno);
		return ref;
	}
	
	// 기사 승인 확인 목록
	@GetMapping("/gdchk/{refno}")
	public DriverChk dchk(@PathVariable("refno") int refno) {
		Refund ref = sv.rFind(refno);
		DriverChk dchk=new DriverChk(refno, ref.getVoc().getClaimno(), ref.getRefcont(), ref.getRefprice(), ref.getDriverynd());
		return dchk;
	}
	@Data
	@AllArgsConstructor
	class DriverChk {
		private int refno;
		private int claimno;
		private String refcont;
		private int refprice;
		private int driverynd;
	}
	
	
	// 기사 승인 확인 업데이트
	@PutMapping("/pdchk/{refno}")
	public Refund dupdate(@RequestBody Refund refund) {
		Refund ref = sv.rFind(refund.getRefno());
		ref.setDriverynd(refund.getDriverynd());
		ref=sv.rSave(ref);
		return ref;
	}
	
	

}
