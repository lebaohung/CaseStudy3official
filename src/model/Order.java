package model;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class Order {
    private int orderId;
    private int guestId;
    private int branchId;
    private String date;
    private int timeId;//order time
    private int guestNum;

    public Order() {
    }


    public Order(int orderId, int guestId, int branchId, String date, int timeId, int guestNum) {
        this.orderId = orderId;
        this.guestId = guestId;
        this.branchId = branchId;
        this.date = date;
        this.timeId = timeId;
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
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate today = LocalDate.now();
        String timeString = today.format(formatter);
        System.out.println(timeString);
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getTimeId() {
        return timeId;
    }

    public void setTimeId(int timeId) {
        this.timeId = timeId;
    }

    public int getGuestNum() {
        return guestNum;
    }

    public void setGuestNum(int guestNum) {
        this.guestNum = guestNum;
    }
}
