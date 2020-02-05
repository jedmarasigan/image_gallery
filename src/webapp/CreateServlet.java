package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.sql.*;

public class CreateServlet extends HttpServlet {
    public Connection get_connection(){
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        }
        catch(Exception e) {
            System.out.println("can't load mysql driver");
            System.out.println(e.toString());
        }
        String url="jdbc:mysql://127.0.0.1:3306/gallery";
        String id="gallery";
        String pwd="eecs118";
        Connection con = null;
        try {
            con = DriverManager.getConnection(url,id,pwd);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("create_gallery") != null){
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            try {
                Connection con = get_connection();
                PreparedStatement pstmt = con.prepareStatement("insert into gallery values (default,?,?)",Statement.RETURN_GENERATED_KEYS);
                pstmt.clearParameters();
                pstmt.setString(1, title);
                pstmt.setString(2, description);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/gallery.jsp").forward(request, response);
        }
        else if (request.getParameter("create_artist") != null){
            String name = request.getParameter("name");
            String birth_year = request.getParameter("birth_year");
            String country = request.getParameter("country");
            String description = request.getParameter("description");
            try {
                Connection con = get_connection();
                PreparedStatement pstmt = con.prepareStatement("insert into artist values (default,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                pstmt.clearParameters();
                pstmt.setString(1, name);
                pstmt.setString(2, birth_year);
                pstmt.setString(3, country);
                pstmt.setString(4, description);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/artist.jsp").forward(request, response);
        }
    }
}
