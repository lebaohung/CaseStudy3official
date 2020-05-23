package controller;

import dao.GuestOrderDAO;
import model.Guest;
import model.Order;

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
    private final String QUANTITY_REGEX = "[0-9]{1,20}";
    private final String BRANCH_REGEX = "[aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈ"
            + "ĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴ"
            + "zZ\\s]+";
//    private final String DATE_REGEX = "";
//    private final String TIME_REGEX = "";
private GuestOrderDAO guestOrderDAO;
    public void init() {
        guestOrderDAO = new GuestOrderDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        // get customer name
        String guestName = request.getParameter("nameText");
        // get customer phone num
        String phoneNum = request.getParameter("phoneNum");
        //get quantity people
        String quantity = request.getParameter("quantity");
        //get branch name
        String branchRadio = request.getParameter("branchRadio");
        //get order date
        String dateOrder = request.getParameter("dateOrder");
        //get order time
        String timeRadio = request.getParameter("timeRadio");

        if (checkCustomerInfo(guestName, phoneNum)) {
            Guest guest = new Guest(guestName, phoneNum);
            guestOrderDAO.insertGuest(guest);
        } else try {
            throw new Exception();
        } catch (Exception e) {
            System.out.println("Data is Validate!");
        }

        if (checkOrderInfo(quantity, branchRadio, dateOrder, timeRadio)) {
            Order order = new Order();
            int guestNum = Integer.parseInt(quantity);
            int orderTime = Integer.parseInt(timeRadio);

            order.setGuestNum(guestNum);
            order.setTimeId(orderTime);
            order.setDate(dateOrder);
            order.setBranchId(chooseBranchId(branchRadio));
            order.setGuestId(getGuestByPhone(phoneNum));

            guestOrderDAO.insertOrder(order);

        }

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

    private boolean checkOrderInfo(String quantity, String branchRadio, String dateOrder, String timeRadio) {
        if (!Pattern.matches(QUANTITY_REGEX, quantity)) {
            try {
                throw new Exception();
            } catch (Exception e) {
                System.out.println("quantity is Validate!");
                return false;
            }
        }

        if (!Pattern.matches(BRANCH_REGEX, branchRadio)) {
            try {
                throw new Exception();
            } catch (Exception e) {
                System.out.println("branchRadio is Validate!");
                return false;
            }
        }
//        if (!Pattern.matches(DATE_REGEX, dateOrder)){
//            try {
//                throw new Exception();
//            } catch (Exception e) {
//                System.out.println("dateOrder is Validate!");
//                return false;
//            }
//        }
//        if (!Pattern.matches(TIME_REGEX, timeRadio)){
//            try {
//                throw new Exception();
//            } catch (Exception e) {
//                System.out.println("timeRadio is Validate!");
//                return false;
//            }
//        }
        return true;
    }

    private boolean checkCustomerInfo(String guestName, String phoneNum) {
        if (!Pattern.matches(NAME_REGEX, guestName)) {
            try {
                throw new Exception();
            } catch (Exception e) {
                System.out.println("Name is Validate!");
                return false;
            }
        }

        if (!Pattern.matches(PHONE_REGEX, phoneNum)) {
            try {
                throw new Exception();
            } catch (Exception e) {
                System.out.println("Phone is Validate!");
                return false;
            }
        }
        return true;
    }
}
