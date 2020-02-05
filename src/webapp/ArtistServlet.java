package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.lang.*;
import java.io.*;
import java.sql.*;


public class ArtistServlet extends HttpServlet {
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
        if (request.getParameter("edit_artist") != null){
            String name = request.getParameter("name");
            String birth_year = request.getParameter("birth_year");
            String country = request.getParameter("country");
            String description = request.getParameter("description");
            String artistID = "";
            try {
                Connection con = get_connection();
                Statement stmt = con.createStatement();
                String query = String.format("SELECT * FROM artist where name = \'%s\'",name);
                try (ResultSet rs = stmt.executeQuery(query)) {
                    while (rs.next()) {
                        artistID = rs.getString("artist_id");
                        out.print(artistID);
                    }
                    Statement stmt2 = con.createStatement();
                    String next_query = String.format("update artist set name = \'%s\', birth_year = \'%s\', country = \'%s\', description = \'%s\' where artist_id = \'%s\'",name,birth_year,country,description,artistID);
                    stmt2.executeUpdate(next_query);
                    request.getRequestDispatcher("/artist.jsp").forward(request, response);
                }catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (request.getParameter("find_artist") != null){
            String country = request.getParameter("country");
            String birth_year = request.getParameter("birth_year");

            try {
                Connection con = get_connection();
                Statement stmt = con.createStatement();
                String query;
                if ((!country.isEmpty()) && birth_year.isEmpty()){
                    query = String.format("SELECT * FROM artist where country = \'%s\'",country);
                    try (ResultSet rs = stmt.executeQuery(query)) {
                        while (rs.next()) {
                            out.print(rs.getString("artist_id") + "  ");
                            out.print(rs.getString("name")+ "  ");
                            out.print(rs.getString("birth_year")+ "  ");
                            out.print(rs.getString("country")+ "  ");
                            out.println(rs.getString("description"));
                        }
                    }catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                else if (country.isEmpty() && (!birth_year.isEmpty())){
                    query = String.format("SELECT * FROM artist where birth_year = \'%s\'",birth_year);
                    try (ResultSet rs = stmt.executeQuery(query)) {
                        while (rs.next()) {
                            out.print(rs.getString("artist_id") + "  ");
                            out.print(rs.getString("name")+ "  ");
                            out.print(rs.getString("birth_year")+ "  ");
                            out.print(rs.getString("country")+ "  ");
                            out.println(rs.getString("description"));
                        }
                    }catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                else if ((!country.isEmpty()) && (!birth_year.isEmpty())){
                    query = String.format("SELECT * FROM artist where country = \'%s\' and birth_year = \'%s\'",country,birth_year);
                    try (ResultSet rs = stmt.executeQuery(query)) {
                        while (rs.next()) {
                            out.print(rs.getString("artist_id") + "  ");
                            out.print(rs.getString("name")+ "  ");
                            out.print(rs.getString("birth_year")+ "  ");
                            out.print(rs.getString("country")+ "  ");
                            out.println(rs.getString("description"));
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
        System.out.print("hi");
//        try {
//            Connection con = get_connection();
//            Statement stmt = con.createStatement();
//            String sql="SELECT * FROM artist";
//            ResultSet rs=stmt.executeQuery(sql);
//
//            while (rs.next()) {
//                System.out.println("<tr>");
//                System.out.println("<td>"+rs.getString("artist_id")+"</td>");
//                System.out.println("<a href='artist_bio.jsp' class='gallery_name'>"+rs.getString("name")+"</a>");
//                System.out.println("<td>"+rs.getString("birth_year")+"</td>");
//                System.out.println("<td>"+rs.getString("country")+"</td>");
//                System.out.println("<td>"+rs.getString("description")+"</td>");
//                System.out.println("<br>");
//                System.out.println("</tr>");
//            };
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

    }
}
