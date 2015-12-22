/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.service;

import com.la.dao.QuestPreviewDao;
import net.sf.json.JSONObject;

/**
 *
 * @author shiv.kushwaha
 */
public class QuestPreviewService {
    
     private static QuestPreviewService instance = null;

    public static QuestPreviewService getInstance() {
        if (instance == null) {
            instance = new QuestPreviewService();
        }
        return instance;
    }
    
      public JSONObject insertQuestPreviewDataService(String questionId,String questionSubject,String questionAnswer) {
        JSONObject subjectObj = null;
        questionId = questionId.trim();
        questionSubject = questionSubject.trim();
        questionAnswer = questionAnswer.trim();
        
        QuestPreviewDao questPreviewServiceDaoObject = QuestPreviewDao.getInstance();
        subjectObj = questPreviewServiceDaoObject.insertQuestPreviewServiceDao(questionId, questionSubject,questionAnswer);

        return subjectObj;
    }

}
