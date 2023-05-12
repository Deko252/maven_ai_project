package bit.study.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
public class homecontroller {
    @GetMapping("/")
    public String home(HttpServletRequest request){
        delete(request);//webapp 에 쌓인 mp3 파일 및 얼굴인식이미지들을 모두 지운다
        return "home";
    }
    public void delete(HttpServletRequest request)
    {
        String uploadPath=request.getSession().getServletContext().getRealPath("/");

        File files=new File(uploadPath+"/");
        String []list=files.list();
        //System.out.println(list.length);
        for(String fn:list)
        {
            System.out.println(fn);
            File f=new File(uploadPath+"/"+fn);
            //if(fn.endsWith("mp3"))
            //{
            if(f.exists()) {
                System.out.println(fn+" 파일 삭제");
                f.delete();
            }
            //}
        }
    }

}
