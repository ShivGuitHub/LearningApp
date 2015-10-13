/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.service;

/**
 *
 * @author shiv.kushwaha
 */
public class AdminService {
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
}
