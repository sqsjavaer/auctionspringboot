package com.baizhi.ssm.configjava;


import com.google.code.kaptcha.Producer;
import com.google.code.kaptcha.impl.DefaultKaptcha;
import com.google.code.kaptcha.util.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

@Configuration
public class ConfigJava {

    @Bean
    public Producer producer(){

        Producer  producer = new DefaultKaptcha();

        Properties pro= new Properties();

        pro.setProperty("kaptcha.textproducer.char.length","4");
        Config config = new Config(pro);
        ((DefaultKaptcha) producer).setConfig(config);
        return producer;
    }




}
