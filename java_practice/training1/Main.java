package java_practice.training1;
import java.util.*;
import java.text.SimpleDateFormat;

public class Main {
    public static void main(String[] args) throws Exception{
        SimpleDateFormat f = new SimpleDateFormat("yyyy/MM/dd");
        Date date1 = f.parse("2011/10/07");
        Date date2 = f.parse("2019/06/11");
        Date date3 = f.parse("2018/06/21");

        Book book1 = new Book("Java入門", date1, "スッキリわかる");
        Book book2 = new Book("Python入門", date2, "カレーが食べたくなる");
        Book book3 = new Book("C言語入門", date3, "ポインタも自由自在");
       
        List<Book> books = new ArrayList<Book>();
        books.add(book1);
        books.add(book2);
        books.add(book3);
        
        Collections.sort(books, new TitleComparator());

        for(int i = 0; i < books.size(); i++){
            System.out.println(books.get(i).getTitle());
        }
    }
}
