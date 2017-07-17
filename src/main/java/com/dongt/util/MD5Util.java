package com.dongt.util;

import java.math.BigInteger;
import java.security.MessageDigest;

/**
 * Created by dongtao on 2017/7/17.
 */
public class MD5Util {
    public  String getMD5(String str) {  //生成32位加密MD5
        String MD5 = "";
        if (str != null && !str.equals("")) {
            try {
                // 生成一个MD5加密计算摘要
                MessageDigest md = MessageDigest.getInstance("MD5");
                // 计算md5函数
                md.update(str.getBytes());
                // digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
                // BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
                MD5 = new BigInteger(1, md.digest()).toString(16);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return MD5;
        }else{
            return null;
        }
    }
}
