package bit.study.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

//@ComponentScan("bit.study.main")
@SpringBootApplication//(exclude = {DataSourceAutoConfiguration.class })
public class CloudAiServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudAiServiceApplication.class, args);
    }

}
