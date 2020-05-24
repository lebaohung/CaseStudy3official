package controller;

import dao.AdminDAOImpl;
import dao.IAdminDAO;
import model.Admin;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CrudAminServlet", urlPatterns = "/admins")
public class CrudAminServlet extends HttpServlet {

    IAdminDAO adminDAO = new AdminDAOImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "create":
                    insertAdmin(request, response);
                    break;
                case "edit":
                    updateAdmin(request, response);
                    break;
                case "delete":
                    deleteAdmin(request, response);
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
                case "create":
                    showCreatForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    showDeleteForm(request, response);
                    break;
                default:
                    listAdmin(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Admin> listAdmin = adminDAO.selectAllAdmin();
        request.setAttribute("listAdmin", listAdmin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admins/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showCreatForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("admins/create.jsp");
        dispatcher.forward(request, response);
    }

    private void insertAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {

        String adName = request.getParameter("adName");
        String password = request.getParameter("password");
        Admin admin = new Admin(adName, password);
        adminDAO.insertAdmin(admin);
        request.setAttribute("message", "New admin was created");
        RequestDispatcher dispatcher = request.getRequestDispatcher("admins/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String adName = request.getParameter("adName");
        Admin choosenAdmin = adminDAO.selectAdmin(adName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admins/edit.jsp");
        request.setAttribute("admin", choosenAdmin);
        request.setAttribute("adName", adName);
        dispatcher.forward(request, response);
    }

    private void updateAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String adName = request.getParameter("adName");
        String adName1 = request.getParameter("adName1");
        String password = request.getParameter("password");
        Admin admin = new Admin(adName1, password);

        adminDAO.updateAdmin(admin, adName);
        request.setAttribute("message", "Admin information was updated");
        RequestDispatcher dispatcher = request.getRequestDispatcher("admins/edit.jsp");
        dispatcher.forward(request, response);
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String adName = request.getParameter("adName");
        Admin deleteAdmin = adminDAO.selectAdmin(adName);
        request.setAttribute("deleteAdmin", deleteAdmin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admins/delete.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteAdmin(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String adName = request.getParameter("adName");
        adminDAO.deleteAdmin(adName);
        request.setAttribute("message", "Admin information was deleted");
        RequestDispatcher dispatcher = request.getRequestDispatcher("admins/delete.jsp");
        dispatcher.forward(request, response);

    }

}
