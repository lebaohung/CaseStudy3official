package dao;

import model.Guest;
import model.Order;

import java.lang.reflect.Parameter;
import java.sql.*;

public class GuestOrderDAO implements IGuestOrderDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/case_M3";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123456789";
    //    private final String INSERT_ORDER_SQL=""
    private final String INSERT_GUESS_SQL = "INSERT INTO `case_m3`.`guest` (`name`, `phone`) VALUES (?, ?);";
    private final String INSERT_ORDER_SQL = "INSERT INTO `case_m3`.`orders` " +
            "(`guestId`, `branchId`, `date`, `timeId`, `guestNum`) VALUES (?, ?, ?, ?, ?);";
    private final String GET_GUEST_ID_BY_PHONE = "SELECT guestId FROM guest WHERE phone = ?;";

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
    public void insertOrder(Order order) {
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL);

            preparedStatement.setInt(1, order.getGuestId());
            preparedStatement.setInt(2, order.getBranchId());

            preparedStatement.setString(3, order.getDate());
            preparedStatement.setInt(4, order.getTimeId());
            preparedStatement.setInt(5, order.getGuestNum());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public int getGuestIdByPhone(String phoneNum) {
        Order order = null;
        int guestId=-1;
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(GET_GUEST_ID_BY_PHONE);
            preparedStatement.setString(1, phoneNum);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                guestId= rs.getInt("guestId");
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return guestId;
    }
//    @Override
//    public void insertOrder(Order order) {
//        Connection connection = getConnection();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL);
//            preparedStatement.setString(1,guest.getGuestName());
//            preparedStatement.setString(2,guest.getGuestPhone());
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }
}
