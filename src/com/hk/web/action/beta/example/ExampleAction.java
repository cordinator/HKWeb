package com.hk.web.action.beta.example;

import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.stereotype.Component;


/**
 * @author Rimal
 */
@Component
public class ExampleAction extends BaseAction {

  private Long id;

  @DefaultHandler
  public Resolution pre() {

/*    id = ((PrincipalImpl) SecurityUtils.getSubject().getPrincipal()).getId();

    System.out.println("userId >>>" +id );*/
    return new ForwardResolution("/pages/example/example.jsp");
  }


  
}