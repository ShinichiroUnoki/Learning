package algorisms.chap03;
import java.util.Arrays;
import java.util.Scanner;

import org.apache.commons.lang3.concurrent.Computable;

import java.util.Comparator;

public class Practice3_7 {
    // --- 身体検査データ --- //
    static class PhyscData{
        private String name; // 氏名
        private int height; // 身長
        private double vision; // 視力

        // --- コンストラクタ --- //
        public PhyscData(String name, int height, double vision){
            this.name = name;
            this.height = height;
            this.vision = vision;
        }

        // --- 文字列化 --- //
        public String toString(){
            return name + " " + height + " " + vision;
        }

        // --- 視力降順用コンパレータ --- //
        public static final Comparator<PhyscData> VISION_ORDER = new VisionOrderComparator();
        private static class VisionOrderComparator implements Comparator<PhyscData>{
            public int compare(PhyscData v1, PhyscData v2){
                if(v1.vision < v2.vision){
                    return 1;
                }else if(v1.vision > v2.vision){
                    return -1;
                }else{
                    return 0;
                }
            }
        }
    }

    public static void main(String[] args){
        Scanner stdIn = new Scanner(System.in);
        PhyscData[] pd = {
            new PhyscData("斉藤誠司", 175, 2.0),
            new PhyscData("武田慎也", 171, 1.5),
            new PhyscData("浜田哲彬", 174, 1.2),
            new PhyscData("松富昭雄", 169, 0.8),
            new PhyscData("加藤富昭", 173, 0.7),
            new PhyscData("長浜亮一", 168, 0.4),
            new PhyscData("赤坂忠雄", 162, 0.3),
        };
        System.out.print("いくつの視力の持ち主をおさがしですか？：");
        double vision = stdIn.nextDouble();
        int idx = Arrays.binarySearch(pd, new PhyscData("", 0, vision), PhyscData.VISION_ORDER);
        if(idx < 0 ){
            System.out.println("その値の要素は存在しません");
        }else{
            System.out.println("その値は[" + idx + "]にあります。");
            System.out.println("データ：" + pd[idx]);
        }
    }
}
