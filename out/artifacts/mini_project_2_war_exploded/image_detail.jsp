<%--
  Created by IntelliJ IDEA.
  User: Jed
  Date: 10/16/2018
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="navbar.jsp" %>
    <meta charset="UTF-8">
    <title>Gallery Detail</title>
    <link rel="stylesheet" type="text/css" href="image_detail.css">
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/image">
    <div class = "parentContainer">
        <div class = "row">
            <div class = "col-sm-12">
                <ul id = "title">
                    <img src="<%=request.getParameter("link")%>" alt="" width="300" height="300">
                    <li class="information"><b>Title: </b><input type = "text" name="title" value="<%=request.getParameter("title")%>"></li>
                    <li class="information"><b>Year: </b><input type = "text" name="year" value="<%=request.getParameter("year")%>"></li>
                    <li class="information"><b>Artist ID: </b><input type = "text" name="artist_id" value="<%=request.getParameter("artist_id")%>"></li>
                    <li class="information"><b>Description: </b><input type = "text" name="description" value="<%=request.getParameter("description")%>"></li>
                </ul>
            </div>
            <div class = "submit">
                <div class = "createbtn">
                    <input type = "submit" class = "edit_button" value="Edit" name="edit_image">
                </div>
            </div>
            <div class = "submit">
                <div class = "createbtn">
                    <input type = "submit" class = "delete_button" value="Delete" name="delete_image">
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>

