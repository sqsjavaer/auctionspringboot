package com.baizhi.ssm.controller;

import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class ImgController {
   @Autowired
   private Producer producer;
   
	@RequestMapping("/getImg")
	public void  getImg(HttpSession session, HttpServletResponse response) throws IOException {
		
		String text = producer.createText();
		session.setAttribute("img", text);
		BufferedImage image = producer.createImage(text);
		ImageIO.write(image, "jpg", response.getOutputStream());
	}
}
