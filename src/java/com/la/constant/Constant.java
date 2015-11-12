/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.constant;

/**
 *
 * @author shiv.kushwaha
 */
public class Constant {

//    public static final String CONNECTION_DRIVER = "com.mysql.jdbc.Driver";
//    public static final String CONNECTION_STRING = "jdbc:mysql";
//    public static final String CONNECTION_DATABASEIP = "127.0.0.1";
//    public static final String CONNECTION_PORT = "3306";
//    public static final String CONNECTION_DATABASENAME = "la";
//    public static final String CONNECTION_USERNAME = "root";
//    public static final String CONNECTION_PASSWORD = "admin";
    public static final String CONNECTION_DRIVER = "com.mysql.jdbc.Driver";
    public static final String CONNECTION_STRING = "jdbc:mysql";
    public static final String CONNECTION_DATABASEIP = "sql6.freemysqlhosting.net";
    public static final String CONNECTION_PORT = "3306";
    public static final String CONNECTION_DATABASENAME = "sql695727";
    public static final String CONNECTION_USERNAME = "sql695727";
    public static final String CONNECTION_PASSWORD = "eB4!bT2!";
    //Exception
    public static final int SQL_EXCEPTION = -1001;
    public static final int GENERAL_EXCEPTION = -1002;
    public static final int TABLE_ALREADY_EXIST_EXCEPTION = -1003;
    
    
    //Admin Table Testing
    public static final String ADMIN_SUBJECT_TABLE ="CREATE TABLE SUBJECTCONTAINER(SUBJECTID SMALLINT, SUBJECTNAME TEXT)";
}
