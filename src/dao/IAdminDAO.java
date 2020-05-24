package dao;

import model.Admin;

import java.sql.SQLException;
import java.util.List;

public interface IAdminDAO {
    public Admin checkValid(String username, String password);
    public List<Admin> selectAllAdmin();
    public Admin selectAdmin(String adName);
    public void insertAdmin(Admin admin) throws SQLException;
    public boolean deleteAdmin(String adName) throws SQLException;
    public boolean updateAdmin(Admin admin, String adName) throws SQLException;
}
