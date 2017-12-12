/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actionsupportpackage;

import static com.opensymphony.xwork2.Action.ERROR;
import com.opensymphony.xwork2.ActionSupport;
import entity.User;
import entity.HibernateUtil;
import java.util.Map;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Ximena
 */
public class LoginActionSupport extends ActionSupport implements SessionAware{
   
    String username, password;
    Session hibernateSession;
    User login;
    
    final static String ADMIN = "admin";
    final static String TEACHER = "teacher";
    final static String FAIL = "fail";
    
    public LoginActionSupport() {
    }
    
    private Map<String, Object> sessionMap;
    
    @Override
    public void setSession(Map<String, Object> sessionMap){
        this.sessionMap = sessionMap;
    }   
    
    public String login() throws Exception {
        
        hibernateSession = HibernateUtil.getSessionFactory().openSession(); 
        Transaction t1 = hibernateSession.beginTransaction();
        login = (User) hibernateSession.createQuery("FROM User WHERE username ='" + username + "'AND password ='" + password + "'").uniqueResult();
        t1.commit();
        hibernateSession.close();
 
        if(username!=null && password!=null &&(!username.equals(""))&&(!password.equals(""))){
            if(login!=null){
                sessionMap.put("current_user", login);
                System.out.println("---------------SE PUSO EL CURRENT USER EN LA SESSION ------------");
                System.out.println(sessionMap.get("current_user"));
                switch(login.getType()){
                    case 1: 
                        sessionMap.put("type", 1);
                        return ADMIN;
                    case 2:
                        return TEACHER;
                }
            }    
        }

        addActionError("El usuario ingresado no está registrado o la contraseña es incorrecta.");
        return ERROR;
        
        
    }
    
    public String logout() throws Exception {
        sessionMap.remove("current_user");
        addActionMessage("Se cerró la sesión");
        return SUCCESS;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String userName) {
        this.username = userName;
    }
    
}
