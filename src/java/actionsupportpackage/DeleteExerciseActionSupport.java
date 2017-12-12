/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actionsupportpackage;

import com.opensymphony.xwork2.ActionSupport;
import entity.Exercise;
import entity.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Juan
 */
public class DeleteExerciseActionSupport extends ActionSupport {
    
    int idExercise;

    public int getIdExercise() {
        return idExercise;
    }

    public void setIdExercise(int idExercise) {
        this.idExercise = idExercise;
    }
    
    public DeleteExerciseActionSupport() {
    }
    
    public String execute() throws Exception {
        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        Transaction t = hibernateSession.beginTransaction();
        Exercise e = (Exercise)hibernateSession.load(Exercise.class, idExercise);
        
        hibernateSession.delete(e);
        t.commit();
        hibernateSession.close();
        return SUCCESS;
    }
    
}
