package model;

public class MenuItem {
    protected int id;
    protected String name;
    protected String price;
    protected String descr;
    protected String img;
    protected String kind;

    public MenuItem() {
    }

    public MenuItem(int id, String name, String price, String descr, String img, String kind) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.descr = descr;
        this.img = img;
        this.kind = kind;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }
}
