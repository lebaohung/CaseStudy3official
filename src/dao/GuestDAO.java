package dao;

import model.Guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GuestDAO {
    private static final String select_all_guest = "select * from guest";

    public GuestDAO() {
    }

    Connection connection = JdbcConnection.getConnection();
    public List<Guest> selectAllGuest() {
        List<Guest> guestList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(select_all_guest);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int guestId = rs.getInt("guestId");
                String name = rs.getString("name");
                guestList.add(new Guest(guestId, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return guestList;
    }
}
