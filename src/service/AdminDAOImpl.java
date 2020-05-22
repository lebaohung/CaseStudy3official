package service;

import model.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAOImpl implements IAdminDAO{
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/casestudy_demo";
    private static final String jdbcUsername = "root";
    private static final String jdbcPassword = "admin123";
    private static final String SELECT_ALL_USER = "select * from user";
    private static final String SELECT_USER_BY_NAME = "select * from user where username = ?";

    public Connection getDBConnect(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e){
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        return conn;
    }

    @Override
    public Admin checkValid(String inputUsername, String inputPassword) {
        Admin admin = null;
        try {
            Connection conn = getDBConnect();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_USER_BY_NAME);
            preparedStatement.setString(1, inputUsername);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String password = rs.getString("password");
                if (password.equals(inputPassword)){
                    admin = new Admin(inputUsername, inputUsername);
                }
            }

        } catch (SQLException e){
            e.printStackTrace();
        }
        return admin;
    }

//    @Override
//    public boolean checkValid(String inputUsername, String inputPassword) {
//        try {
//            Connection conn = getDBConnect();
//            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_USER_BY_NAME);
//            preparedStatement.setString(1, inputUsername);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()){
//                String password = rs.getString("password");
//                if (password.equals(inputPassword)){
//                    return true;
//                }
//            }
//
//        } catch (SQLException e){
//            e.printStackTrace();
//        }
//        return false;
//    }

    @Override
    public List<Admin> selectAllAdmin() {
        List<Admin> admins = new ArrayList<>();
        try {
            Connection conn = getDBConnect();
            PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ALL_USER);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                String username = rs.getString("username");
                String password = rs.getString("password");
                admins.add(new Admin(username, password));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return admins;
    }
}
