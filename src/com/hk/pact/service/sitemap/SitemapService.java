package com.hk.pact.service.sitemap;


import java.util.List;
import java.util.Set;

public interface SitemapService {

  public Set<String> getVariantAndBrandUrls();

  public List<String> getCategoryUrls();

  public List<String> getMenuNodeUrls();
}
