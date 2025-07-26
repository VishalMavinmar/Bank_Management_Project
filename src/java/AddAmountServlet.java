import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AddAmountServlet")
public class AddAmountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer customerId = (Integer) session.getAttribute("customer_id");

        if (customerId == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vishal1234");

            // Insert into addamounts
            PreparedStatement ps1 = con.prepareStatement("INSERT INTO addamounts (customer_id, amount_added) VALUES (?, ?)");
            ps1.setInt(1, customerId);
            ps1.setDouble(2, amount);
            ps1.executeUpdate();

            // Insert into transactions
            PreparedStatement ps2 = con.prepareStatement("INSERT INTO transactions (customer_id, amount, transaction_type) VALUES (?, ?, ?)");
            ps2.setInt(1, customerId);
            ps2.setDouble(2, amount);
            ps2.setString(3, "credit");
            ps2.executeUpdate();

            con.close();

            // ✅ Forward to addamount.jsp with success message
            request.setAttribute("message", "Amount added successfully");
            RequestDispatcher rd = request.getRequestDispatcher("addamount.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
