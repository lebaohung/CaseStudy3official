package dao;

import model.Guest;
import model.Order;

import java.sql.*;

public class GuestOrderDAO implements IGuestOrderDAO {
private final String INSERT_GUESS_SQL = "INSERT INTO `case_M3`.`guest` (`name`, `phone`) VALUES (?, ?);";
private final String INSERT_ORDER_SQL = "INSERT INTO `case_M3`.`orders` " +
            "(`guestId`, `branchId`, `date`, `time`, `guestNum`) VALUES (?, ?, ?, ?, ?);";
    private final String GET_GUEST_ID_BY_PHONE = "SELECT guestId FROM guest WHERE phone = ?;";
    private final String GET_ORDER_INFO_TO_CHECK_VALIDATE = "SELECT guestId,branchId,date,time FROM orders " +
            "where curdate()<=date;";
    private final String GET_ORDER_ID ="SELECT orderId from orders where guestId=? and branchId=?" +
            " and date=? and time=?";
    Connection connection = JdbcConnection.getConnection();

    public GuestOrderDAO() {
    }

    @Override
    public void insertGuest(Guest guest) {
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
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL);
                preparedStatement.setInt(1, order.getGuestId());
                preparedStatement.setInt(2, order.getBranchId());
                preparedStatement.setString(3, order.getDate());
                preparedStatement.setString(4, order.getTime());
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
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_ID);
            preparedStatement.setInt(1, order.getGuestId());
            preparedStatement.setInt(2, order.getBranchId());
            preparedStatement.setString(3, order.getDate());
            preparedStatement.setString(4, order.getTime());
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
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_INFO_TO_CHECK_VALIDATE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int guestId = rs.getInt("guestId");
                int branchId = rs.getInt("branchId");
                String date = rs.getString("date");
                String time = rs.getString("time");
                if (time==null||time.equals("") ) {
                    return true;
                }
                if (order.getGuestId() == guestId && order.getBranchId() == branchId
                       && order.getDate().equals(date) && order.getTime().equals(time)) {
                    return false;
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return true;
    }

}
