package com.usharama.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.usharama.model.Scholarship;

public interface ScholarshipRepository extends JpaRepository<Scholarship, Integer> {

	List<Scholarship> findByBranchAndEligibility(String branch, Float cgpa);
}

