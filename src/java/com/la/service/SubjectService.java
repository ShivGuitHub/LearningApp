/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.service;

import com.la.dao.SubjectDataDao;
import net.sf.json.JSONObject;

/**
 *
 * @author shiv.kushwaha
 */
public class SubjectService {

    private static SubjectService instance = null;

    public static SubjectService getInstance() {
        if (instance == null) {
            instance = new SubjectService();
        }
        return instance;
    }

    public JSONObject insertSubjectDataService(String subjectID, String subjectName) {
        JSONObject subjectObj = null;
        subjectID = subjectID.trim();
        subjectName = subjectName.trim();
        SubjectDataDao subjectDataDaoObject = SubjectDataDao.getInstance();
        subjectObj = subjectDataDaoObject.insertSubjectDataDao(subjectID, subjectName);

        return subjectObj;
    }

    public JSONObject getSubjectDataService() {
        JSONObject subjectObj = null;
        SubjectDataDao subjectDataDaoObject = SubjectDataDao.getInstance();
        subjectObj = subjectDataDaoObject.getSubjectDataDao();
        return subjectObj;
    }

    public JSONObject removeParticularSubjectDataService(int id) {
        JSONObject subjectObj = null;
        SubjectDataDao subjectDataDaoObject = SubjectDataDao.getInstance();
        subjectObj = subjectDataDaoObject.removeParticularSubjectDataDao(id);
        return subjectObj;
    }

       public JSONObject updateParticularSubjectDataService(int id, String subjectName) {
        JSONObject subjectObj = null;
        SubjectDataDao subjectDataDaoObject = SubjectDataDao.getInstance();
        subjectObj = subjectDataDaoObject.updateParticularSubjectDataDao(id, subjectName);
        return subjectObj;
    }
    public static void main(String[] args) {

        SubjectService a = new SubjectService();
        System.out.println("hi..");
        System.out.println(a.getSubjectDataService());

    }
}
