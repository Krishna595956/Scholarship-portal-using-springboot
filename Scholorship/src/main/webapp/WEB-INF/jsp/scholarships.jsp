<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"
    import="com.usharama.model.Scholarship, java.util.ArrayList, com.usharama.model.Student" %>

<html lang="en">
<head>
    <title>Available Scholarships</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Available Scholarships</h1>
        
        <!-- Table for displaying scholarships -->
        <table class="table table-bordered table-striped table-responsive">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Eligibility</th>
					<th>Branch</th>
                    <th>Deadline</th>
                    <th>Status</th>
                    <% 
                        Student student = (Student) session.getAttribute("student");
                        Boolean isAdmin = (Boolean) session.getAttribute("admin");
                        if (student != null || (isAdmin != null && isAdmin)) { 
                    %>
                        <th>Action</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <% 
                    ArrayList<Scholarship> scholarships = (ArrayList<Scholarship>) request.getAttribute("scholarships");
                    for(Scholarship scholarship : scholarships) {
                %>
                    <tr>
                        <td><%= scholarship.getName() %></td>
                        <td><%= scholarship.getDescription() %></td>
                        <td><%= scholarship.getEligibility() %></td>
						<td><%= scholarship.getBranch() %></td>
                        <td><%= scholarship.getDeadline() %></td>
                        <td><%= scholarship.getStatus() %></td>
                        <% 
                            if (student != null) { 
                        %>
                            <td>
                                <form action="/scholarships/apply" method="post" class="d-inline">
                                    <input type="hidden" name="scholarshipId" value="<%= scholarship.getId() %>">
                                    <button type="submit" class="btn btn-primary">Apply</button>
                                </form>
                            </td>
                        <% } else if (isAdmin != null && isAdmin) { %>
                            <td>
                                <form action="/scholarships/edit" method="post" class="d-inline">
                                    <input type="hidden" name="scholarshipId" value="<%= scholarship.getId() %>">
                                    <button type="submit" class="btn btn-warning">Edit</button>
                                </form>
                                <form action="/scholarshipdelete" method="post" class="d-inline">
                                    <input type="hidden" name="scholarshipId" value="<%= scholarship.getId() %>">
                                    <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this scholarship?')">Delete</button>
                                </form>
                            </td>
                        <% } %>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Back link for admins if no student is logged in -->
        <% if (student == null) { %>
            <br><br>
            <a href="/admin/dashboard" class="btn btn-secondary">Back to Admin Dashboard</a>
        <% } %>
    </div>

    <!-- Bootstrap JS (optional for interactivity) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
