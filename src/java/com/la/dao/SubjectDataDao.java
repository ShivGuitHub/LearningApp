/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.dao;

import com.la.constant.Constant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author shiv.kushwaha
 */
public class SubjectDataDao {

    private static SubjectDataDao instance = null;

    public static SubjectDataDao getInstance() {
        if (instance == null) {
            instance = new SubjectDataDao();
        }
        return instance;
    }

    public JSONObject insertSubjectDataDao(String subjectID, String subjectName) {
        int rStatus = 0;

        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;
        JSONObject jSubject = null;
        String insertTableSQL = "INSERT INTO SUBJECTCONTAINER"
                + "(SUBJECTID, SUBJECTNAME) VALUES"
                + "(?,?)";

        try {
            jSubject = new JSONObject();
            dbConnection = GetConnection.getConnection();
            if (dbConnection != null) {
                preparedStatement = dbConnection.prepareStatement(insertTableSQL);

                preparedStatement.setInt(1, Integer.valueOf(subjectID));
                preparedStatement.setString(2, subjectName);
                // execute insert SQL stetement
                preparedStatement.executeUpdate();
                rStatus = 1;
                jSubject.put("RSTATUS", rStatus);
                jSubject.put("DESCRIPTION", "Record has been inserted successfully");
                jSubject.put("SUBJECTID", subjectID);
                jSubject.put("SUBJECTNAME", subjectName);
                System.out.println("Success: " + SubjectDataDao.class.getName() + "Record has been inserted into SUBJECTCONTAINER table!");
            } else {
                jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                jSubject.put("DESCRIPTION", "DB Connection has not been established!!");
            }
        } catch (SQLException ex) {
            jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
            jSubject.put("DESCRIPTION", ex.getMessage());
            System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());

        } finally {

            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                    jSubject.put("DESCRIPTION", ex.getMessage());
                    System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                }
            }

            if (dbConnection != null) {
                try {
                    dbConnection.close();
                } catch (SQLException ex) {
                    jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                    jSubject.put("DESCRIPTION", ex.getMessage());
                    System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                }
            }

        }

        return jSubject;
    }

    public JSONObject getSubjectDataDao() {

        int subjectID = 0;
        String subjectName = null;
        String queryString = null;
        Connection dbConnection = null;
        Statement stmt = null;
        JSONObject jObj = null;
        JSONObject jSubject = null;
        JSONArray jArray = null;
        try {
            jObj = new JSONObject();
            jSubject = new JSONObject();
            jArray = new JSONArray();

            dbConnection = GetConnection.getConnection();
            if (dbConnection != null) {
                stmt = dbConnection.createStatement();

                queryString = "SELECT * FROM SUBJECTCONTAINER";
                ResultSet rs = stmt.executeQuery(queryString);
                jSubject.put("RSTATUS", 1);
                jSubject.put("DESCRIPTION", "Data has been retrived successfully");
                while (rs.next()) {

                    subjectID = rs.getInt("SUBJECTID");
                    subjectName = rs.getString("SUBJECTNAME");

                    jObj.put("SUBJECTID", subjectID);
                    jObj.put("SUBJECTNAME", subjectName);
                    jArray.add(jObj);
                }
                jSubject.put("SUBJECTS", jArray);
                rs.close();
            } else {
                jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                jSubject.put("DESCRIPTION", "DB Connection has not been established!!");
            }
        } catch (SQLException ex) {
            jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
            jSubject.put("DESCRIPTION", "Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
            System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
        } catch (Exception ex) {
            jSubject.put("RSTATUS", Constant.GENERAL_EXCEPTION);
            jSubject.put("DESCRIPTION", "Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
            System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException ex) {
                jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                jSubject.put("DESCRIPTION", "Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
            }
            try {
                if (dbConnection != null) {
                    dbConnection.close();
                }
            } catch (SQLException ex) {
                jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                jSubject.put("DESCRIPTION", "Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
            }
            if (jObj != null) {
                jObj.clear();
                jObj = null;
            }

            if (jArray != null) {
                jArray.clear();
                jArray = null;
            }
        }
        return jSubject;
    }

    public JSONObject removeParticularSubjectDataDao(int id) {

        String queryString = null;
        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;
        JSONObject jSubject = null;

        try {
            jSubject = new JSONObject();
            dbConnection = GetConnection.getConnection();
            if (dbConnection != null) {
                queryString = "DELETE FROM SUBJECTCONTAINER WHERE SUBJECTID = ?";
                preparedStatement = dbConnection.prepareStatement(queryString);
                preparedStatement.setInt(1, id);

                // execute insert SQL stetement
                preparedStatement.executeUpdate();
                jSubject.put("RSTATUS", 1);
                jSubject.put("DESCRIPTION", "Record has been deleted successfully");

                System.out.println("Success: " + SubjectDataDao.class.getName() + " ID: " + String.valueOf(id) + "Record has been deleted from SUBJECTCONTAINER table!");
            } else {
                jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                jSubject.put("DESCRIPTION", "DB Connection has not been established!!");
            }
        } catch (SQLException ex) {
            jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
            jSubject.put("DESCRIPTION", ex.getMessage());

            System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
        } catch (Exception ex) {
            jSubject.put("RSTATUS", Constant.GENERAL_EXCEPTION);
            jSubject.put("DESCRIPTION", ex.getMessage());
            System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
        } finally {

            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                    jSubject.put("DESCRIPTION", ex.getMessage());
                    System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                }
            }

            if (dbConnection != null) {
                try {
                    dbConnection.close();
                } catch (SQLException ex) {
                    jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                    jSubject.put("DESCRIPTION", ex.getMessage());
                    System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                }
            }

        }
        return jSubject;
    }

    public JSONObject updateParticularSubjectDataDao(int id, String subjectName) {

        String queryString = null;
        Connection dbConnection = null;
        PreparedStatement preparedStatement = null;
        JSONObject jSubject = null;

        try {
            jSubject = new JSONObject();
            dbConnection = GetConnection.getConnection();
            if (dbConnection != null) {
                queryString = "UPDATE SUBJECTCONTAINER SET SUBJECTNAME = ? WHERE SUBJECTID = ?";
                preparedStatement = dbConnection.prepareStatement(queryString);
                preparedStatement.setString(1, subjectName);
                preparedStatement.setInt(2, id);

                // execute insert SQL stetement
                preparedStatement.executeUpdate();
                jSubject.put("RSTATUS", 1);
                jSubject.put("DESCRIPTION", "Subject ID: - " + id + ", Record has been updated successfully");

                System.out.println("Success: " + SubjectDataDao.class.getName() + " ID: " + String.valueOf(id) + "Record has been updated from SUBJECTCONTAINER table!");
            } else {
                jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                jSubject.put("DESCRIPTION", "DB Connection has not been established!!");
            }
        } catch (SQLException ex) {
            jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
            jSubject.put("DESCRIPTION", ex.getMessage());

            System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
        } catch (Exception ex) {
            jSubject.put("RSTATUS", Constant.GENERAL_EXCEPTION);
            jSubject.put("DESCRIPTION", ex.getMessage());
            System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
        } finally {

            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException ex) {
                    jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                    jSubject.put("DESCRIPTION", ex.getMessage());
                    System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                }
            }

            if (dbConnection != null) {
                try {
                    dbConnection.close();
                } catch (SQLException ex) {
                    jSubject.put("RSTATUS", Constant.SQL_EXCEPTION);
                    jSubject.put("DESCRIPTION", ex.getMessage());
                    System.out.println("Exception: " + SubjectDataDao.class.getName() + ex.getMessage());
                }
            }

        }
        return jSubject;
    }
}
