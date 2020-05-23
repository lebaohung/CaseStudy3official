package dao;

import model.Guest;
import model.Order;

import java.sql.*;

public class GuestOrderDAO implements IGuestOrderDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/case_M3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
    //    private final String INSERT_ORDER_SQL=""
    private final String INSERT_GUESS_SQL = "INSERT INTO `case_m3`.`guest` (`name`, `phone`) VALUES (?, ?);";
    private final String INSERT_ORDER_SQL = "INSERT INTO `case_m3`.`orders` " +
            "(`guestId`, `branchId`, `date`, `orderTime`, `guestNum`) VALUES (?, ?, ?, ?, ?);";
    private final String GET_GUEST_ID_BY_PHONE = "SELECT guestId FROM guest WHERE phone = ?;";
    private final String GET_ORDER_INFO_TO_CHECK_VALIDATE = "SELECT guestId,branchId,date,orderTime FROM orders " +
            "where curdate()<=date;";
    private final String GET_ORDER_ID ="SELECT orderId from orders where guestId=? and branchId=?" +
            " and date=? and orderTime=?";


    public GuestOrderDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

    @Override
    public void insertGuest(Guest guest) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_GUESS_SQL);
            preparedStatement.setString(1, guest.getGuestName());
            preparedStatement.setString(2, guest.getGuestPhone());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    @Override
    public boolean insertOrder(Order order) {
        if (checkValidateOrder(order)) {
            Connection connection = getConnection();
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL);
                preparedStatement.setInt(1, order.getGuestId());
                preparedStatement.setInt(2, order.getBranchId());
                preparedStatement.setString(3, order.getDate());
                preparedStatement.setString(4, order.getOrderTime());
                preparedStatement.setInt(5, order.getGuestNum());
                preparedStatement.executeUpdate();
                getOrderId(order);
               order.setOrderId(getOrderId(order));

                return true;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        } return false;
    }

    private int getOrderId(Order order) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_ID);
            preparedStatement.setInt(1, order.getGuestId());
            preparedStatement.setInt(2, order.getBranchId());
            preparedStatement.setString(3, order.getDate());
            preparedStatement.setString(4, order.getOrderTime());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int orderId = rs.getInt("orderId");
                System.out.println(orderId);
                return orderId;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return -1;
    }

    @Override
    public int getGuestIdByPhone(String phoneNum) {
        Order order = null;
        int guestId = -1;
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_GUEST_ID_BY_PHONE);
            preparedStatement.setString(1, phoneNum);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                guestId = rs.getInt("guestId");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return guestId;
    }

    @Override
    public boolean checkValidateOrder(Order order) {

        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_INFO_TO_CHECK_VALIDATE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int guestId = rs.getInt("guestId");
                int branchId = rs.getInt("branchId");
                String date = rs.getString("date");
                String orderTime = rs.getString("orderTime");
                if (orderTime==null||orderTime.equals("") ) {
                    return true;
                }
                if (order.getGuestId() == guestId && order.getBranchId() == branchId
                       && order.getDate().equals(date) && order.getOrderTime().equals(orderTime)) {
                    return false;
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return true;
    }

}
