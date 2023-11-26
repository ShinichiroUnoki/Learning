package algorisms.chap03;

import java.util.Random;
import java.util.Arrays;

public class Practice3_4 {
    public static void main(String[] args){
        // ランダムな数値を生成し、各変数へ代入
        Random rand = new Random();
        int n = rand.nextInt(19) + 2;
        final int key = rand.nextInt(20);


        // 配列の生成
        int[] a = new int[n];

        // 設定値
        System.out.println("要素数:" + n);
        System.out.println("探索値:" + key); 
        for(int i = 0; i < n; i++){
            a[i] = rand.nextInt(20);
        }

        // １行目
        System.out.print(String.format("%3s", " "));
        System.out.print("|");
        for(int i = 0; i < a.length; i++){
            System.out.print(String.format("%3d",i));
        }
        System.out.println();

        // 2行目
        System.out.print(String.format("%4s","---+"));
        for(int i = 0; i < a.length; i++){
            System.out.print("---");
        }
        System.out.println();
        
        // 探索記号行表示
        int pl = 0;
        int pr = n - 1;
        int pc = (pl + pr) / 2;
        do{
            pc = (pl + pr) / 2;
            String[] symbol = new String[n];
            
            
            if(pr > symbol.length){
                if(pl == pc && pl >=0){
                    symbol[pc] = "+";
                }else if(pl == pc && pl < 0){
                    symbol[pc] = "";
                }else if(pl != pc && pl >= 0){
                    symbol[pc] = "+";
                    symbol[pl] = "<-";
                }else if(pl != pc && pl < 0){
                    symbol[pc] = "+";
                }
            }else if(pr <= symbol.length){// 次回：ここからスタート

            }
            
            if(a[pc] < key){
                // 記号の行を表示
                System.out.print(String.format("%4s", "|"));
                for(int i = 0; i < symbol.length; i++){
                    if(symbol[i] != null){
                        System.out.print(String.format("%3s", symbol[i]));
                    }else{
                        System.out.print(String.format("%3s", " "));
                    }
                }
                System.out.println();

                //  数値行表示    
                System.out.print(String.format("%3d", pc) + "|");
                Arrays.sort(a);
                for(int i = 0; i < a.length; i++){
                    System.out.print(String.format("%3d",a[i]));
                }
                // この中で探索成功した場合の条件分をコーディング
                if(a[pc] == key){
                    System.out.println("\n探索完了" + "a[" + pc + "]にあります");
                    break;
                }
                pl = pc + 1;
                System.out.println("valueL" + pl + ":" + pc + ":" + pr);
                continue;
            }
            if(a[pc] > key){
                // 記号の行を表示
                System.out.print(String.format("%4s", "|"));
                for(int i = 0; i < symbol.length; i++){
                    if(symbol[i] != null){
                        System.out.print(String.format("%3s", symbol[i]));
                    }else{
                        System.out.print(String.format("%3s", " "));
                    }
                }
                System.out.println();

                //  数値行表示    
                System.out.print(String.format("%3d", pc) + "|");
                Arrays.sort(a);
                for(int i = 0; i < a.length; i++){
                    System.out.print(String.format("%3d",a[i]));
                }

                // この中で探索成功した場合の条件分をコーディング
                if(a[pc] == key){
                    System.out.println("\n探索完了" + "a[" + pc + "]にあります");
                    break;
                }
                pr = pc - 1;
                System.out.println("valueR" + pl + ":" + pc + ":" + pr);
                continue;
            }
            if(a[pc] == key){
                // 記号の行を表示
                System.out.print(String.format("%4s", "|"));
                for(int i = 0; i < symbol.length; i++){
                    if(symbol[i] != null){
                        System.out.print(String.format("%3s", symbol[i]));
                    }else{
                        System.out.print(String.format("%3s", " "));
                    }
                }
                System.out.println();

                //  数値行表示    
                System.out.print(String.format("%3d", pc) + "|");
                Arrays.sort(a);
                for(int i = 0; i < a.length; i++){
                    System.out.print(String.format("%3d",a[i]));
                }

                if(a[pc] == key){
                    System.out.println("\n探索完了" + "a[" + pc + "]にあります");
                    break;
                }
                System.out.println();
            }
        }while(pl < pr); 
        
        if(a[pc] != key){
            System.out.println("\n該当の値が見つかりません");
        }
    }
}
