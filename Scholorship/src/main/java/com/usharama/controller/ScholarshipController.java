package com.usharama.controller;


import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.usharama.model.Application;
import com.usharama.model.Scholarship;
import com.usharama.model.Student;
import com.usharama.repo.ApplicationRepository;
import com.usharama.repo.ScholarshipRepository;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/scholarships")
public class ScholarshipController {
    @Autowired
    private ScholarshipRepository scholarshipRepository;
    
    @Autowired
    ApplicationRepository applicationRepository;

    @GetMapping
    public String listScholarships(HttpSession session, Model model) {
        // Get the logged-in student from the session
        Student student = (Student) session.getAttribute("student");
        
        // Convert the CGPA to float explicitly
        float studentCgpa = Float.parseFloat(String.valueOf(student.getCgpa()));
        
        // Fetch scholarships that match the student's branch and CGPA criteria
        List<Scholarship> scholarships = scholarshipRepository.findByBranchAndEligibility(student.getBranch(), studentCgpa);
        
        // Add the scholarships to the model
        model.addAttribute("scholarships", scholarships);
        
        // Debugging log for the count of scholarships
        System.out.println("No. scholarships for student branch and CGPA: " + scholarships.size());
        
        // Forward to the scholarships.jsp page
        return "scholarships";
    }
    
    @GetMapping("/all")
    public String listAllScholarships(Model model) {
        // Fetch all scholarships from the repository
        List<Scholarship> scholarships = scholarshipRepository.findAll();

        // Add the scholarships to the model
        model.addAttribute("scholarships", scholarships);

        // Debugging log for the count of scholarships
        System.out.println("Total scholarships: " + scholarships.size());

        // Forward to the scholarships.jsp page
        return "adminscholarships";
    }





    @PostMapping("/apply")
    public String applyForScholarship(@RequestParam Integer scholarshipId, HttpSession session) {
        Student student = (Student) session.getAttribute("student");
        if (student == null) {
            return "redirect:/login";
        }

        Scholarship scholarship = scholarshipRepository.findById(scholarshipId).orElse(null);
        if (scholarship == null) {
            return "redirect:/scholarships";
        }

        Application application = new Application();
        application.setStudent(student);
        application.setScholarship(scholarship);
        application.setStatus("Pending");
        application.setAppliedDate(new Date());

        applicationRepository.save(application);

        return "redirect:/scholarships";
    }
    
    
    
    @GetMapping("/add")
    public String showAddScholarshipPage(HttpSession session,HttpServletRequest request) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/login"; // Redirect to login if not an admin
        }
        return "add-scholarship";
    }

    @PostMapping("/add")
    public String addScholarship(
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam float eligibility,
            @RequestParam String branch,
            @RequestParam String deadline,
            @RequestParam String status,
            HttpSession session,
            Model model
    ) {
    	System.out.println(session.getAttribute("admin"));
    	
        if (! session.getAttribute("admin").equals(true)) {
        	
            return "redirect:/login"; // Redirect to login if not an admin
        }

        Scholarship scholarship = new Scholarship();
        scholarship.setName(name);
        scholarship.setDescription(description);
        scholarship.setEligibility(eligibility);
        scholarship.setBranch(branch);
        scholarship.setDeadline(deadline);
        scholarship.setStatus(status);

        scholarshipRepository.save(scholarship);

        return "redirect:/admin/dashboard";
    }
    @GetMapping("/applied")
    public String viewAppliedScholarships(HttpSession session, Model model) {
        Student student = (Student) session.getAttribute("student");

        // Check if the student is logged in
        if (student == null) {
            return "redirect:/login";
        }

        // Fetch the applications for the logged-in student
        List<Application> applications = applicationRepository.findByStudentId(student.getId());

        // Add scholarship details to the model
        model.addAttribute("applications", applications);
        return "applied-scholarships"; // JSP to display applied scholarships
    }
    
    @PostMapping("/delete")
    public String deleteScholarship(@RequestParam Integer scholarshipId, HttpSession session,Model model) {
        scholarshipRepository.deleteById(scholarshipId);
        System.out.print("hello"+scholarshipId);

        // Redirect back to the scholarships page after deletion
        List<Scholarship> scholarships = scholarshipRepository.findAll();

        // Add the scholarships to the model
        model.addAttribute("scholarships", scholarships);
        return "adminscholarships";
    }
    
    @PostMapping("/edit")
    public String editScholarship(@RequestParam Integer scholarshipId, Model model,HttpSession session) {
        // Fetch the scholarship details by ID
        Scholarship scholarship = scholarshipRepository.findById(scholarshipId).orElse(null);
        session.setAttribute("sid", scholarshipId);

        if (scholarship == null) {
            // If scholarship is not found, redirect to the scholarships list page with an error
            return "redirect:/scholarships?error=not-found";
        }

        // Add the scholarship object to the model to pass it to the edit page
        model.addAttribute("scholarship", scholarship);

        // Return the name of the JSP page (edit-scholarship.jsp) where the form will be displayed
        return "edit-scholarship";  // This corresponds to a JSP file (edit-scholarship.jsp)
    }
    
    @PostMapping("/update")
    public String updateScholarship(@RequestParam Integer scholarshipId,
                                    @RequestParam String name,
                                    @RequestParam String description,
                                    @RequestParam float eligibility,
                                    @RequestParam String branch,
                                    @RequestParam String deadline,
                                    @RequestParam String status,
                                    HttpSession session,
                                    Model model) {

        // Get the student ID from the session
        Integer sid = (Integer) session.getAttribute("sid");

        // If there is no student ID in the session, redirect to login
        if (sid == null) {
            return "redirect:/login";
        }

        // Find the scholarship by ID
        Scholarship scholarship = scholarshipRepository.findById(scholarshipId).orElse(null);

        if (scholarship == null) {
            // If scholarship is not found, return an error page or redirect
            return "redirect:/scholarships/all";
        }

        // Update the scholarship details with the form values
        scholarship.setName(name);
        scholarship.setDescription(description);
        scholarship.setEligibility(eligibility);
        scholarship.setDeadline(deadline); // Convert to Date if needed
        scholarship.setStatus(status);
        scholarship.setBranch(branch);

        // Save the updated scholarship
        scholarshipRepository.save(scholarship);
        
        List<Scholarship> scholarships = scholarshipRepository.findAll();

        // Add the scholarships to the model
        model.addAttribute("scholarships", scholarships);

        // Redirect to the scholarships page or the updated scholarship page
        return "adminscholarships";
    }




}
