import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ViewBalanceServlet")
public class ViewBalanceServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer customerId = (Integer) session.getAttribute("customer_id");

        if (customerId == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        double balance = 0.0;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "vishal1234");

            // Get total credit
            PreparedStatement creditStmt = con.prepareStatement(
                "SELECT NVL(SUM(amount), 0) FROM transactions WHERE customer_id = ? AND transaction_type = 'credit'");
            creditStmt.setInt(1, customerId);
            ResultSet creditRs = creditStmt.executeQuery();
            double credit = 0;
            if (creditRs.next()) {
                credit = creditRs.getDouble(1);
            }

            // Get total debit
            PreparedStatement debitStmt = con.prepareStatement(
                "SELECT NVL(SUM(amount), 0) FROM transactions WHERE customer_id = ? AND transaction_type = 'debit'");
            debitStmt.setInt(1, customerId);
            ResultSet debitRs = debitStmt.executeQuery();
            double debit = 0;
            if (debitRs.next()) {
                debit = debitRs.getDouble(1);
            }

            balance = credit - debit;

            con.close();

            // Pass balance to JSP
            request.setAttribute("balance", balance);
            RequestDispatcher rd = request.getRequestDispatcher("viewbalance.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
