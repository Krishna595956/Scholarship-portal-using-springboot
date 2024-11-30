
<html>
<head>
    <title>JSP Example</title>
</head>
<body>
    <h1>${message}</h1>
    <ul>
    
    
        <c:forEach var="num" items="${[1, 2, 3, 4, 5]}">
            <li>${num}</li>
        </c:forEach>
        
    </ul>
</body>
</html>
