/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actionsupportpackage;

import static com.opensymphony.xwork2.Action.SUCCESS;
import static com.opensymphony.xwork2.Action.ERROR;
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
public class InsertUserActionSupport extends ActionSupport implements SessionAware{
    String username, password, password_confirmation, email, firstname, lastname, type_wocode;
    Session hibernateSession;
    User user_aux_username, user_aux_email;
    User user;
    
    final static String RESTRICTED = "restricted";
    
    public InsertUserActionSupport() {
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
        
        int type = -1;
        switch(type_wocode){
            case "Administrador":
                type = 1;
                break;
            case "Profesor(a)":
                type = 2;
                break;
        }
        
        hibernateSession=HibernateUtil.getSessionFactory().openSession(); 
 
        Transaction t1 = hibernateSession.beginTransaction();
        user_aux_username = (User) hibernateSession.createQuery("FROM User WHERE username ='" + username + "'").uniqueResult();
        t1.commit();
        if(user_aux_username==null){
            if(password_confirmation.equals(password)){
                Transaction t2 = hibernateSession.beginTransaction();
                user_aux_email = (User) hibernateSession.createQuery("FROM User WHERE email ='" + email + "'").uniqueResult();
                t2.commit();
                if(user_aux_email==null){
                    Transaction t3=hibernateSession.beginTransaction();
                    user = new User(username, password, email, firstname, lastname, type);
                    hibernateSession.save(user);
                    t3.commit();
                    addActionMessage("Usuario registrado exitosamente.");
                    return SUCCESS;
                } else {
                    addActionError("El email ingresado ya está registrado para otro usuario. \n");
                    return ERROR;
                }
            } else {
                addActionError("La confirmación de contraseña no coincide con la contraseña ingresada. \n");
                return ERROR;
            }
        } else {
            addActionError("El nombre de usuario ingresado ya está en uso. \n");
            return ERROR;
        }
        
        
        /*
        //Select
        Login user1=(Login)hibernateSession.load(Login.class, 1);
        System.out.println(user1.getIdLogin());
        System.out.println(user1.getUsername());
        System.out.println(user1.getPassword());
 
        //Update
        Transaction t1=hibernateSession.beginTransaction();
        user1.setPassword("456");
        hibernateSession.update(user1);
        t1.commit();
 
        //Delete
        Transaction t2=hibernateSession.beginTransaction(); 
        Login user2=(Login)hibernateSession.load(Login.class,9);
        hibernateSession.delete(user2);
        t2.commit(); */
        
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword_confirmation() {
        return password_confirmation;
    }

    public void setPassword_confirmation(String password_confirmation) {
        this.password_confirmation = password_confirmation;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getType_wocode() {
        return type_wocode;
    }

    public void setType_wocode(String type_wocode) {
        this.type_wocode = type_wocode;
    }

    public Session getHibernateSession() {
        return hibernateSession;
    }

    public void setHibernateSession(Session hibernateSession) {
        this.hibernateSession = hibernateSession;
    }

    public User getUser_aux_username() {
        return user_aux_username;
    }

    public void setUser_aux_username(User user_aux_username) {
        this.user_aux_username = user_aux_username;
    }

    public User getUser_aux_email() {
        return user_aux_email;
    }

    public void setUser_aux_email(User user_aux_email) {
        this.user_aux_email = user_aux_email;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
   

    
    
}
