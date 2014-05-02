package com.hk.util;

import com.hk.util.md5.MD5;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created with IntelliJ IDEA.
 * User: Shrey
 * Date: 6/25/13
 * Time: 4:46 PM
 * To change this template use File | Settings | File Templates.
 */
public class BaseUtils {

  public static String getMD5Checksum(String str) {
    MD5 md5 = new MD5();
    try {
      md5.Update(str, null);
    } catch (UnsupportedEncodingException e) {
    }
    return md5.asHex();
  }

  public static byte[] getMD5ChecksumInBytes(String str) {
    MD5 md5 = new MD5();
    try {
      md5.Update(str, null);
    } catch (UnsupportedEncodingException e) {
    }
    return md5.Final();
  }

  public static String getMD5Checksum(File file) {
    String md5 = null;
    if (file == null || !file.exists()) {
      return md5;
    }
    try {
      md5 = MD5.asHex(MD5.getHash(file));
    } catch (IOException e) {
    }
    return md5;
  }

  public static byte[] getMD5ChecksumInBytes(File file) {
    byte[] md5 = null;
    if (file == null || !file.exists()) {
      return null;
    }
    try {
      md5 = MD5.getHash(file);
    } catch (IOException e) {
    }
    return md5;
  }

  public static String getRandomNumber(int length) {
    char[] pw = new char[length];
    int c = '0';
    for (int i = 0; i < length; i++) {
      c = '0' + (int) (Math.random() * 10);
      pw[i] = (char) c;
    }
    return new String(pw);
  }
}
