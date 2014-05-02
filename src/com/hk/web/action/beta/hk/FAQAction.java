package com.hk.web.action.beta.hk;

import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: Ashish Bardhan
 * Date: 8/19/13
 * Time: 12:49 PM
 * To change this template use File | Settings | File Templates.
 */

@Component
public class FAQAction extends BaseAction {

  String reftag;

  @DefaultHandler
  public Resolution pre() {
    return new ForwardResolution("/pages/faq.jsp");
  }

  public String getReftag() {
    return reftag;
  }

  public void setReftag(String reftag) {
    this.reftag = reftag;
  }
}
