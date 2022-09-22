package com.example.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Voc> findall() {
		List<Voc> list = em.createQuery("SELECT v FROM Voc v").getResultList();
		return list;
	}

	// Voc 게시판 목록 - (기사확인여부)
	public List<Refund> chkdynd() {
		System.out.println("1");
		List<Refund> chk = em.createQuery("SELECT r FROM Refund r").getResultList();
		System.out.println("2");
		return chk;
	}

	// 배상 목록 등록 상세보기 resp 가 1일때
	public Voc view(int clamino) {
		Voc view = em.find(Voc.class, clamino);
		return view;
	}

	// 배상 목록 저장 
	@Override
	public Refund save(Refund refund) {
		em.persist(refund);
		return refund;		
	}

}
