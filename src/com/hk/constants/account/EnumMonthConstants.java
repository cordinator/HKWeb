package com.hk.constants.account;

/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 05/08/13
 * Time: 19:35
 * To change this template use File | Settings | File Templates.
 */
public enum EnumMonthConstants {
  JAN(1, "JAN", 31),
  FEB(2, "FEB", 28),
  MAR(3, "MAR", 31),
  APR(4, "APR", 30),
  MAY(5, "MAY", 31),
  JUN(6, "JUN", 30),
  JUL(7, "JUL", 31),
  AUG(8, "AUG", 31),
  SEP(9, "SEP", 30),
  OCT(10, "OCT", 31),
  NOV(11, "NOV", 30),
  DEC(12, "DEC", 31);


  int monthIndex;
  String monthName;
  int monthDays;

  EnumMonthConstants(int monthIndex, String monthName, int monthDays) {
    this.monthIndex = monthIndex;
    this.monthName = monthName;
    this.monthDays = monthDays;
  }

  public int getMonthIndex() {
    return monthIndex;
  }

  public void setMonthIndex(int monthIndex) {
    this.monthIndex = monthIndex;
  }

  public String getMonthName() {
    return monthName;
  }

  public void setMonthName(String monthName) {
    this.monthName = monthName;
  }

  public int getMonthDays() {
    return monthDays;
  }

  public void setMonthDays(int monthDays) {
    this.monthDays = monthDays;
  }
}
