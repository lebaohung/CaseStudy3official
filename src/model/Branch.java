package model;

public class Branch {
    private String phone;
    private String name;
    private String add;

    public Branch() {
    }

    public Branch(String phone, String name, String add) {
        this.phone = phone;
        this.name = name;
        this.add = add;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAdd() {
        return add;
    }

    public void setAdd(String add) {
        this.add = add;
    }
}
