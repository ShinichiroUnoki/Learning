package java_practice.training7.training7_3;

import java_practice.training7.training7_3.Employee;
import java_practice.training7.training7_3.Department;

import java.io.*;
import java.util.*;

public class Main implements Serializable{
    public static void main(String[] args) throws FileNotFoundException, IOException{
        // インスタンスの生成
        Employee e = new Employee();
        e.setName("田中太郎");
        e.setAge(41);
        Department d = new Department();
        d.setName("総務部");
        d.setLeader(e);

        FileOutputStream fos = new FileOutputStream("./company.dat");
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeObject(d);
        oos.flush();
        oos.close();
    }    
}
