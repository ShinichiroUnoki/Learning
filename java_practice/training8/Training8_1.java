package java_practice.training8;
import java.net.*;
import java.io.*;

public class Training8_1{
    public static void main(String[] args) throws IOException{
        // コマンド
        //     // javac java_practice/training8/Training8_1.java
        //     // java -cp /Users/unokishinichiro/Practice java_practice.training8.Training8_1
        URL url = new URL("https://dokojava.jp/favicon.ico");
        
        InputStream is = url.openStream();
        FileOutputStream fos = new FileOutputStream("/Users/unokishinichiro/Practice/java_practice/training8/image/dj.ico");
        // 次回参考：https://workteria.forward-soft.co.jp/blog/detail/10272#:~:text=%E3%81%84%E3%81%A8%E6%80%9D%E3%81%84%E3%81%BE%E3%81%99%E3%80%82-,BufferedInputStream%20/%20BufferedOutputStream%E3%81%AE%E3%82%B5%E3%83%B3%E3%83%97%E3%83%AB%E3%82%B3%E3%83%BC%E3%83%89,-import%20java.
        
        int i = is.read();
        
        while(i != -1){
            fos.write((byte)i);
            System.out.println((byte)i);
            i = is.read();
        }
        
        is.close();
        fos.flush();
        fos.close();
    }
}