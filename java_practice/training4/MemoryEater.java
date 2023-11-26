package java_practice.training4;

import java.util.Locale;

public class MemoryEater {
    public static void main(String[] args){
        long[] me = new long[1280000];
        Locale locale = Locale.getDefault();
        if(locale.toString().equals("en_JP")){
            System.out.println("メモリを消費しています...");
        }else{
            System.out.println("eating memory...");
        }
    }
}
