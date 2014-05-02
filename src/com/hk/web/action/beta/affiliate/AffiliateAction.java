package com.hk.web.action.beta.affiliate;

import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.UrlBinding;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: Ashish Bardhan
 * Date: 8/19/13
 * Time: 12:49 PM
 * To change this template use File | Settings | File Templates.
 */
@UrlBinding("/affiliate")
@Component
public class AffiliateAction extends BaseAction {


  @DefaultHandler
  public Resolution pre() {
    return new ForwardResolution("/pages/affiliate/affiliate.jsp");
  }


}
