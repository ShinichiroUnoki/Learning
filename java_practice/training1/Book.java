package java_practice.training1;
import java.util.*;

public class Book implements Comparable<Book>, Cloneable {
    private String title;
    private Date publishDate;
    private String comment;
    
    public Book clone(){
        Book result = new Book();
        result.title = this.title;
        result.publishDate = this.publishDate;
        result.comment = this.comment;
        return result;
    }

    public int compareTo(Book obj){
        if(this.publishDate.getTime() < obj.publishDate.getTime()){
            return -1;
        }
        return 1;
    }

    public Book(){}
    public Book(String title, Date publishDate, String comment){
        this.title = title;
        this.publishDate = publishDate;
        this.comment = comment;
    }

    public String getTitle(){ return this.title; }
    public void setTitle(String title){ this.title = title; }

    public Date getPublishDate(){ return this.publishDate; }
    public void setPublishDate(Date publishDate){ this.publishDate = publishDate; }

    public String getComment(){ return this.comment; }
    public void setComment(String comment){ this.comment = comment; }

    public int hashCode(){
        return Objects.hash(this.title, this.publishDate, this.comment);
    }

    public boolean equals(Object o){
        if(this == o){ return true; }
        if(this == null){ return false; }
        if(!(o instanceof Book)){ return false; }
        Book book = (Book)o;
        if(!(this.title.trim().equals(book.title.trim()) || this.comment.trim().equals(book.comment.trim()))){
            return false;
        }
        return true;
    }

}
