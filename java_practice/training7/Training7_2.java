package java_practice.training7;
import java.io.*;
import java.util.*;

public class Training7_2 {
    public static void main(String[] args) throws IOException{
        ResourceBundle rb = ResourceBundle.getBundle("java_practice.training7.pref");

        String capital = rb.getString("aichi.capital");
        String food =  rb.getString("aichi.food");

        System.out.print(capital + ":");
        System.out.print(food + "\n");

    }    
}
