package dao;

import model.Guest;
import model.Order;

import java.sql.SQLException;
import java.util.List;

public interface IGuestOrderDAO {
    public void insertGuest(Guest guest);
    public boolean insertOrder(Order order);
    public boolean checkValidateOrder(Order order);
    public int getGuestIdByPhone(String phoneNum);
    public List<Order> selectAllOrders();
    public Order selectOrder(int id);
    public boolean deleteOrder(int id) throws SQLException;
    public boolean updateOrder(Order order) throws SQLException;
}
