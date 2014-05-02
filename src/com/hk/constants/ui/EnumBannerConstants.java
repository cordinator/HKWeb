package com.hk.constants.ui;


import java.util.Arrays;
import java.util.List;

public enum EnumBannerConstants {

   SLOT_ONE("slot-one","one"),
   SLOT_TWO("slot-two","two"),
   SLOT_THREE("slot-three","three");

  String name;
  String key;

  EnumBannerConstants(String name, String key){
    this.name = name;
    this.key = key;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getKey() {
    return key;
  }

  public void setKey(String key) {
    this.key = key;
  }

  public static List<EnumBannerConstants> getSlots(){
    return Arrays.asList(SLOT_ONE,SLOT_TWO,SLOT_THREE);
  }
}
