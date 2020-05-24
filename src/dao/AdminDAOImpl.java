package dao;

import model.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAOImpl implements IAdminDAO {
    private static final String SELECT_ALL_ADMIN = "select * from admin";
    private static final String SELECT_ADMIN_BY_NAME = "select * from admin where adName = ?";
    private static final String INSERT_ADMIN = "insert into admin" + "(adName, password) values"
            + "(?, ?);";
    private static final String DELETE_ADMIN = "delete from admin where adName = ?;";
    private static final String UPDATE_ADMIN = "update admin set adName = ?, password = ? where adName = ?;";


    Connection connection = JdbcConnection.getConnection();
    @Override
    public Admin checkValid(String inputUsername, String inputPassword) {
        Admin admin = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_BY_NAME);
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
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADMIN);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                String username = rs.getString("adName");
                String password = rs.getString("password");
                admins.add(new Admin(username, password));
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return admins;
    }

    @Override
    public Admin selectAdmin(String adName) {
        Admin admin = null;
        try(
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADMIN_BY_NAME);) {
            preparedStatement.setString(1, adName);

//          System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String password = rs.getString("password");
                admin = new Admin(adName, password);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return admin;
    }

    @Override
    public void insertAdmin(Admin admin) throws SQLException {
        try (
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADMIN);) {
            preparedStatement.setString(1, admin.getAdName());
            preparedStatement.setString(2, admin.getPassword());


//             System.out.println(preparedStatement);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean deleteAdmin(String adName) throws SQLException {
        boolean rowDelete;
        try(
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ADMIN);) {
            preparedStatement.setString(1, adName);

            rowDelete = preparedStatement.executeUpdate() > 0;
        }
        return rowDelete;
    }

    @Override
    public boolean updateAdmin(Admin admin, String adName) throws SQLException {
        boolean rowUpdate;
        try(
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ADMIN);) {
            preparedStatement.setString(1, admin.getAdName());
            preparedStatement.setString(2, admin.getPassword());

            preparedStatement.setString(3, adName);
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
