package algorisms.chap03;
import java.util.Scanner;

public class Practice3_1 {
    static int seqSearchSen(int[] a, int n, int key){
        a[n] = key; // 番兵を追加
        for(int i = 0; i < n; i++){
            if(a[i] == key){
                return i; // 探索成功
            }
        }
        return -1; // 探索失敗
    }

    public static void main(String[] args){
        Scanner stdIn = new Scanner(System.in);

        System.out.print("要素数:"); int n = stdIn.nextInt();
        int[] a = new int[n + 1];

        for(int i = 0; i < n; i++){
            System.out.print("a[" + i + "]:"); int element = stdIn.nextInt();
            a[i] = element;
        }

        System.out.print("探す値:"); int search = stdIn.nextInt();
        int result = seqSearchSen(a, n, search);

        if(result == -1){
            System.out.println("その値の要素は存在しません。");
        }else{
            System.out.println("その値はx[" + result + "]にあります。");
        }
    }    
}
