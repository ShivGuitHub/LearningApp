/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.dao;

import com.la.constant.Constant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Administrator
 */
public class AdminTableDao {

    private static AdminTableDao instance = null;

    public static AdminTableDao getInstance() {
        if (instance == null) {
            instance = new AdminTableDao();
        }
        return instance;
    }

    public static int adminTableCreationDao() {
        int status = 0;
        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;
        try {
            String createTableSQL = Constant.ADMIN_SUBJECT_TABLE;
            dbConnection = GetConnection.getConnection();
            if (dbConnection != null) {
                preparedStatement = dbConnection.prepareStatement(createTableSQL);
                status = preparedStatement.executeUpdate();
                if (status == 0) {
                    status = 1;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            if (ex.getMessage().contains("already exists")) {
                return Constant.TABLE_ALREADY_EXIST_EXCEPTION;
            }

        }
        return status;
    }
//Tester
//    public static void main(String[] args) {
//        int i = adminTableCreationDao();
//        System.out.println("i = " + i);
//    }
}
