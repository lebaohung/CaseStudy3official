package DAO;

import model.MenuItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuItemDAO {

    private String jdbcUrl = "jdbc:mysql://localhost:3306/case_M3?useSSL=false";
    private String jdbcUser = "root";
    private String jdbcPassword = "password";
    private static final String select_all_item = "select * from menu";

    public MenuItemDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Drive");
            connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

    public List<MenuItem> selectAllItem() {
        List<MenuItem> items = new ArrayList<>();
        Connection connection = getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(select_all_item);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("menuID");
                String name = rs.getString("name");
                float price = rs.getFloat(3);
                String descr = rs.getString(4);
                String img = rs.getString(5);
                String kind = rs.getString(6);
                items.add(new MenuItem(id, name, price, descr, img, kind));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return items;
    }
}
