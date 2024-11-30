package com.usharama.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.usharama.model.Student;
import com.usharama.repo.StudentRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	
	// Hardcoded admin credentials for simplicity
	private static final String ADMIN_EMAIL = "admin@example.com";
	private static final String ADMIN_PASSWORD = "admin123";
	
    @Autowired
    private StudentRepository studentRepository;

    // GET mapping for the login page
    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // JSP view for login
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, HttpServletRequest request) {
        
		if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
			session.setAttribute("admin", true);
			System.out.println(session.getAttribute("admin"));
			return "redirect:/admin/dashboard";
		}
        Student student = studentRepository.findByEmailAndPassword(email, password);
        if (student != null) {
            session.setAttribute("student", student);
            return "redirect:/dashboard";
        }
        request.setAttribute("error", "Invalid email or password. Please try again.");
        return "login";
    }

    
 // GET mapping for the signup page
    @GetMapping("/signup")
    public String showSignupPage() {
        return "signup"; // JSP view for signup
    }

    // POST mapping for processing signup form
    @PostMapping("/signup")
    public String signup(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam(required = false) String academicDetails,
            @RequestParam(required = false) String careerGoals,
            @RequestParam String cgpa,
            @RequestParam String branch,
            Model model
    ) {
        // Check if email already exists
        if (studentRepository.findByEmailAndPassword(email, password) != null) {
            model.addAttribute("error", "Email is already registered. Please login.");
            return "signup";
        }

        // Create new Student object
        Student student = new Student();
        student.setName(name);
        student.setEmail(email);
        student.setPassword(password);
        student.setAcademicDetails(academicDetails);
        student.setCareerGoals(careerGoals);
        student.setCgpa(cgpa);
        student.setBranch(branch);

        // Save to the database
        studentRepository.save(student);

        // Redirect to login page after successful signup
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        if (session.getAttribute("student") == null) {
            return "redirect:/login";
        }
        model.addAttribute("student", session.getAttribute("student"));
        return "dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
    
    @GetMapping("/profile")
    public String getProfile(HttpSession session, Model model) {
        // Retrieve user details from session or database
        Student user = (Student) session.getAttribute("student");

        if (user != null) {
            model.addAttribute("name", user.getName());
            model.addAttribute("email", user.getEmail());
            model.addAttribute("password", user.getPassword());
            model.addAttribute("branch", user.getBranch());
            model.addAttribute("cgpa", user.getCgpa());
            model.addAttribute("academicDetails", user.getAcademicDetails());
            model.addAttribute("careerGoals", user.getCareerGoals());
        }

        return "profile";
    }
    
    @GetMapping("/edit-profile")
    public String editStudentProfile(HttpSession session, Model model) {
        // Fetch the student object from the session
        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            // If no student is logged in, redirect to the login page
            return "redirect:/login";
        }

        // Add student details to the model to prepopulate the form
        model.addAttribute("name", student.getName());
        model.addAttribute("email", student.getEmail());
        model.addAttribute("password", student.getPassword());
        model.addAttribute("branch", student.getBranch());
        model.addAttribute("cgpa", student.getCgpa());
        model.addAttribute("academicDetails", student.getAcademicDetails());
        model.addAttribute("careerGoals", student.getCareerGoals());

        // Forward to edit-student.jsp
        return "edit-student";
    }
    
    @PostMapping("/update-profile")
    public String updateProfile(HttpSession session, @ModelAttribute Student updatedStudent) {
        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            return "redirect:/login";
        }

        // Update the student details
        student.setName(updatedStudent.getName());
        student.setEmail(updatedStudent.getEmail());
        student.setPassword(updatedStudent.getPassword());
        student.setBranch(updatedStudent.getBranch());
        student.setCgpa(updatedStudent.getCgpa());
        student.setAcademicDetails(updatedStudent.getAcademicDetails());
        student.setCareerGoals(updatedStudent.getCareerGoals());

        // Save the updated student (assuming you have a StudentRepository or similar)
        studentRepository.save(student);

        // Update the session object
        session.setAttribute("student", student);

        return "redirect:/profile";
    }


    
    
}
