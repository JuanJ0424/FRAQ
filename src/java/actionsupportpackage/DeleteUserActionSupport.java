/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actionsupportpackage;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import entity.HibernateUtil;
import entity.User;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Ximena
 */
public class DeleteUserActionSupport extends ActionSupport implements SessionAware{
    
    int idUser;
    Session hibernateSession;
    
    final static String RESTRICTED = "restricted";
    
    public DeleteUserActionSupport() {
    }
    
    private Map<String, Object> sessionMap;
    
    @Override
    public void setSession(Map<String, Object> sessionMap){
        this.sessionMap = sessionMap;
    }   
    
    public String execute() throws Exception {
        
        if(sessionMap.get("current_user")==null){
            addActionError("Aún no ha iniciado sesión. Inicie sesión como administrador para acceder a esta página.");
            return ERROR;
        }
        if((int)sessionMap.get("type")!=1){
            addActionError("No tiene permisos para ver esta página.");
            System.out.println(sessionMap.get("type"));
            return RESTRICTED;
        }
        
        hibernateSession=HibernateUtil.getSessionFactory().openSession(); 
  
        Transaction t=hibernateSession.beginTransaction(); 
        User user=(User)hibernateSession.load(User.class, idUser);
        hibernateSession.delete(user);
        t.commit(); 
 
        return SUCCESS;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
    
    
}
