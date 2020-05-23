package dao;

import model.Guest;
import model.Order;

public interface IGuestOrderDAO {
    public void insertGuest(Guest guest);
    public boolean insertOrder(Order order);
    public boolean checkValidateOrder(Order order);
    public int getGuestIdByPhone(String phoneNum);
}
