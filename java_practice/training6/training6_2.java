package java_practice.training6;
import java.util.Scanner;
import java.util.zip.GZIPOutputStream;
import java.io.*;

public class training6_2 {
    public static void main(String[] args) throws IOException{
        Scanner stdIn = new Scanner(System.in);
        System.out.print("コピー元ファイル名：");
        String copedFileName = stdIn.nextLine();
        System.out.print("コピー先ファイル名：");
        String fileName = stdIn.nextLine();

        try{
            // ファイルのデータ読み込み
            FileInputStream fis = new FileInputStream(copedFileName);
            int b = fis.read();
            
            // ファイルのデータを出力
            FileOutputStream fos = new FileOutputStream(fileName);

            // ファイルの書き込み前にバッファリング
            BufferedOutputStream bos = new BufferedOutputStream(fos);

            // ファイルの圧縮
            GZIPOutputStream zip = new GZIPOutputStream(fos);

            fos.write(b);
            fos.close();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            fos.close();
        };
    }
}
