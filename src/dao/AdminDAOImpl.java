package dao;

import model.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAOImpl implements IAdminDAO {
    private static final String SELECT_ALL_USER = "select * from admin";
    private static final String SELECT_USER_BY_NAME = "select * from admin where adName = ?";

    Connection connection = JdbcConnection.getConnection();
    @Override
    public Admin checkValid(String inputUsername, String inputPassword) {
        Admin admin = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_NAME);
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

    @Override
    public List<Admin> selectAllAdmin() {
        List<Admin> admins = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USER);
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
