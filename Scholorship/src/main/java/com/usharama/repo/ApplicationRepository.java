package com.usharama.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.usharama.model.Application;

public interface ApplicationRepository extends JpaRepository<Application, Integer> {
    List<Application> findByStudentId(Integer studentId);
    List<Application> findByScholarshipId(Integer scholarshipId);
}

