package algorisms.chap02;

public class Date {
    int y; // 西暦年
    int m; // 月(1-12)
    int d; // 日(1-31)

    Date(int y, int m, int d){
        this.y = y;
        this.m = m;
        this.d = d;
    }

    public int after(int n){
        return this.d + n;
    }

    public int before(int n){
        return this.d - n; 
    }
}
