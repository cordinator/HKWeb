package com.hk.impl.service.url;


import com.hk.api.response.user.response.url.UrlRedirectionApiResponse;
import com.hk.api.response.user.wrapper.url.UrlRedirectionResponseWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.url.UrlRedirectionService;
import org.springframework.stereotype.Service;

@Service
public class UrlRedirectionServiceImpl implements UrlRedirectionService {

  private static String PRODUCT = "/products";

  @Override
  public UrlRedirectionApiResponse getUrlRedirections() {

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.URL + StoreConstants.DEFAULT_STORE_ID_STR + PRODUCT);
    UrlRedirectionResponseWrapper urlRedirectionResponseWrapper = (UrlRedirectionResponseWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UrlRedirectionResponseWrapper.class);
    if (urlRedirectionResponseWrapper != null) {

      if (urlRedirectionResponseWrapper.getUrlRedirectionApiResponse() != null) {
        return urlRedirectionResponseWrapper.getUrlRedirectionApiResponse();
      }
    }
    return null;
  }
}
