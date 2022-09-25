package com.example.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Clientcorp;
import com.example.domain.Delcorp;
import com.example.domain.Refund;
import com.example.domain.Voc;

@Repository

public class RepositoryImpl implements RepositoryInter {

	private final EntityManager em;

	@Autowired
	public RepositoryImpl(EntityManager em) {
		this.em = em;
	}

	// Voc 게시판 목록
	public List<Voc> vFindall() {
		List<Voc> list = em.createQuery("SELECT v FROM Voc v").getResultList();
		return list;
	}

	// Refund 목록 (Voc 게시판 목록 - (기사확인여부))
	public List<Refund> rFindall() {
		System.out.println("1");
		List<Refund> chk = em.createQuery("SELECT r FROM Refund r").getResultList();
		System.out.println("2");
		return chk;
	}

	// Voc 게시판 등록
	@Override
	public Voc vSave(Voc voc) {
		em.persist(voc);
		return voc;
	}
	
	// 고객사 정보 
	@Override
	public Clientcorp cFind(int clientno) {
		Clientcorp clientcorp = em.find(Clientcorp.class, clientno);
		return clientcorp;
	}
	
	// 운송사 정보 
	@Override
	public Delcorp dFind(int delno) {
		Delcorp delcorp = em.find(Delcorp.class, delno);
		return delcorp;
	}

	// voc 목록 (배상등록-운송사) 상세보기
	public Voc vView(int clamino) {
		Voc view = em.find(Voc.class, clamino);
		return view;
	}

	// 배상 정보 등록 (운송사, 고객사) 
	@Override
	public Refund rSave(Refund refund) {
		em.persist(refund);
		return refund;		
	}

	// 기사 승인 확인 목록
	@Override
	public Refund rFind(int refno) {
		Refund ref = em.find(Refund.class, refno);
		return ref;
	}

	
}
