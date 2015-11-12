/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.dao;

import com.la.constant.Constant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

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

        dbConnection = GetConnection.getConnection();
        ArrayList<String> createTableSQL = new ArrayList<String>(Arrays.asList(Constant.ADMIN_SUBJECTCONTAINER_TABLE, Constant.ADMIN_QUESTIONS_TABLE, Constant.ADMIN_QUESTIONSPREVIEWS_TABLE));

        for (String str : createTableSQL) {
            System.out.println(str);
            try {
                if (dbConnection != null) {
                    preparedStatement = dbConnection.prepareStatement(str);
                    status = preparedStatement.executeUpdate();
                    if (status == 0) {
                        status = 1;
                    }
                }
            } catch (SQLException ex) {
                System.out.println(AdminTableDao.class.getName() + ex.getMessage());
                if (ex.getMessage().contains("already exists")) {
                    status =  Constant.TABLE_ALREADY_EXIST_EXCEPTION;
                }

            }
            finally{
                createTableSQL = null;
                preparedStatement = null;
                try {
                    dbConnection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(AdminTableDao.class.getName()).log(Level.SEVERE, null, ex);
                }
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
