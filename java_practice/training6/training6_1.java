package java_practice.training6;
import java.util.Scanner;
import java.io.*;

public class training6_1 {
    public static void main(String[] args) throws IOException{
        Scanner stdIn = new Scanner(System.in);
        System.out.print("コピー元ファイル名：");
        String copedFileName = stdIn.nextLine();
        System.out.print("コピー先ファイル名：");
        String fileName = stdIn.nextLine();

        FileInputStream fis = new FileInputStream(copedFileName);
        int b = fis.read();
        FileOutputStream fos = new FileOutputStream(fileName);
        fos.write(b);
        fos.close();

    }
}
