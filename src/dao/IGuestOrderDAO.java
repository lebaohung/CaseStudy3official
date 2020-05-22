package dao;

import model.Guest;
import model.Order;

public interface IGuestOrderDAO {
    public void insertGuest(Guest guest);
    public void insertOrder(Order order);
    public int getGuestIdByPhone(String phoneNum);
}
