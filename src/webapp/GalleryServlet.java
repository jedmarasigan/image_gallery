package webapp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class GalleryServlet extends HttpServlet {

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
        if (request.getParameter("edit_gallery") != null){

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String galleryID = "";
            try {
                Connection con = get_connection();
                Statement stmt = con.createStatement();
                String query = String.format("SELECT * FROM gallery where name = \'%s\'",title);
                try (ResultSet rs = stmt.executeQuery(query)) {
                    while (rs.next()) {
                        galleryID = rs.getString("gallery_id");
                    }
                    Statement stmt2 = con.createStatement();
                    String next_query = String.format("update gallery set name = \'%s\', description = \'%s\' where gallery_id = \'%s\'",title,description,galleryID);
                    stmt2.executeUpdate(next_query);
                    request.getRequestDispatcher("/gallery.jsp").forward(request, response);
                }catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
