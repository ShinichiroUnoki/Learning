package java_practice.training8;

import java.io.*;
import java.net.*;

public class Training8_2 {
    public static void main(String[] args) throws IOException{
        Socket sock = new Socket("smtp.sample.com", 60025);
        OutputStream os = sock.getOutputStream();

        // getBytes()メソッドを使ってString型をbyte型へ変換して書き込んでいるだけ
        os.write("HELO smtp.example.com\r\n".getBytes());
        os.write("MAIL FROM: asaka@examle.com\r\n".getBytes());
        os.write("RCPT TO: minato@example.com\r\n".getBytes());
        os.write("DATA\r\n".getBytes());
        os.write("From: asaka@example.com\r\n".getBytes());
        os.write("Subject: Please send me your RPG\r\n".getBytes());
        os.write("Hello minato. I would like to play your RPG\r\n".getBytes());
        os.write("Could you please send it to me?\r\n".getBytes());
        os.write(".\r\n".getBytes());
        os.write("QUIT".getBytes());

        os.flush();
        sock.close();
    }
}
// 次回：getBytesメソッドについての理解(https://docs.oracle.com/javase/jp/8/docs/api/java/lang/String.html)