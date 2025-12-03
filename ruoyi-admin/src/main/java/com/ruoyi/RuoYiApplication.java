package com.ruoyi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class RuoYiApplication {
    public static void main(String[] args) {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(RuoYiApplication.class, args);
        System.out.println(
                "   ____  ___  ____  _     ___ _   _       ____              _           _ \n" +
                        "  / ___|/ _ \\| __ )| |   |_ _| \\ | |     | __ )  ___   ___ | |_ ___  __| |\n" +
                        " | |  _| | | |  _ \\| |    | ||  \\| |     |  _ \\ / _ \\ / _ \\| __/ _ \\/ _` |\n" +
                        " | |_| | |_| | |_) | |___ | || |\\  |     | |_) | (_) | (_) | ||  __/ (_| |\n" +
                        "  \\____|\\___/|____/|_____|___|_| \\_|     |____/ \\___/ \\___/ \\__\\___|\\__,_|\n" +
                        "                                                                          "
        );

        System.out.println(
                "  ____                               __       _ _          _ \n" +
                        " / ___| _   _  ___ ___ ___  ___ ___ / _|_   _| | |_   _   | |\n" +
                        " \\___ \\| | | |/ __/ __/ _ \\/ __/ __| |_| | | | | | | | |  | |\n" +
                        "  ___) | |_| | (_| (_|  __/\\__ \\__ \\  _| |_| | | | |_| |  |_|\n" +
                        " |____/ \\__,_|\\___\\___\\___||___/___/_|  \\__,_|_|_|\\__, |  (_)\n" +
                        "                                                  |___/      "
        );
    }
}
