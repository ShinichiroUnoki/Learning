package java_practice.training7.training7_3;
import java.io.Serializable;

public class Employee implements Serializable{
    private String name;
    private int age;

    public String getName(){return this.name;}
    public void setName(String name){this.name = name;}

    public int getAge(){return this.age;}
    public void setAge(int age){this.age = age;}
}
