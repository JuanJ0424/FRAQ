/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package actionsupportpackage;

import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import entity.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Ximena
 */
public class UserListActionSupport extends ActionSupport {
    
    private List lista;
    
    public UserListActionSupport() {
    }
    
    public String execute() throws Exception {
        Session hibernateSession;
  
        hibernateSession = HibernateUtil.getSessionFactory().openSession(); 
        Query consulta=hibernateSession.createQuery("from User");
        lista = consulta.list();
 
        return SUCCESS;
    }
    
    public List getLista() {
        return lista;
    }

    public void setLista(List lista) {
        this.lista = lista;
    }
    
}
