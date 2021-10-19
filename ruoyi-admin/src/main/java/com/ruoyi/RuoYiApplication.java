package com.ruoyi;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.env.Environment;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Arrays;

/**
 * 启动程序
 *
 * @author ruoyi
 */
@ComponentScan(basePackages = {"com.ruoyi.*","com.ruoyi.web.core.config"})
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class RuoYiApplication  implements CommandLineRunner
{
    @Autowired
    private Environment environment;
    private static final Logger logger = LoggerFactory.getLogger(RuoYiApplication.class);
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                " .-------.       ____     __        \n" +
                " |  _ _   \\      \\   \\   /  /    \n" +
                " | ( ' )  |       \\  _. /  '       \n" +
                " |(_ o _) /        _( )_ .'         \n" +
                " | (_,_).' __  ___(_ o _)'          \n" +
                " |  |\\ \\  |  ||   |(_,_)'         \n" +
                " |  | \\ `'   /|   `-'  /           \n" +
                " |  |  \\    /  \\      /           \n" +
                " ''-'   `'-'    `-..-'              ");
    }

    @Override
    public void run(String... strings) throws Exception {
        try {
            logger.info(
                    "\n------------------------环境信息---------------------------\n\t"
                            + "Application '{}' is running! Access URLs:\n\t"
                            + "Local  : \thttp://{}:{}\n\t"
                            + "Swagger: \thttp://{}:{}/swagger-ui/index.html\n\t"
                            + "Profile(s): \t{}\n----------------------------------------------------------",
                    environment.getProperty("spring.application.name"),
                    InetAddress.getLocalHost().getHostAddress(),
                    environment.getProperty("server.port"),
                    InetAddress.getLocalHost().getHostAddress(),
                    environment.getProperty("server.port"),
                    Arrays.toString(environment.getActiveProfiles()));
        } catch (UnknownHostException e) {
            logger.error("spring boot...启动时发生异常", e);
        }
    }
}
