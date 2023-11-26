package java_practice.training3_3;

import java.util.function.*;

public class Main{
    public static void main(String[] args){
        Function<Integer, Boolean> Func1 = (Integer x) -> {return (x % 2 == 1);};
        FuncList func2 = new FuncList();
        BiFunction<Integer, String, String> Func2 = (Integer point, String name) -> {return name + "さんは" + (point > 65 ? "合格" : "不合格");};}
}
