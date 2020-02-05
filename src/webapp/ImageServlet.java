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

public class ImageServlet extends HttpServlet {
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
        PrintWriter out = response.getWriter();
        if (request.getParameter("add_image") != null){
            String title = request.getParameter("title");
            String link = request.getParameter("link");
            String year = request.getParameter("year");
            String type = request.getParameter("type");
            String width = request.getParameter("width");
            String height = request.getParameter("height");
            String location = request.getParameter("location");
            String description = request.getParameter("description");
            String gallery_id = request.getParameter("gallery_id");
            String artist_id = request.getParameter("artist_id");
            String detail_id = request.getParameter("detail_id");
            try {
                Connection con = get_connection();
                PreparedStatement pstmt = con.prepareStatement("insert into image values (default,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                pstmt.clearParameters();
                pstmt.setString(1, title);
                pstmt.setString(2, link);
                pstmt.setString(3, gallery_id);
                pstmt.setString(4, artist_id);
                pstmt.setString(5, detail_id);
                pstmt.executeUpdate();
                ResultSet rs = pstmt.getGeneratedKeys();
                String image_id = "";
                while (rs.next()){
                    image_id = rs.getString(1);
                }
                PreparedStatement pstmt2 = con.prepareStatement("insert into detail values (default,?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
                pstmt2.clearParameters();
                pstmt2.setString(1, image_id);
                pstmt2.setString(2, year);
                pstmt2.setString(3, type);
                pstmt2.setString(4, width);
                pstmt2.setString(5, height);
                pstmt2.setString(6, location);
                pstmt2.setString(7, description);
                pstmt2.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.getRequestDispatcher("/image_detail.jsp").forward(request, response);
        }
        else if (request.getParameter("edit_image") != null){
            String title = request.getParameter("title");
            String year = request.getParameter("year");
            String artist_id = request.getParameter("artist_id");
            String description = request.getParameter("description");
            String imageID = "";
            try {
                Connection con = get_connection();
                Statement stmt = con.createStatement();
                String query = String.format("SELECT * FROM image where title = \'%s\'",title);
                try (ResultSet rs = stmt.executeQuery(query)) {
                    while (rs.next()) {
                        imageID = rs.getString("image_id");
                    }
                    Statement stmt2 = con.createStatement();
                    String second_query = String.format("UPDATE image SET title = \'%s\', artist_id = \'%s\' WHERE image_id = \'%s\'",title,artist_id,imageID);
                    stmt2.executeUpdate(second_query);
                    Statement stmt3 = con.createStatement();
                    String third_query = String.format("UPDATE detail SET year = \'%s\', description = \'%s\' WHERE image_id = \'%s\'",year,description,imageID);
                    stmt3.executeUpdate(third_query);
                    request.getRequestDispatcher("/gallery.jsp").forward(request, response);
                }catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (request.getParameter("delete_image") != null){
            String title = request.getParameter("title");
            String year = request.getParameter("year");
            String artist_id = request.getParameter("artist_id");
            String description = request.getParameter("description");
            try {
                Connection con = get_connection();
                String query = String.format("DELETE FROM image where title = \'%s\' AND artist_id = \'%s\'",title,artist_id);
                PreparedStatement pstmt = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
                pstmt.executeUpdate();
                request.getRequestDispatcher("/gallery.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (request.getParameter("find_image") != null){
            String artist_id = request.getParameter("artist_id");
            String title = request.getParameter("title");

            try {
                Connection con = get_connection();
                Statement stmt = con.createStatement();
                String query;
                if ((!artist_id.isEmpty()) && title.isEmpty()){
                    query = String.format("SELECT * FROM image where artist_id = \'%s\'",artist_id);
                    try (ResultSet rs = stmt.executeQuery(query)) {
                        while (rs.next()) {
                            out.print(rs.getString("image_id")+ "  ");
                            out.print(rs.getString("title")+ "  ");
                            out.print(rs.getString("link")+ "  ");
                            out.print(rs.getString("artist_id")+ "  ");
                            out.println(rs.getString("detail_id")+ "  ");
                        }
                    }catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                else if (artist_id.isEmpty() && (!title.isEmpty())){
                    query = String.format("SELECT * FROM image where title = \'%s\'",title);
                    try (ResultSet rs = stmt.executeQuery(query)) {
                        while (rs.next()) {
                            out.print(rs.getString("image_id")+ "  ");
                            out.print(rs.getString("title")+ "  ");
                            out.print(rs.getString("link")+ "  ");
                            out.print(rs.getString("artist_id")+ "  ");
                            out.println(rs.getString("detail_id"));
                        }
                    }catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                else if ((!artist_id.isEmpty()) && (!title.isEmpty())){
                    query = String.format("SELECT * FROM image where artist_id = \'%s\' and title = \'s\'",artist_id,title);
                    try (ResultSet rs = stmt.executeQuery(query)) {
                        while (rs.next()) {
                            out.print(rs.getString("image_id")+ "  ");
                            out.print(rs.getString("title")+ "  ");
                            out.print(rs.getString("link")+ "  ");
                            out.print(rs.getString("artist_id")+ "  ");
                            out.println(rs.getString("detail_id"));
                        }
                    }catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
