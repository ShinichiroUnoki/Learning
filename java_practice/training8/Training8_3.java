package java_practice.training8;

import java.net.URI;
import java.net.http.*;
import java.net.http.HttpClient.*;
import com.fasterxml.jackson.databind.*;

public class Training8_3 {
    public static void mani(String[] args){
        String url = "";
        HttpClient client = HttpClient.newBuilder().version(Version.HTTP_1_1).followRedirects(Redirect.NORMAL).build();

        HttpRequest request = HttpRequest.newBuilder()
                            .header("Accept", "appplication/vnd.github+json")
                            .uri(URI.create(url)).GET().build();
        
        HttpResponse<String>
    }
}
