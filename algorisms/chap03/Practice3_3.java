package algorisms.chap03;
import java.util.Scanner;
import java.util.Random;
import java.util.ArrayList;
import java.util.Arrays;

public class Practice3_3 {
    // static int searchIdx(int[] a, int n, int key, int[] idx){

    // }
    public static void main(String[] args){
        Scanner stdIn = new Scanner(System.in);
        Random rand = new Random();
        ArrayList<Integer> idx = new ArrayList<Integer>();
        
        // ランダムに要素数を決める
        int n = rand.nextInt(100);

        System.out.print("探索対象の整数を入力:"); int key = stdIn.nextInt();
        int[] a = new int[n];

        // 配列a[]に要素数n個のランダムな要素を代入
        for(int i = 0; i < a.length; i++){
            a[i] = rand.nextInt(10);
        }

        for(int i = 0; i < a.length; i++){
            if(a[i] == key){
                idx.add(i);
            }
        }

        System.out.println("配列:" + Arrays.toString(a));
        System.out.print("一致した要素の配列:{");
        for(int i = 0; i < idx.size(); i++){
            System.out.print(idx.get(i));
            if(i < idx.size() - 1){
                System.out.print(",");
            }
        }
        System.out.print("}");
        System.out.println();
        System.out.println("一致した要素数：" + idx.size());
    }
}
