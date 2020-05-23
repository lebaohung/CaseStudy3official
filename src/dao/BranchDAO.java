package dao;

import model.Branch;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BranchDAO {
    private static final String select_all_branch = "select * from branch";

    public BranchDAO() {
    }

    Connection connection = JdbcConnection.getConnection();
    public List<Branch> selectAllBranch() {
        List<Branch> branchList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(select_all_branch);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String phone = rs.getString("phone");
                String name = rs.getString("name");
                String add = rs.getString("address");
                branchList.add(new Branch(phone, name, add));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return branchList;
    }
}
