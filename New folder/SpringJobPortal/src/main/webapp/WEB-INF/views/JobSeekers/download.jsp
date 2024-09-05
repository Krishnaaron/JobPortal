<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Download Resume</title>
</head>
<body>
    <h2>Download Resume</h2>
    <form action="${pageContext.request.contextPath}/ResumeDownload" method="get">
        <label for="email">Email:</label>
          <input type="hidden" name="email" value="${seeker.email}">
        <button type="submit" class="btn btn-primary">DownloadResume</button>
    </form>
</body>
</html>
