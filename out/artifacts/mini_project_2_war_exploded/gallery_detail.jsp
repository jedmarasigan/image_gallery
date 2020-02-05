<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="navbar.jsp" %>
    <meta charset="UTF-8">
    <title>Gallery Detail</title>
    <link rel="stylesheet" type="text/css" href="gallery_detail.css">
</head>
<body>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>


<form method="post" action="${pageContext.request.contextPath}/gallery">
    <div class="galleryInfo_container">
        <form id="galleryInfo_box">
            <div id="galleryInfo">
                <label class="event-label">Gallery ID: <%=request.getParameter("gallery_id")%></label>
                <br>
                <label class="event-label">Title: </label>
                <input type = "text" name="title" value="<%=request.getParameter("title")%>">
                <label class="event-label">Description: </label>
                <input type = "text" name="description" id="description" value="<%=request.getParameter("description")%>">
                <input type = "submit" class = "edit_button" value="Edit" name="edit_gallery">
            </div>
        </form>
    </div>
</form>
    <div class="image_list_container">
        <div class = "row">
            <div class = "col-sm-12">
                <%
                    String title = request.getParameter("title");
                    String year = request.getParameter("year");
                    String description = request.getParameter("description");
                    String gallery_id = request.getParameter("gallery_id");
                    String artist_id = request.getParameter("artist_id");

                    try {
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                    }
                    catch(Exception e) {
                        out.println("can't load mysql driver");
                        out.println(e.toString());
                    }

                    String url="jdbc:mysql://127.0.0.1:3306/gallery";
                    String id="gallery";
                    String pwd="eecs118";
                    Connection con = DriverManager.getConnection(url,id,pwd);

                    Statement stmt = con.createStatement();
                    String query = "SELECT * FROM image where gallery_id = " + gallery_id;
                    try(ResultSet rs=stmt.executeQuery(query)){
                        Statement stmt2 = con.createStatement();
                        while (rs.next()) {
                            String query2 = "SELECT * FROM detail where image_id = " + rs.getString("image_id");
                            try(ResultSet rs2=stmt2.executeQuery(query2)){
                                while (rs2.next()) {
                                    out.println("<tr>");
                                    out.println("<img src='"+rs.getString("link")+ "' width='30' height='30'>");
                                    out.println("<a href='image_detail.jsp?title="+rs.getString("title")+"&link="+rs.getString("link")+"&year="+rs2.getString("year")+"&artist_id="+rs.getString("artist_id")+"&description="+rs2.getString("description")+"'>"+rs.getString("title")+"</a>");
                                    out.println("<td>"+rs.getString("link")+"</td>");
                                    out.println("<td>"+rs.getString("artist_id")+"</td>");
                                    out.println("<td>"+rs.getString("detail_id")+"</td>");
                                    out.print("<br>");
                                    out.println("</tr>");
                                };
                            }
                        }
                    }
                %>
            </div>
        </div>
    </div>


</body>
</html>
