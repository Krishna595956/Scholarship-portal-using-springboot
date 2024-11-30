package com.usharama.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.usharama.model.Student;

public interface StudentRepository extends JpaRepository<Student, Integer> {
    Student findByEmailAndPassword(String email, String password);
}

