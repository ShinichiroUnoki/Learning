package algorisms.chap03;
import java.util.Scanner;

public class Practice3_2 {
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
        String[] star = new String[n + 1];
        for(int i = 0; i < n + 1; i++){
            star[i] = String.format("%4s", "*");
        }

        for(int i = 0; i < n; i++){
            System.out.print("a[" + i + "]:"); int element = stdIn.nextInt();
            a[i] = element;
        }

        System.out.print("探す値:"); int search = stdIn.nextInt();
        // 番兵法による探索開始
        for(int i = 0; i < 2; i++){
            if(i == 0){
                System.out.print(String.format("%4s", "|"));
                for(int j = 0; j < n; j++){
                    System.out.print(String.format("%3d", j));
                }
            }
            System.out.println();
            if(i == 1){
                System.out.print("---+");
                for(int j = 0; j < 3 * (n + 1); j++){
                    System.out.print("-");
                }
                System.out.println();
            }
        }
        for(int i = 0; i <= seqSearchSen(a, n, search); i++){
            // *の行を表示
            System.out.print(String.format("%4s", "|"));
            for(int j = 0; j < i; j++){
                System.out.print(String.format("%3s", ' '));
            }
            System.out.print(String.format("%3s", '*'));
            System.out.println();   

            // 数値の行を表示
            System.out.print(String.format("%4s", i + "|"));
            for(int j = 0; j < n; j++){
                System.out.print(String.format("%3d", a[j]));
            }
            System.out.println();

            // 表示なしの行
            if(i != seqSearchSen(a, n, search)){
                System.out.print(String.format("%4s", "|"));
                System.out.println();
            }
        }
        
        int result = seqSearchSen(a, n, search);

        if(result == -1){
            System.out.println("その値の要素は存在しません。");
        }else{
            System.out.println("その値はx[" + result + "]に存在します。");
        }
    }    
}
