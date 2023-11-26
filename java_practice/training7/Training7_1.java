package java_practice.training7;

import java.io.*;
import java.util.*;

public class Training7_1 {
    public static void main(String[] args) throws IOException{
        Reader fr = new FileReader("/Users/unokishinichiro/Practice/java_practice/training7/pref.properties");
        Properties p =  new Properties();
        p.load(fr);

        String capital = p.getProperty("aichi.capital");
        String food = p.getProperty("aichi.food");

        System.out.print(capital + ":");
        System.out.print(food + "\n");

        fr.close();
    }    
}
