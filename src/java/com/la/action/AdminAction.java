/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.action;

import com.la.bean.AdminFormBean;
import com.la.service.AdminService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author shiv.kushwaha
 */
public class AdminAction extends org.apache.struts.action.Action {

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        AdminFormBean adminLoginForm = (AdminFormBean) form;
        AdminService adminLoginService = new AdminService();
        boolean validLogin = adminLoginService.adminLoginAuthentication(adminLoginForm.getUsername(), adminLoginForm.getPassword());

        if (validLogin) {
            return mapping.findForward("adminpanel");
        } else {
            request.setAttribute("errormsg", "Admin couldn't be authenticate!");
            return mapping.findForward("laadmin");
        }
    }
}
