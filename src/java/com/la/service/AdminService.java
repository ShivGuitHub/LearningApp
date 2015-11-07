/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.service;

import com.la.dao.AdminTableDao;

/**
 *
 * @author shiv.kushwaha
 */
public class AdminService {
    static
    {
        int status = adminTableCreation();
        if(status == 1)
        {
            System.out.println("Admin Table::SUBJECTCONTAINER has been created successfully");
        }
        
    }
     public boolean adminLoginAuthentication(String userName, String userPassword)
    {
        if(userName.equals("scott") && userPassword.equals("tiger"))
        {
            return true;
        }
        else
        {
            return false;
        }
    }
     
      public static int adminTableCreation()
    {
        int status = 0;
        status = AdminTableDao.adminTableCreationDao();
        return status;
    }
}
