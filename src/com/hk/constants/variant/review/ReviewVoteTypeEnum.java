package com.hk.constants.variant.review;

/**
 * Created with IntelliJ IDEA.
 * User: Shrey
 * Date: 6/11/13
 * Time: 3:57 PM
 */
public enum ReviewVoteTypeEnum {

  NEGATIVE_VOTE(1, "NEGATIVE_VOTE"),
  POSITIVE_VOTE(2, "POSITIVE_VOTE"),
  SPAM(3, "SPAM");

  private int id;
  private String name;

  ReviewVoteTypeEnum(int id, String name) {
    this.id = id;
    this.name = name;
  }

  public int getId() {
    return id;
  }

  public String getName() {
    return name;
  }

}
