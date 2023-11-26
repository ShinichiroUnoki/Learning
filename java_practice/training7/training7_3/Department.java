package java_practice.training7.training7_3;
import java.io.Serializable;
import java_practice.training7.training7_3.Employee;


public class Department implements Serializable{
    private String name;
    private Employee leader;

    public String getName(){return this.name;}
    public void setName(String name){this.name = name;}

    public Employee getLeader(){return this.leader;}
    public void setLeader(Employee leader){this.leader = leader;}

}
