package com.hims.encode;

import com.hims.utils.MD5Util;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * 自定义加密算法
 */
public class MyMD5PasswordEncoder implements PasswordEncoder {

    /**
     * 加密规则
     * @param rawPassword
     * @return
     */
    @Override
    public String encode(CharSequence rawPassword) {
        String slat="2105";
        String encPassword =  MD5Util.MD5EncodeUtf8(MD5Util.MD5EncodeUtf8(rawPassword+slat));
        return encPassword;
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        return encode(rawPassword).equals(encodedPassword);
    }
}
