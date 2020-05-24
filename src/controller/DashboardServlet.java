package controller;

import dao.GuestOrderDAO;
import dao.IGuestOrderDAO;
import model.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

@WebServlet(name = "DashboardServlet", urlPatterns = "/dashboard")
public class DashboardServlet extends HttpServlet {
    IGuestOrderDAO guestOrderDAO = new GuestOrderDAO();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    updateOrder(request, response);
                    break;
                case "delete":
                    deleteOrder(request, response);
                    break;
                default:
                    logOut(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    showDeleteForm(request, response);
                    break;
                default:
                    showDashboard(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
        showDashboard(request, response);
    }

    public void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orders = guestOrderDAO.selectAllOrders();
        request.setAttribute("listOrder", orders);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin_interface.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order choosenOrder = guestOrderDAO.selectOrder(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editOrder.jsp");
        request.setAttribute("order", choosenOrder);
        dispatcher.forward(request, response);
    }

    private void updateOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        int guestId = Integer.parseInt(request.getParameter("guestId"));
        int branchId = Integer.parseInt(request.getParameter("branchId"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        int guestNum = Integer.parseInt(request.getParameter("guestNum"));
        Order order = new Order(id, guestId, branchId, date, time, guestNum);
        guestOrderDAO.updateOrder(order);
        request.setAttribute("message", "Order information was updated");
        RequestDispatcher dispatcher = request.getRequestDispatcher("editOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Order deleteOrder = guestOrderDAO.selectOrder(id);
        request.setAttribute("deleteOrder", deleteOrder);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deleteOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        guestOrderDAO.deleteOrder(id);
        request.setAttribute("message", "Order information was deleted");
        RequestDispatcher dispatcher = request.getRequestDispatcher("deleteOrder.jsp");
        dispatcher.forward(request, response);

    }

    public void logOut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath() + "index.jsp");

    }
}
