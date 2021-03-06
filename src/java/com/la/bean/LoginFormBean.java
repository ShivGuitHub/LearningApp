/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.bean;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author shiv.kushwaha
 */
public class LoginFormBean extends org.apache.struts.action.ActionForm {

    private String username;
    private String password;

    /**
     *
     */
    public LoginFormBean() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    public void reset(ActionMapping actionMapping, HttpServletRequest request) {
        // TODO: Write method body
        this.username = null;
        this.password = null;
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();

        if (getUsername() == null || getUsername().length() < 1) {
            errors.add("username", new ActionMessage("errors.required", "username"));
        }
        if (getPassword() == null || getPassword().length() < 1) {
            errors.add("password", new ActionMessage("errors.required", "password"));
        }
        return errors;

    }
}
