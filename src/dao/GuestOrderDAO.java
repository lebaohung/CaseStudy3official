package dao;

import model.Guest;
import model.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GuestOrderDAO implements IGuestOrderDAO {
private final String INSERT_GUESS_SQL = "INSERT INTO `case_m3`.`guest` (`name`, `phone`) VALUES (?, ?);";
private final String INSERT_ORDER_SQL = "INSERT INTO `case_m3`.`orders` " +
            "(`guestId`, `branchId`, `date`, `time`, `guestNum`) VALUES (?, ?, ?, ?, ?);";
    private final String GET_GUEST_ID_BY_PHONE = "SELECT guestId FROM guest WHERE phone = ?;";
    private final String GET_ORDER_INFO_TO_CHECK_VALIDATE = "SELECT guestId,branchId,date,time FROM orders " +
            "where curdate()<=date;";
    private final String GET_ORDER_ID ="SELECT orderId from orders where guestId=? and branchId=?" +
            " and date=? and time=?";
    private  final String GET_ALL_ORDERS = "SELECT * FROM orders;";
    private final String GET_ORDER_BY_ID = "SELECT * FROM orders WHERE orderID = ?";
    private final String DELETE_ORDER = "DELETE FROM orders WHERE orderId = ?";
    private final String UPDATE_ORDER = "UPDATE orders SET guestId = ?, branchId = ?, date = ?, time = ?, guestNum = ? WHERE orderId = ?;";
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

    @Override
    public List<Order> selectAllOrders() {
        List<Order> orders = new ArrayList<>();
        try {
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_ORDERS);
             ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("orderId");
                int guestId = rs.getInt("guestId");
                int branchId = rs.getInt("branchId");
                String date = rs.getString("date");
                String time = rs.getString("time");
                int guestNum = rs.getInt("guestNum");
                orders.add(new Order(id, guestId, branchId, date, time, guestNum));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return  orders;
    }

    @Override
    public Order selectOrder(int id) {
        Order order = null;
        try{
            PreparedStatement preparedStatement = connection.prepareStatement(GET_ORDER_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int guestId = rs.getInt("guestId");
                int branchId = rs.getInt("branchId");
                String date = rs.getString("date");
                String time = rs.getString("time");
                int guestNum = rs.getInt("guestNum");
                order = new Order(id, guestId, branchId, date, time, guestNum);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return order;
    }

    @Override
    public boolean deleteOrder(int id) throws SQLException {
        boolean rowDelete;
        try(
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER);) {
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() > 0;
        }
        return rowDelete;
    }

    @Override
    public boolean updateOrder(Order order) throws SQLException {
        boolean rowUpdate;
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ORDER);) {
            preparedStatement.setInt(1, order.getGuestId());
            preparedStatement.setInt(2, order.getBranchId());
            preparedStatement.setString(3, order.getDate());
            preparedStatement.setString(4, order.getTime());
            preparedStatement.setInt(5, order.getGuestNum());

            preparedStatement.setInt(6, order.getOrderId());

            rowUpdate = preparedStatement.executeUpdate() > 0;
        }
        return rowUpdate;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
