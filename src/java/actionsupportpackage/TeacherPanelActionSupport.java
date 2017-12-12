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
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class TeacherPanelActionSupport extends ActionSupport implements SessionAware {
    private List list;
    private Map<String, Object> sessionMap;

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }
    
    
    public TeacherPanelActionSupport() {
    }
    
    public String execute() throws Exception {
        User current_user = (User) sessionMap.get("current_user");
     
        
        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        Transaction t = hibernateSession.beginTransaction();
        System.out.println("----------SE VA A HACER LA CONSULTA-------------");
        list = hibernateSession.createQuery("from Exercise where idUser = :user").setParameter("user", current_user.getIdUser()).list();
        Iterator it = list.iterator();
        while(it.hasNext()) {
            Exercise e = (Exercise) it.next();
            System.out.println(e.getSelecteds());
        }
        t.commit();
        hibernateSession.close();
        System.out.println("----------SE HIZO LA CONSULTA-------------");
        
        return SUCCESS;
    }

    @Override
    public void setSession(Map<String, Object> map) {
        this.sessionMap = map;
    }
    
}
