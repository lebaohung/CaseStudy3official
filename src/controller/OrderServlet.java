package controller;

import dao.GuestOrderDAO;
import model.Guest;
import model.Order;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet(name = "OrderServlet", urlPatterns = "/orderServlet")
public class OrderServlet extends HttpServlet {
    private final String NAME_REGEX = "[aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈ"
            + "ĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴ"
            + "zZ\\s]+";
    private final String PHONE_REGEX = "[0-9]{9,12}";
    private final String QUANTITY_REGEX = "[0-9]{1,3}";
    private final String BRANCH_REGEX = "[aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈ"
            + "ĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴ"
            + "zZ\\s]+";
    private final String DATE_REGEX = "[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}";
    private final String TIME_REGEX = "[0-9]{2}";
private GuestOrderDAO guestOrderDAO;
    public void init() {
        guestOrderDAO = new GuestOrderDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        // get customer name
        String guestName = request.getParameter("nameText");
        // get customer phone num
        String phoneNum = request.getParameter("phoneNum");
        //get quantity people
        String quantity = request.getParameter("quantity");
        //get branch name
        String branchRadio = request.getParameter("branchRadio");
        //get order time
        String timeRadio = request.getParameter("timeRadio");
        //get order date
//        String dateOrder = request.getParameter("dateOrder");

        if (checkCustomerInfo(guestName, phoneNum)) {
            Guest guest = new Guest(guestName, phoneNum);
            guestOrderDAO.insertGuest(guest);
        } else try {
            throw new Exception();
        } catch (Exception e) {
            System.out.println("Data is Validate!");
        }

        if (checkOrderInfo(quantity, branchRadio, timeRadio)) {
            Order order = new Order();
            int guestNum = Integer.parseInt(quantity);
            order.setGuestNum(guestNum);
            order.setTime(timeRadio);
            order.setDate();
            order.setBranchId(chooseBranchId(branchRadio));
            order.setGuestId(getGuestByPhone(phoneNum));
            if (guestOrderDAO.insertOrder(order)){
                confirmOrderDispatcher(request, response, guestName, quantity, order);
            }else {
                validateOrderDispatcher(request, response);
                return;
            }
        }

    }

    private void validateOrderDispatcher(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("fail");
        String orderFail="fail";
        request.setAttribute("orderStt",orderFail);
        RequestDispatcher dispatcher = request.getRequestDispatcher("validateOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void confirmOrderDispatcher(HttpServletRequest request, HttpServletResponse response, String guestName,
                                        String quantity, Order order) throws ServletException, IOException {
        System.out.println("success");
        request.setAttribute("order", order);
        request.setAttribute("guestName",guestName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("confirmOrder.jsp");
        dispatcher.forward(request, response);
    }

    private int getGuestByPhone(String phoneNum) {
        return guestOrderDAO.getGuestIdByPhone(phoneNum);
    }

    private int chooseBranchId(String branchRadio) {
        int id = 0;
        switch (branchRadio) {
            case "Lẩu Phan Moncity":
                id = 1;
                break;
            case "Lẩu Phan Hải Phòng":
                id = 2;
                break;
            case "Lẩu Phan Phùng Khoang":
                id = 3;
                break;
            case "Lẩu Phan Ðào Duy Anh":
                id = 4;
                break;
            case "Lẩu Phan Nguyễn Văn Cừ":
                id = 5;
                break;
        }
        return id;
    }

    private boolean checkOrderInfo(String quantity, String branchRadio, String timeRadio) {
        if (!Pattern.matches(QUANTITY_REGEX, quantity)) {
                System.out.println("quantity is Validate!");
        }

        if (!Pattern.matches(BRANCH_REGEX, branchRadio)) {
                System.out.println("branchRadio is Validate!");
        }

        if (!Pattern.matches(TIME_REGEX, timeRadio)){
                System.out.println("timeRadio is Validate!");
        }
        return true;
    }

    private boolean checkCustomerInfo(String guestName, String phoneNum) {
        if (!Pattern.matches(NAME_REGEX, guestName)) {
                System.out.println("Name is Validate!");
                return false;
            }

        if (!Pattern.matches(PHONE_REGEX, phoneNum)) {
                System.out.println("Phone is Validate!");
                return false;
            }
        return true;
    }
}
