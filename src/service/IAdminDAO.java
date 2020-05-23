package service;

import model.Admin;

import java.util.List;

public interface IAdminDAO {
    public Admin checkValid(String username, String password);
    public List<Admin> selectAllAdmin();
}
