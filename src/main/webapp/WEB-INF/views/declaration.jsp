<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신고하기</title>
</head>
<body>
    <h1>신고하기</h1>
    <form action="/report/declaration" method="post">
        <input type="hidden" name="parentId" value="${sessionScope.userId}">
        <label for="reportedUserId">신고 대상 사용자 ID:</label>
        <input type="text" name="seniorId" id="reportedUserId" required><br>
        <label for="reportedReason">신고 사유:</label>
        <textarea name="reportedReason" id="reportedReason" required></textarea><br>
        <button type="submit">신고</button>
    </form>
</body>
</html>
