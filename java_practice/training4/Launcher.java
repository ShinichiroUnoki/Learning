package java_practice.training4;

import java.io.IOException;

public class Launcher {
    public static void main(String[] args) throws IOException, NoSuchMethodException, SecurityException{
        
        try{
            // 現在のメモリ使用量を表示する。
            double tm = Runtime.getRuntime().totalMemory();
            System.out.println("現在のメモリ使用量:" + tm);

            // FQCNのクラスが持つ、全てのメソッド名を画面に表示する
            Class<?> cinfo = args[0].getClass();
            System.out.println(cinfo.getDeclaredMethods());

            // 指定された方法によって次のように起動する。
            
            if(args[1].equals("E")){ // Eの場合・・・ProcessBuilderで別プロセスとして起動する。
                ProcessBuilder pb = new ProcessBuilder(args[0]);
                pb.start();
            }else if(args[1].equals("I")){ // Iの場合・・・リフレクションでmainメソッドを呼び出す
                Class[] clazz = new Class[2];
                clazz[0] = String.class;
                clazz[1] = String.class;
                Launcher.class.getDeclaredMethod("main", clazz);
            }
        
            // メモリ使用量
            long totalM = Runtime.getRuntime().totalMemory();
            long freeM = Runtime.getRuntime().freeMemory();
            System.out.println("メモリ使用量:" + (totalM - freeM));
            
            //このプログラムが終了する際には、起動に成功した場合は、0、そうでないならば1を終了コードとする。
            System.out.println("プログラムを正常に終了します。");
            System.exit(0);

        }catch(IOException e){
            //このプログラムが終了する際には、起動に成功した場合は、0、そうでないならば1を終了コードとする。
            System.out.println("プログラムに異常が検知されました。プログラムを終了します");
            System.exit(1);
        }
    }
}
