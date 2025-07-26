import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUser = "system";
        String dbPassword = "vishal1234";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "SELECT customer_id, name FROM Registers_new WHERE email = ? AND password = ?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                int customerId = rs.getInt("customer_id");
                String name = rs.getString("name");

                // Store in session
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                session.setAttribute("useremail", email);
                session.setAttribute("customer_id", customerId);  

                response.sendRedirect("Dashboard.jsp");
            } else {
                PrintWriter out = response.getWriter();
                  request.setAttribute("errorMessage", "Invalid email or password !! retry");
                  RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                  dispatcher.forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
