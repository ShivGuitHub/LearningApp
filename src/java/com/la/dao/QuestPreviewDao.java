/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.la.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import net.sf.json.JSONObject;

/**
 *
 * @author shiv.kushwaha
 */
public class QuestPreviewDao {
 
      private static QuestPreviewDao instance = null;
      
     public static QuestPreviewDao getInstance() {
        if (instance == null) {
            instance = new QuestPreviewDao();
        }
        return instance;
    }
     
      public JSONObject insertQuestPreviewServiceDao(String questionId, String questionSubject,String questionAnswer) {
        int rStatus = 0;
         Connection dbConnection = null;
        PreparedStatement preparedStatement = null;
        JSONObject jQuestPreview = null;
        String insertTableSQL = "INSERT INTO QUESTIONSPREVIEWS"
                + "(QUESTNO,QUESTSUBJECT,QUESTANSWER) VALUES"
                + "(?,?,?)";
        
        return  jQuestPreview;
      }
}
