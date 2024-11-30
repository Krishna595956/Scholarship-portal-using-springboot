<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<div class="container mt-5">
    <h2 class="text-center mb-4">Available Scholarships</h2>
    <table class="table table-bordered table-striped table-responsive">
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Eligibility</th>
                <th>Deadline</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${scholarships}" var="scholarship">
                <tr>
                    <td>${scholarship.name}</td>
                    <td>${scholarship.description}</td>
                    <td>${scholarship.eligibility}</td>
                    <td>${scholarship.deadline}</td>
                    <td>
                        <form action="/scholarships/apply" method="post">
                            <input type="hidden" name="scholarshipId" value="${scholarship.id}">
                            <button type="submit" class="btn btn-primary">Apply</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS (optional for interactivity) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
