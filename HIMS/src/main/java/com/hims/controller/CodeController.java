package com.hims.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 验证码控制器
 *
 *   @RestController=  @Controller  +  @ResponseBody
 *
 */
@Controller
public class CodeController {

    @RequestMapping("/getCode")
    public void getCode(HttpServletRequest request, HttpServletResponse response) {
        //生成对应宽高的初始图片
        int width = 120;
        int height = 35;
        BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);

        //美化图片
        Graphics g = img.getGraphics();
        g.setColor(Color.white);      //设置画笔颜色-验证码背景色
        g.fillRect(0, 0, width, height);//填充背景
        Random ran = new Random();
        //产生4个随机验证码，12Ey
        String checkCode = getCheckCode();
        //将验证码放入HttpSession中
        request.getSession().setAttribute("checkCode_session", checkCode);
        System.out.println("----------------->系统生成的验证码是:" + checkCode);
        Color color = new Color(ran.nextInt(256), ran.nextInt(256), ran.nextInt(256));//随机生成颜色
        g.setColor(color);
        //设置字体的小大
        g.setFont(new Font("微软雅黑", Font.BOLD, 40));
        //向图片上写入验证码
        g.drawString(checkCode, 15, 33);

        //画干扰线
        for (int i = 0; i < 6; i++) {
            // 设置随机颜色
            Color color1 = new Color(ran.nextInt(256),
                    ran.nextInt(256), ran.nextInt(256));//随机生成颜色
            g.setColor(color1);
            // 随机画线
            g.drawLine(ran.nextInt(width), ran.nextInt(height),
                    ran.nextInt(width), ran.nextInt(height));
        }
        //添加噪点
        for (int i = 0; i < 30; i++) {
            int x1 = ran.nextInt(width);
            int y1 = ran.nextInt(height);
            Color color2 = new Color(ran.nextInt(256), ran.nextInt(256), ran.nextInt(256));//随机生成颜色
            g.setColor(color2);
            g.fillRect(x1, y1, 2, 2);
        }
        //将图片输出页面展示
        try {
            ImageIO.write(img, "png", response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //生成随机验证码方法
    private String getCheckCode() {
        String base = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ";
        int size = base.length();
        Random r = new Random();
        StringBuffer sb = new StringBuffer();
        for (int i = 1; i <= 4; i++) {
            //产生0到size-1的随机值
            int index = r.nextInt(size);
            //在base字符串中获取下标为index的字符
            char c = base.charAt(index);
            //将c放入到StringBuffer中去
            sb.append(c);
        }
        return sb.toString();
    }
}
