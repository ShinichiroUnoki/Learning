package java_practice.training3_2;

public class Answer {
    public static void main(String[] args){
        Func1 func1 = (int x) -> {return (x % 2 == 1);};
        Func2 func2 = (int point, String name) -> {return name + "さんは" + (point > 65 ? "合格" : "不合格");};        
    }
}
