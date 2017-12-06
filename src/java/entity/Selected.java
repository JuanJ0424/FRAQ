package entity;
// Generated 05-dic-2017 21:13:10 by Hibernate Tools 4.3.1



/**
 * Selected generated by hbm2java
 */
public class Selected  implements java.io.Serializable {


     private Integer idSelected;
     private Exercise exercise;
     private Integer x;
     private Integer y;

    public Selected() {
    }

	
    public Selected(int idSelected, Exercise exercise) {
        this.idSelected = idSelected;
        this.exercise = exercise;
    }
    public Selected(int idSelected, Exercise idExercise, Integer x, Integer y) {
       this.idSelected = idSelected;
       this.exercise = exercise;
       this.x = x;
       this.y = y;
    }
    
    public Selected(int idSelected, Exercise idExercise, Integer x) {
       this.idSelected = idSelected;
       this.exercise = exercise;
       this.x = x;
    }
   
    public Integer getIdSelected() {
        return this.idSelected;
    }
    
    public void setIdSelected(Integer idSelected) {
        this.idSelected = idSelected;
    }

    public Exercise getExercise() {
        return exercise;
    }
    
    public void setExercise(Exercise exercise) {
        this.exercise = exercise;
    }

    public Integer getX() {
        return this.x;
    }
    
    public void setX(Integer x) {
        this.x = x;
    }
    public Integer getY() {
        return this.y;
    }
    
    public void setY(Integer y) {
        this.y = y;
    }




}

