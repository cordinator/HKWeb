package com.hk.util;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.util.regex.PatternSyntaxException;


public class HKEmailUtils {

  public static Map<String, String> parseActivationLink(String activationLink) {
    Map<String, String> dataMap = new HashMap<String, String>();
    Long userId = Long.parseLong(activationLink.split("#")[0].split("@")[1]);
    String token = activationLink.split("#")[1].split("@")[1];
    dataMap.put("userId", userId.toString());
    dataMap.put("token", token);
    return dataMap;
  }

  public static String createActivationLink(Long userId, String token) {
    if(userId!=null){
      //TODO# Encrypt userID and token then send the link
      return "uId@" + userId + "#tkn@" + token;
    }else{
      return "tkn@"+token;
    }
  }

  public static boolean isValidEmail(String email) {
    try {
      String emailRegEx = "^([A-Za-z0-9_%+-]\\.?)+@([A-Za-z0-9-]\\.?)*[A-Za-z0-9-]+\\.[A-Za-z]{2,4}$";
      Pattern p = Pattern.compile(emailRegEx);
      Matcher m = p.matcher(email);

      if (!m.find()) {
        return false;
      }
    } catch (PatternSyntaxException e) {
      return false;
    }
    return true;
  }

  @SuppressWarnings( { "ConstantConditions" })
  public static String convertNewLineToBr(String str) {
    if (str == null)
      return null;
    return str.replaceAll("\n", "<br/>");
  }
}
