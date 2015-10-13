/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.dao;

/**
 *
 * @author shiv.kushwaha
 */
import com.la.constant.Constant;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnection {

    static Connection conn = null;

    public static Connection getConnection() {
        try {
            String driver = Constant.CONNECTION_DRIVER;
            String connection = Constant.CONNECTION_STRING + "://" + Constant.CONNECTION_DATABASEIP + ":" + Constant.CONNECTION_PORT + "/" + Constant.CONNECTION_DATABASENAME;
            String user = Constant.CONNECTION_USERNAME;
            String password = Constant.CONNECTION_PASSWORD;

            Class.forName(driver);
            conn = DriverManager.getConnection(connection, user, password);

        } catch (ClassNotFoundException ex) {
            System.out.println(GetConnection.class.getName()+ "ClassNotFoundException: - " + ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(GetConnection.class.getName()+ "SQLException: - " + ex.getMessage());
        }

        return conn;
    }

    public static void main(String[] args) {

        Connection a = GetConnection.getConnection();
    }
}
