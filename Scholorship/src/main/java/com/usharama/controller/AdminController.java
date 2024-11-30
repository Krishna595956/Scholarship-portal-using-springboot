package com.usharama.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.usharama.model.Application;
import com.usharama.repo.ApplicationRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {


	@Autowired
	ApplicationRepository applicationRepository;

	// GET mapping for the admin dashboard
	@GetMapping("/admin/dashboard")
	public String adminDashboard(HttpSession session) {
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login"; // Redirect to login if admin is not logged in
		}
		return "admin-dashboard";
	}

	@GetMapping("/admin/login")
	public String showAdminLoginPage() {
		return "admin-login"; // JSP view for admin login
	}

	@GetMapping("/admin/applications")
	public String viewAllApplications(HttpSession session, Model model) {
		if (session.getAttribute("admin") == null) {
			return "redirect:/admin/login"; // Ensure only admins can access this page
		}

		// Fetch all applications
		List<Application> applications = applicationRepository.findAll();

		// Add application details to the model
		model.addAttribute("applications", applications);
		return "all-applications"; // JSP to display all applications
	}

	@GetMapping("/admin/applications/accept")
	public String acceptApplication(@RequestParam Integer id) {
		Application application = applicationRepository.findById(id).orElse(null);
		if (application != null && application.getStatus().equals(Application.PENDING)) {
			application.setStatus(Application.ACCEPTED);
			applicationRepository.save(application);
		}
		return "redirect:/admin/applications";
	}

	@GetMapping("/admin/applications/reject")
	public String rejectApplication(@RequestParam Integer id) {
		Application application = applicationRepository.findById(id).orElse(null);
		if (application != null && application.getStatus().equals(Application.PENDING)) {
			application.setStatus(Application.REJECTED);
			applicationRepository.save(application);
		}
		return "redirect:/admin/applications";
	}

	// Logout handler
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // Clear the session
		return "redirect:/admin/login"; // Redirect to admin login page
	}

}
