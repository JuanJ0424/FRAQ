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
import java.util.HashSet;
import java.util.Iterator;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Juan
 */
public class EditExerciseActionSupport extends ActionSupport {
    
    private int idExercise;
    private int rows;
    private int columns;
    private int selecteds;
    
    public EditExerciseActionSupport() {
    }

    public int getIdExercise() {
        return idExercise;
    }

    public void setIdExercise(int idExercise) {
        this.idExercise = idExercise;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getColumns() {
        return columns;
    }

    public void setColumns(int columns) {
        this.columns = columns;
    }

    public int getSelecteds() {
        return selecteds;
    }

    public void setSelecteds(int selecteds) {
        this.selecteds = selecteds;
    }
    
    public String execute() throws Exception {
        System.out.println("--------- ACTUALIZANDO EJERCICIO------------");
        System.out.println("Selecteds por parametro " + selecteds);
        System.out.println("rows por parametro" + rows);
        System.out.println("columns por parametro" + columns);
        Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
        Transaction t = hibernateSession.beginTransaction();
        Exercise e = (Exercise) hibernateSession.load(Exercise.class, idExercise);
        Iterator it = e.getSelecteds().iterator();
        while (it.hasNext()) {
            Selected s = (Selected) it.next();
            hibernateSession.delete(s);
        }
        e.setSelecteds(new HashSet(0));
        hibernateSession.update(e);
        for (int i = 0; i<rows; i++ ) {
            for (int j = 0; j < columns; j++){
                System.out.println("i " + i + "j" + j + "selecteds" + selecteds);
                if(selecteds>0) {
                    Selected s = new Selected(e, i, j);
                    e.addSelected(s);
                    
                } else {
                    break;
                }
                selecteds -= 1;
            }
        }
        hibernateSession.save(e);
        t.commit();
        hibernateSession.close();
        System.out.println("Selecteds al actualizar" + e.getSelecteds().size());
        System.out.println("--------- FIN DE LA ACTUALIZACIÓN EJERCICIO------------");
        return SUCCESS;
    }
    
}
