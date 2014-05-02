package com.hk.util;

import org.apache.commons.lang.StringUtils;

import java.util.*;

/**
 * @author Rimal
 */
public class HKCollectionUtils {

  private static final String DEFAULT_SEPARATOR = ",";


  public static String getListAsString(List list) {
    return getListAsString(list, DEFAULT_SEPARATOR);
  }

  public static List<String> getStringAsList(String string) {
    return getStringAsList(string, DEFAULT_SEPARATOR);
  }

  @SuppressWarnings("unchecked")
  public static String getCollectionAsString(Collection collection) {
    return getListAsString(new ArrayList(collection));
  }

  @SuppressWarnings("unchecked")
  public static String getCollectionAsString(Collection collection, String seperator) {
    return getListAsString(new ArrayList(collection), seperator);
  }

  public static String getListAsString(List list, String separator) {
    StringBuilder stringBuilder = new StringBuilder();

    if (StringUtils.isBlank(separator)) {
      separator = DEFAULT_SEPARATOR;
    }

    for (Object param : list) {
      stringBuilder.append(param.toString()).append(separator);
    }

    if (!list.isEmpty()) {
      return stringBuilder.deleteCharAt(stringBuilder.lastIndexOf(separator)).toString();
    }
    return stringBuilder.toString();
  }

  @SuppressWarnings("unchecked")
  public static List<String> getStringAsList(String string, String separator) {

    if (StringUtils.isBlank(string)) {
      return Collections.EMPTY_LIST;
    }

    if (StringUtils.isBlank(separator)) {
      separator = DEFAULT_SEPARATOR;
    }

    return Arrays.asList(StringUtils.split(string, separator));
  }
}
