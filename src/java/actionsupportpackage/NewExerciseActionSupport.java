/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actionsupportpackage;

import com.opensymphony.xwork2.ActionSupport;
import entity.Exercise;
import entity.HibernateUtil;
import entity.Selected;
import entity.User;
import java.util.HashSet;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Juan
 */
public class NewExerciseActionSupport extends ActionSupport implements SessionAware{
    
    private Map<String, Object> sessionMap;
    private int columns;
    private int rows;
    private int selecteds;
    private String name;
    
    public NewExerciseActionSupport() {
    }
    
    public String execute() throws Exception {
        System.out.println("----------- SE LLAMA A NEWEXERCISE ACTION ------------");
        User current_user = (User) sessionMap.get("current_user");
        System.out.println("Selecteds.size " + selecteds);
        Exercise e = new Exercise(current_user, 1, columns, rows);
        e.setName(name);
        for (int i = 0; i<rows; i++ ) {
            for (int j = 0; j < columns; j++){
                if(selecteds>0) {
                    Selected s = new Selected(e, i, j);
                    e.addSelected(s);
                    
                } else {
                    break;
                }
                selecteds -= 1;
            }
        }
        
        
        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        Transaction t = hibernateSession.beginTransaction();
        System.out.println("El ejercicio tiene " + e.getSelecteds().size() + " selecteds");
        hibernateSession.save(e);
        t.commit();
        hibernateSession.close();
        
        return SUCCESS;
    }

    public int getColumns() {
        return columns;
    }

    public void setColumns(int columns) {
        this.columns = columns;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getSelecteds() {
        return selecteds;
    }

    public void setSelecteds(int selecteds) {
        this.selecteds = selecteds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    

    @Override
    public void setSession(Map<String, Object> map) {
        this.sessionMap = map;
    }
    
}
