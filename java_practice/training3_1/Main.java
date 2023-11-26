package java_practice.training3_1;

import java.util.function.*;


public class Main {
    public static void main(String[] args){
        FuncList funcList = new FuncList();
        Func1 func1 = FuncList::isOdd;
        Func2 func2 = funcList::passCheck;
        System.out.println(func1.call(1));
        System.out.println(func2.call(10, "Smith"));
    }
}
