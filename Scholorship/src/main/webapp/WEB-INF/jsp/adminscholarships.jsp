<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"
    import="com.usharama.model.Scholarship, java.util.ArrayList" %>

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
                    <th>Action</th>
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
                        <td>
                            <form action="/scholarships/edit" method="post" class="d-inline">
                                <input type="hidden" name="scholarshipId" value="<%= scholarship.getId() %>">
                                <button type="submit" class="btn btn-warning">Edit</button>
                            </form>
                            <form action="/scholarships/delete" method="post" class="d-inline">
                                <input type="hidden" name="scholarshipId" value="<%= scholarship.getId() %>">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this scholarship?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>

        <!-- Back link -->
        <br><br>
        <a href="/admin/dashboard" class="btn btn-secondary">Back to Dashboard</a>
    </div>

    <!-- Bootstrap JS (optional for interactivity) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
