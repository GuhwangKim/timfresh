package com.example.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.Voc;

@Repository

public class RepositoryImpl implements RepositoryInter {

	private final EntityManager em;

	@Autowired
	public RepositoryImpl(EntityManager em) {
		this.em = em;
	}

	public List<Voc> find() {
		List<Voc> list = em.createQuery("SELECT v FROM Voc v", Voc.class).getResultList();
		return list;
	}

	public Voc view(int claimno) {
		System.out.println("3");
		Voc view = em.find(Voc.class, claimno);
		System.out.println(view );
		return view;
	}

}
