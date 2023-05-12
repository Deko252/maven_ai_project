package bit.study.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homecontroller {
    @GetMapping("/")
    public String home(){
        System.out.println("야");
        return "home";
    }
}
