<HTML>
<HEAD>
    <%@ include file="navbar.jsp" %>
    <meta charset="utf-8">
    <link rel='stylesheet' href='artist.css' />
    <TITLE>Artist</TITLE>
</HEAD>
<BODY>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>

<%

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
    String sql= "SELECT * FROM artist";
    ResultSet rs=stmt.executeQuery(sql);

    while (rs.next()) {
        String name = rs.getString("name");
        String birth_year = rs.getString("birth_year");
        String country = rs.getString("country");
        String description = rs.getString("description");
        out.println("<tr>");
        out.println("<td>"+rs.getString("artist_id")+"</td>");
        out.println("<a href='artist_bio.jsp?name="+name+"&birth_year="+birth_year+"&country="+country+"&description="+description+"' class='gallery_name' style='color:#00cc99;'>"+rs.getString("name")+"</a>");
        out.println("<td>"+rs.getString("birth_year")+"</td>");
        out.println("<td>"+rs.getString("country")+"</td>");
        out.println("<td>"+rs.getString("description")+"</td>");
        out.println("<br>");
        out.println("</tr>");

    };

%>
</BODY>
</HTML>