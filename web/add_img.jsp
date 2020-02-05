<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="navbar.jsp" %>
    <meta charset="UTF-8">
    <title>Add Image</title>
    <link rel="stylesheet" type="text/css" href="add_img.css">
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<form method="post" action="${pageContext.request.contextPath}/image">
    <div class = "parentContainer">
        <label class="new_event"><b>Upload Image</b></label>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Title</label>
                <input type = "text" name="title">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12" id="upload_container">
                <label class="event-label">Input image URL</label>
                <input type="text" name="link">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Year</label>
                <input type = "text" name="year">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Type</label>
                <input type = "text" name="type">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Width</label>
                <input type = "text" name="width">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Height</label>
                <input type = "text" name="height">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Location</label>
                <input type = "text" name="location">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Description</label>
                <input type = "text" name="description">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Gallery Id</label>
                <input type="number" name="gallery_id" onkeydown="javascript: return event.keyCode == 69 ? false : true">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Artist Id</label>
                <input type="number" name="artist_id" onkeydown="javascript: return event.keyCode == 69 ? false : true">
            </div>
        </div>
        <div class = "row">
            <div class = "col-sm-12">
                <label class="event-label">Detail Id</label>
                <input type="number" name="detail_id" onkeydown="javascript: return event.keyCode == 69 ? false : true">
            </div>
        </div>
        <div class = "submit">
            <div class = "createbtn">
                <input type = "submit" class = "next_button" value="Next" name="add_image">
            </div>
        </div>
    </div>
</form>

</body>
</html>