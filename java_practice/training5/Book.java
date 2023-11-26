package java_practice.training5;

import org.apache.commons.lang3.builder.*;

public class Book implements Comparable<Book>, Cloneable{
    private String title;
    private String publishDate;
    private String comment;

    // getter/setterの宣言は省略
    public String getTitle(){return this.title;}
    public void setTitle(String title){this.title = title;}

    public String getPublishDate(){return this.publishDate;}
    public void setPublishDate(String publishDate){this.publishDate = publishDate;}

    public String getComment(){return this.comment;}
    public void setComment(String comment){this.comment = comment;}

    // ① 署名と発行日とコメントが同じであれば等価なものと判定され、かつ、HashSetなどに格納しても正しく利用できる
    public boolean equals(Object o){
        return EqualsBuilder.reflectionEquals(this, o);
    }
    // ② 発行日が古い順を自然順序とする。
    public int compareTo(Book obj){
        return new CompareToBuilder().reflectionCompare(this, obj, "comment","title");
    }
    // ③ clone()を呼び出すと、深いコピーによる複製が行われる
    public int hashCode(){
        return HashCodeBuilder.reflectionHashCode(this);
    }
 
}
