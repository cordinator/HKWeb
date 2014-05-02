package com.hk.web.action.beta.review;

import com.hk.api.request.review.CreateReviewRequest;
import com.hk.api.response.ui.base.VariantReviewPage;
import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.api.response.variant.review.VariantRating;
import com.hk.api.response.variant.review.response.VariantReviewAllApiResponse;
import com.hk.api.response.variant.review.wrapper.VariantReviewAllResponseApiWrapper;
import com.hk.common.constants.user.RoleConstants;
import com.hk.pact.service.variant.StoreVariantService;
import com.hk.pact.service.variant.review.StoreVariantReviewService;
import com.hk.web.PaginationConstants;
import com.hk.web.action.beta.BasePaginatedAction;
import com.hk.web.action.beta.auth.LoginAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ErrorResolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.stripesstuff.plugin.security.Secure;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * @author Rimal
 */
public class StoreVariantReviewAction extends BasePaginatedAction {

  private Long userId;
  private Long reviewId;
  private Long storeVariantId;
  private String productVariantId;

  private StoreVariantBasicApiResponse storeVariantBasic;

  private Long reviewSortType;
  private Long noOfResults;

  private VariantReviewPage variantReviewPage;

  private boolean voteType;

  private CreateReviewRequest createReviewRequest;

  private VariantReviewAllApiResponse variantReviewAllResponse;

  private int pageNo = PaginationConstants.DEFAULT_PAGE;
  private int perPage = PaginationConstants.DEFAULT_PER_PAGE_VARIANT_REVIEW;
  private int totalResults, totalPages;

  private Double avgRating = 0D;
  private Long totRating;
  private Map<Long, Long> reviewRatingMap = new HashMap<Long, Long>();
  private Map<Long, Long> reviewRatingTotMap = new HashMap<Long, Long>();

  @Autowired
  private StoreVariantReviewService storeVariantReviewService;
  @Autowired
  private StoreVariantService storeVariantService;


  @DefaultHandler
  public Resolution pre() {
    VariantReviewAllResponseApiWrapper variantReviewAllResponseWrapper = getStoreVariantReviewService().getAllReviewsForStoreVariant(storeVariantId, reviewSortType, getPageNo(), getPerPage());
    if (variantReviewAllResponseWrapper == null || variantReviewAllResponseWrapper.getVariantReviewAllResponse() == null) {
      return new ForwardResolution("/pages/500.jsp");
    }

    variantReviewAllResponse = variantReviewAllResponseWrapper.getVariantReviewAllResponse();
    variantReviewPage = variantReviewAllResponseWrapper.getPage();
    this.setPageNo(variantReviewAllResponse.getPageNo());
    this.setPerPage(variantReviewAllResponse.getPerPage());
    this.totalResults = (int) (variantReviewAllResponse.getTotalResults());
    if (variantReviewAllResponse.getPageNo() != 0) {
      if (variantReviewAllResponse.getTotalResults() % variantReviewAllResponse.getPerPage() == 0) {
        this.totalPages = (int) (variantReviewAllResponse.getTotalResults() / variantReviewAllResponse.getPerPage());
      } else {
        this.totalPages = (int) (variantReviewAllResponse.getTotalResults() / variantReviewAllResponse.getPerPage()) + 1;
      }
    } else {
      this.totalPages = 0;
    }

    VariantRating variantRating = variantReviewAllResponse.getVariantRatingResponse();
    if (variantRating != null) {
      avgRating = variantRating.getOverallRating();
      totRating = variantRating.getTotalNumberOfRating();
      reviewRatingMap = variantRating.getRatingPerDomain();
    }

    for (Map.Entry<Long, Long> map : reviewRatingMap.entrySet()) {
      Long value = map.getValue();
      Long ratPercent = 0L;
      if (totRating != null && totRating != 0L) {
        ratPercent = ((value * 100) / totRating);
      }
      reviewRatingTotMap.put(map.getKey(), ratPercent);
    }

    return new ForwardResolution("/pages/review/variantReviews.jsp");
  }

  @Secure(hasAnyRoles = {RoleConstants.HK_USER, RoleConstants.HK_UNVERIFIED}, authActionBean = LoginAction.class)
  public Resolution reviewCrud() {
    if (storeVariantId != null) {
      storeVariantBasic = getStoreVariantService().getStoreVariantBasicDetails(storeVariantId);
    } else if (productVariantId != null) {
      storeVariantBasic = getStoreVariantService().getStoreVariantBasicDetails(productVariantId);
    } else {
      return new ErrorResolution(404);
    }
    return new ForwardResolution("/pages/review/reviewCrud.jsp");
  }

  @Override
  public Set<String> getParamSet() {
    HashSet<String> params = new HashSet<String>();
    params.add("storeVariantId");
    params.add("reviewSortType");
    return params;

  }

  @Override
  public int getPageCount() {
//    return variantReviewPage != null ? variantReviewPage.getTotalPages() : 0;
    return this.totalPages;
  }

  @Override
  public int getResultCount() {
//    return variantReviewPage != null ? variantReviewPage.getTotalResults() : 0;
    return this.totalResults;
  }

  @Override
  public int getPageNo() {
    return this.pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  @Override
  public int getPerPage() {
    return this.perPage;
  }

  public void setPerPage(int perPage) {
    this.perPage = perPage;
  }

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public Long getReviewId() {
    return reviewId;
  }

  public void setReviewId(Long reviewId) {
    this.reviewId = reviewId;
  }

  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public Long getReviewSortType() {
    return reviewSortType;
  }

  public void setReviewSortType(Long reviewSortType) {
    this.reviewSortType = reviewSortType;
  }

  public Long getNoOfResults() {
    return noOfResults;
  }

  public void setNoOfResults(Long noOfResults) {
    this.noOfResults = noOfResults;
  }

  public boolean isVoteType() {
    return voteType;
  }

  public void setVoteType(boolean voteType) {
    this.voteType = voteType;
  }

  public CreateReviewRequest getCreateReviewRequest() {
    return createReviewRequest;
  }

  public void setCreateReviewRequest(CreateReviewRequest createReviewRequest) {
    this.createReviewRequest = createReviewRequest;
  }

  public VariantReviewAllApiResponse getVariantReviewAllResponse() {
    return variantReviewAllResponse;
  }

  public void setVariantReviewAllResponse(VariantReviewAllApiResponse variantReviewAllResponse) {
    this.variantReviewAllResponse = variantReviewAllResponse;
  }

  public StoreVariantReviewService getStoreVariantReviewService() {
    return storeVariantReviewService;
  }

  public VariantReviewPage getVariantReviewPage() {
    return variantReviewPage;
  }

  public void setVariantReviewPage(VariantReviewPage variantReviewPage) {
    this.variantReviewPage = variantReviewPage;
  }

  public int getTotalResults() {
    return totalResults;
  }

  public void setTotalResults(int totalResults) {
    this.totalResults = totalResults;
  }

  public int getTotalPages() {
    return totalPages;
  }

  public void setTotalPages(int totalPages) {
    this.totalPages = totalPages;
  }

  public StoreVariantBasicApiResponse getStoreVariantBasic() {
    return storeVariantBasic;
  }

  public void setStoreVariantBasic(StoreVariantBasicApiResponse storeVariantBasic) {
    this.storeVariantBasic = storeVariantBasic;
  }

  public StoreVariantService getStoreVariantService() {
    return storeVariantService;
  }

  public double getAvgRating() {
    return avgRating;
  }

  public void setAvgRating(double avgRating) {
    this.avgRating = avgRating;
  }

  public Long getTotRating() {
    return totRating;
  }

  public void setTotRating(Long totRating) {
    this.totRating = totRating;
  }

  public Map<Long, Long> getReviewRatingMap() {
    return reviewRatingMap;
  }

  public void setReviewRatingMap(Map<Long, Long> reviewRatingMap) {
    this.reviewRatingMap = reviewRatingMap;
  }

  public Map<Long, Long> getReviewRatingTotMap() {
    return reviewRatingTotMap;
  }

  public void setReviewRatingTotMap(Map<Long, Long> reviewRatingTotMap) {
    this.reviewRatingTotMap = reviewRatingTotMap;
  }

  public String getProductVariantId() {
    return productVariantId;
  }

  public void setProductVariantId(String productVariantId) {
    this.productVariantId = productVariantId;
  }
}