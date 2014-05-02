package com.hk.pact.service.email;

import freemarker.template.Template;
import com.hk.impl.service.email.FreeMarkerServiceImpl.RenderOutput;

/**
 * Created with IntelliJ IDEA.
 * User: Shrey
 * Date: 6/17/13
 * Time: 1:15 PM
 * To change this template use File | Settings | File Templates.
 */
public interface FreeMarkerService {

  public Template getCampaignTemplate(String templatePath);

  public RenderOutput processCampaignTemplate(Template template, Object templateValues);
}
