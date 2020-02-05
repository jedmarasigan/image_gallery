<HTML>
<HEAD>
    <%@ include file="navbar.jsp" %>
    <meta charset="utf-8">
    <link rel='stylesheet' href='gallery.css'>
    <TITLE>Gallery</TITLE>
</HEAD>
<BODY>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.*"%>

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
        String sql="SELECT * FROM gallery";
        ResultSet rs=stmt.executeQuery(sql);

        while (rs.next()) {
            String gallery_id = rs.getString("gallery_id");
            String title = rs.getString("name");
            String description = rs.getString("description");
            out.println("<tr>");
            out.println("<td>"+rs.getString("gallery_id")+"</td>");
            out.println("<a href='gallery_detail.jsp?gallery_id="+gallery_id+"&title="+title+"&description="+description+"' class='gallery_name' style='color:#00cc99;'>"+title+"</a>");
            out.println("<td>"+rs.getString("description")+"</td>");
            out.println("<br>");
            out.println("</tr>");
        };
    %>


</BODY>
</HTML>