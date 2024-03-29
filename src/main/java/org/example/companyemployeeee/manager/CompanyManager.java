package org.example.companyemployeeee.manager;

import org.example.companyemployeeee.db.DBConnectionProvider;
import org.example.companyemployeeee.model.Company;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompanyManager {

    Connection connection = DBConnectionProvider.getInstance().getConnection();
    private UserManager userManager = new UserManager();

    public List<Company> getCompanies() {
        String sql = "SELECT * FROM company";
        List<Company> companies = new ArrayList<>();
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                companies.add(Company.builder()
                        .id(resultSet.getInt("id"))
                        .name(resultSet.getString("name"))
                        .address(resultSet.getString("address"))
                        .user(userManager.getUserByID(resultSet.getInt("user_id")))
                        .build());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companies;
    }

    public Company getCompanyById(int id) {
        String sql = "SELECT * FROM company WHERE id = " + id;

        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return Company.builder()
                        .id(resultSet.getInt("id"))
                        .name(resultSet.getString("name"))
                        .address(resultSet.getString("address"))
                        .user(userManager.getUserByID(resultSet.getInt("user_id")))
                        .build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void add(Company company) {
        String sql = "INSERT INTO company (name, address, user_id) VALUES (?,?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            preparedStatement.setString(1, company.getName());
            preparedStatement.setString(2, company.getAddress());
            preparedStatement.setInt(3, company.getUser().getId());
            preparedStatement.executeUpdate();
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int id = generatedKeys.getInt(1);
                company.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM company WHERE id = " + id;
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Company company) {

        String sql = "UPDATE company SET name = ?, address = ?  WHERE id = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, company.getName());
            preparedStatement.setString(2, company.getAddress());
            preparedStatement.setInt(3, company.getId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
