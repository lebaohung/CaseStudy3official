package model;

public class Admin {
    protected String adName;
    protected String password;

    public Admin() {
    }

    public Admin(String adName, String password) {
        super();
        this.adName = adName;
        this.password = password;
    }

    public String getAdName() {
        return adName;
    }

    public void setAdName(String adName) {
        this.adName = adName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
