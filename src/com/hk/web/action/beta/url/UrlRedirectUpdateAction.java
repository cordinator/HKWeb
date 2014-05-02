package com.hk.web.action.beta.url;

import com.hk.web.action.beta.BaseAction;
import com.hk.web.listener.HKStartupListener;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.stereotype.Component;

@Component
public class UrlRedirectUpdateAction extends BaseAction {

  @DefaultHandler
  public Resolution pre(){
    HKStartupListener hkStartupListener = new HKStartupListener();
    hkStartupListener.populateUrlMigrations();
    return new ForwardResolution("/pages/url/urlRedirectUpdate.jsp");
  }
}
