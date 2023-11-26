package algorisms.chap03;
import java.util.Random;

public class Practice3_5 {
     public static void main(String[] args){
        Random rand = new Random();
        
        int key = rand.nextInt(9) + 1;
        int n = rand.nextInt(9) + 1;
        int[] a = new int[n];
        for(int i = 0; i < a.length; i++){
            a[i] = rand.nextInt(n);
        }

        // 表示
        System.out.println("探索:" + key);
        System.out.println("要素数:" + a.length);
        for(int i = 0; i < a.length; i++){
            System.out.print(a[i] + " ");
        }
        System.out.println();

        // 2分探索
        int pl = 0;
        int pr = a.length - 1;
        int pc = (pl + pr)/ 2;

        do{
            if(a[pc] == key){
                System.out.println("1つ目の" + key + "はa[" + pc + "]にあります");

                int len = pc + 1 - pl;
                Integer[] array = new Integer[len];
                int search = pc;
                int i = 0;

                do{
                    if(a[search] == key){
                        array[i] = search;
                    }
                    len--;
                }while((len) > 0);

                int count = 0;
                for(int j = 0; j < array.length; j++){
                    if(array[j] != null || array[j] != 0){
                        count++;
                    }
                }

                System.out.println(array[count] + "が一番先頭に近い要素数");
                break;
            }else if(a[pc] != key){
                if(a[pc] > key){
                    pr =  pc - 1;
                }else{
                    pl = pl + 1;
                }
            }
        }while(pl <= pr);
     }
}
// 次回：答え合わせして写経