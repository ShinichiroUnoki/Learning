import java.io.IOException;
import java.util.io.*;
import java.util.zip.GZIPOutputStream;

public class Answer6_2 {
    public static void main(String[] args){
        if(args.length != 2){
            System.out.println("起動パラメータの指定が不正です");
            return;
        }
        String inFile = args[0];
        String outFile = args[1];
        try{
            FileInputStream fis = new FileInputStream(inFile);
            FileOutputStream fos =  new FileOutputStream(outFile);
            BufferdOutputStream bos = new BufferdOutputStream(fos);
            GZIPOutputStream gzos = new GZIPOutputStream(bos);
            int i = fis.read();
            while(i != -1){
                gzos.write(i);
                i = fis.read();
            };
            gzos.close();
        }catch(IOException e){
            e.printStackTrace();
        }finally{
            gzos.flush();
            gzos.close();
            fis.close();
        }
        int i = fis.read();
        while(i != -1){
            fos.write(i);
            i = fis.read();
        }
        fos.flush();
        fos.close();
        fis.close();
    }
}
