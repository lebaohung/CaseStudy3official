package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Order {
    private int orderId;
    private int guestId;
    private int branchId;
    private String date;
    private String time;//order time
    private int guestNum;
    public Order() {
    }


    public Order(int orderId, int guestId, int branchId, String date, String timeId, int guestNum) {
        super();
        this.orderId = orderId;
        this.guestId = guestId;
        this.branchId = branchId;
        this.date = date;
        this.time = timeId;
        this.guestNum = guestNum;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getGuestId() {
        return guestId;
    }

    public void setGuestId(int guestId) {
        this.guestId = guestId;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getDate() {
        return date;
    }

    public void setDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate today = LocalDate.now();
        this.date = today.format(formatter);
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time +":00:00";
    }

    public int getGuestNum() {
        return guestNum;
    }

    public void setGuestNum(int guestNum) {
        this.guestNum = guestNum;
    }
}
