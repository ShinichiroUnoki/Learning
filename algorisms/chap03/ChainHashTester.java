// javac algorisms/chap03/ChainHashTester.java 

package algorisms.chap03;
import java.util.Scanner;

public class ChainHashTester {
    static Scanner stdIn = new Scanner(System.in);

    // データ（会員番号＋氏名）
    static class Data{
        static final int NO = 1; // 番号を読み込むか？
        static final int NAME = 2; // 氏名を読み込むか？

        private Integer no; // 会員番号（キー値）
        private String name; // 氏名

        // キー値
        Integer keyCode(){
            return no;
        }

        // 文字列表現を返す
        public String toString(){
            return name;
        }

        // データの読み込み
        void scanData(String guide, int sw){
            System.out.println(guide + "するデータを入力してください。");
            
            if((sw & NO) == NO){ // &&：右辺の式まで評価されない
                System.out.print("番号：");
                no = stdIn.nextInt();
            }
            if((sw & NAME) == NAME){
                System.out.print("氏名：");
                name = stdIn.next();
            }
        }
    }

    // --- メニュー列挙型 --- //
    enum Menu{
        ADD("追加"),
        REMOVE("削除"),
        SEARCH("探索"),
        DUMP("表示"),
        TERMINATE("終了");

        private final String message; // 表示用文字列

        static Menu MenuAt(int idx){ // 序数がidxである列挙を返す
            for(Menu m : Menu.values()){
                if(m.ordinal() == idx){
                    return m;
                }
            }
            return null;
        }
        Menu(String string){ // コンストラクタ
            message = string;
        }

        String getMessage(){
            return message;
        }
    }

    // --- メニュー選択 --- //
    static Menu SelectMenu(){
        int key;
        do{
            for(Menu m : Menu.values()){
                System.out.printf("(%d) %s", m.ordinal(), m.getMessage());
            }
            System.out.print(":");
            key = stdIn.nextInt();
        }while(key < Menu.ADD.ordinal() || key > Menu.TERMINATE.ordinal());
    }
    public static void main(String[] args){
        Menu menu; // メニュー
        Data data; // 追加用データ参照
        Data temp = new Data(); // 読み込み用データ

        ChainHash<Integer, Data> hash = new ChainHash<Integer, Data>(13);

        do{
            switch(menu = SelectMenu()){
                case ADD : // 追加
                    data = new Data();
                    data.scanData("追加", Data.NO | Data.NAME);
                    hash.add(data.keyCode(), data);
                    break;

                case REMOVE : // 削除
                    temp.scanData("削除", Data.NO);
                    hash.remove(temp.keyCode());
                    break;

                case SEARCH : // 探索
                    temp.scanData("探索", Data.NO);
                    Data t = hash.search(temp.keyCode());
                    if(t != null){
                        System.out.println("そのキーをもつデータは" + t + "です。");
                    } else {
                        System.out.println("該当するデータはありません。");
                    }
                    break;

                case DUMP: // 表示
                    hash.dump();
                    break;
            }
        }while(menu != Menu.TERMINATE);
    }
}
