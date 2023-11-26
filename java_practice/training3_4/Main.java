package java_practice.training3_4;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.*;

public class Main {
    public static void main(String[] args){
        List<String> names = new ArrayList<String>();
        names.add("菅原拓真");
        names.add("湊祐介");
        names.add("浅香あゆみ");
        names.add("大江岳斗");

        names.stream().forEach((String name) -> {
            if(name.split("").length <= 4){
                System.out.println(name + "さん"); 
            }
        });
    }
}
