import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Check for empty fields
        if (name == null || name.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty() ||
            address == null || address.trim().isEmpty()) {

            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        // Validate email format
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        // Validate phone number (10 digits only)
        if (!phone.matches("\\d{10}")) {
            request.setAttribute("error", "Phone number must be exactly 10 digits.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }

        String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
        String dbUser = "system";
        String dbPassword = "vishal1234";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Check for duplicate email
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM Registers_new WHERE email = ?");
            checkStmt.setString(1, email);
            ResultSet checkRs = checkStmt.executeQuery();

            if (checkRs.next()) {
                conn.close();
                request.setAttribute("error", "Email already exists.");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
                return;
            }

            // Insert into database
            String sql = "INSERT INTO Registers_new (name, email, password, phone, address) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pst = conn.prepareStatement(sql, new String[] { "customer_id" });

            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.setString(4, phone);
            pst.setString(5, address);

            int rows = pst.executeUpdate();

            if (rows > 0) {
                ResultSet rs = pst.getGeneratedKeys();
                int customerId = -1;
                if (rs.next()) {
                    customerId = rs.getInt(1);
                }

                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                session.setAttribute("useremail", email);
                session.setAttribute("customer_id", customerId);

                response.sendRedirect("Dashboard.jsp");
            } else {
                request.setAttribute("error", "Registration failed. Try again.");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
        }
    }
}
