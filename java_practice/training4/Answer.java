package java_practice.training4;
import java.lang.reflect.*;

public class Answer {
    public static void main(String[] args){
        String fqcn = args[0];
        String sw = args[1];
        showMemory();

        try{
            Class<?> clazz = Class.forName(fqcn);
            listMethods(clazz);
            if(sw.equals("E")){
                launchExternal(clazz);
            } else if(sw.equals("I")){
                launchInternal(clazz);
            }else{
                throw new IllegalAccessException("不正な起動です");
            }
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
        showMemory();
        System.exit(0);
    }


    public static void listMethods(Class<?> clazz){
        System.out.println("メソッドの一覧を表示します");
        Method[] methods = clazz.getDeclaredMethods();
        for(Method m : methods){
            System.out.println(m.getName());
        }
    }

    public static void launchExternal(Class<?> clazz) throws Exception{
        ProcessBuilder pb = new ProcessBuilder("java", clazz.getName());
        Process proc = pb.start();
        proc.waitFor(); // プロセスの終了まで待つ
    }

    public static void launchInternal(Class<?> clazz){
        try{
            Method m = clazz.getMethod("main", String[].class);
            String[] args = {};
            try{
                m.invoke(null, (Object)args);
            }catch(IllegalAccessException | InvocationTargetException e){
                e.printStackTrace();
            }
        }catch(NoSuchMethodException nsme){
            nsme.printStackTrace();
        };       
    }

    public static void showMemory(){
        long free = Runtime.getRuntime().freeMemory();
        long total = Runtime.getRuntime().totalMemory();
        long usage = (total - free) / 1024 /1024;
        System.out.println("現在のメモリ使用量" + usage + "MB");
    }
}
