package com.hk.web.gson;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


/**
 * @author adlakha.vaibhav
 */
public class JsonUtils {

  private static final Gson defaultGson;

  static {
    defaultGson = new GsonBuilder()
        .create();
  }

  public static Gson getGsonDefault() {
    return defaultGson;
  }
}