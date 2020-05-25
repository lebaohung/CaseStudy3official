package controller;

import dao.GuestOrderDAO;
import dao.IGuestOrderDAO;
import model.Admin;
import dao.AdminDAOImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdminServlet", urlPatterns = "/admin")
public class AdminServlet extends HttpServlet {
    private static final String LOGIN_SUCCESS_MESSAGE = "Login Succeeded!";
    private static final String LOGIN_ERROR_MESSAGE = "Please try again!";

    AdminDAOImpl adminDAO = new AdminDAOImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("before go to checkvalid");
        checkValid(request, response);
        System.out.println("after go to checkvalid");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("before request action");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                showAdminLogin(request, response);
                break;
        }
        System.out.println("after check valid");
    }

    private void showAdminLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("before showadminlogin");
        RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
        dispatcher.forward(request, response);
        System.out.println("after showadminlogin");
    }

    private void checkValid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("before checkvalid");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = adminDAO.checkValid(username, password);
        if (admin != null) {
            request.getSession().setAttribute("admin", admin);
            response.sendRedirect(request.getContextPath() + "/dashboard");
        } else {
            request.setAttribute("message", LOGIN_ERROR_MESSAGE);
            RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
            dispatcher.forward(request, response);
        }
        System.out.println("after checkvalid");
    }
}