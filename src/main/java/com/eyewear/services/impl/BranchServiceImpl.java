package com.eyewear.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eyewear.entities.Branch;
import com.eyewear.repositories.BranchRepository;
import com.eyewear.services.BranchService;

@Service
public class BranchServiceImpl implements BranchService{
	@Autowired
	private BranchRepository branchRepository;

	@Override
	public List<Branch> findAll() {
		return branchRepository.findAll();
	}
	
}
