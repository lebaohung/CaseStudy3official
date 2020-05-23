package controller;

import dao.BranchDAO;
import dao.MenuItemDAO;
import model.Branch;
import model.MenuItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexServlet", urlPatterns = "")
public class IndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MenuItemDAO menuItemDAO;
    private BranchDAO branchDAO;

    public void init() {
        branchDAO = new BranchDAO();
        menuItemDAO = new MenuItemDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MenuItem> itemList = menuItemDAO.selectAllItem();
        request.setAttribute("itemList", itemList);
        List<Branch> branchList = branchDAO.selectAllBranch();
        request.setAttribute("branchList", branchList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
