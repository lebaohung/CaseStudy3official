package model;

public class Guest {
    private int guestID;
    private String guestName;
    private String guestPhone;

    public Guest() {
    }
    public Guest(String guestName, String guestPhone) {
//        this.guestID = guestID;
        this.guestName = guestName;
        this.guestPhone = guestPhone;
    }

    public Guest(int guestID, String guestName) {
        this.guestID = guestID;
        this.guestName = guestName;
    }

    public Guest(int guestID, String guestName, String guestPhone) {
        this.guestID = guestID;
        this.guestName = guestName;
        this.guestPhone = guestPhone;
    }

    public int getGuestID() {
        return guestID;
    }

    public void setGuestID(int guestID) {
        this.guestID = guestID;
    }

    public String getGuestName() {
        return guestName;
    }

    public void setGuestName(String guestName) {
        this.guestName = guestName;
    }

    public String getGuestPhone() {
        return guestPhone;
    }

    public void setGuestPhone(String guestPhone) {
        this.guestPhone = guestPhone;
    }
}
