<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="navbar.jsp" %>
    <meta charset="UTF-8">
    <title>Page 1</title>
    <link rel="stylesheet" type="text/css" href="create_artist.css">
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<form method="post" action="${pageContext.request.contextPath}/create">
    <div class = "parentContainer">
        <label class="new_event"><b>Upload Data for Gallery</b></label>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Title</label>
                <input type = "text" name="title">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Description</label>
                <input type = "text" name="description">
            </div>
        </div>
        <div class = "submit">
            <div class = "createbtn">
                <input type = "submit" class = "next_button" value="Next" name="create_gallery">
            </div>
        </div>
    </div>
</form>

</body>
</html>