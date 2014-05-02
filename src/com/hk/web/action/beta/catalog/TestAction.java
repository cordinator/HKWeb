package com.hk.web.action.beta.catalog;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 7, 2013
 * Time: 2:14:26 PM
 */
@Component
@UrlBinding("/abc")
public class TestAction {

  @DefaultHandler
  public Resolution test() {
    System.out.println("hhahhah");

    return null;
  }
}
