package com.hk.web.resource.variant;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 23, 2013
 * Time: 1:59:48 PM
 */
/*@Component
@Path("/variant/compare")*/
public class SVCompareResourceOld {

  /*private static final int MAX_VARIANTS_FOR_COMPARISON = 4;
  public static final String COMPARISON_SET = "storeVariantCompareSet";

  @Autowired
  private StoreVariantService storeVariantService;


  @POST
  @Path("/add/")
  @SuppressWarnings("unchecked")
  public StoreVariantToCompareResponse addVariantToCompare(StoreVariantToCompare storeVariantToCompare,
                                                           @Context HttpServletRequest httpServletRequest) {

    StoreVariantToCompareResponse storeVariantToCompareResponse = new StoreVariantToCompareResponse();

    if (storeVariantToCompare == null || storeVariantToCompare.getStoreVariantId() == null || StringUtils.isBlank(storeVariantToCompare.getStoreCategoryPrefix())) {
      storeVariantToCompareResponse.setException(true).addMessage(HKWebMessageConstants.INVALID_COMPARE_REQ);
      return storeVariantToCompareResponse;
    }

    HttpSession session = httpServletRequest.getSession(false);
    Set<StoreVariantToCompare> storeVariantCompareSet = (Set<StoreVariantToCompare>) session.getAttribute(COMPARISON_SET);

    if (storeVariantCompareSet == null || storeVariantCompareSet.isEmpty()) {
      storeVariantCompareSet = new HashSet<StoreVariantToCompare>(0);
      storeVariantCompareSet.add(storeVariantToCompare);
      StoreVariantBasicApiResponse storeVariantBasic = getStoreVariantService().getStoreVariantBasicDetails(storeVariantToCompare.getStoreVariantId());
      storeVariantToCompare.setStoreVariantBasic(storeVariantBasic);
      session.setAttribute(COMPARISON_SET, storeVariantCompareSet);

      storeVariantToCompareResponse.addMessage(HKWebMessageConstants.VARIANT_ADDED_TO_COMP);
    } else if (storeVariantCompareSet.size() < MAX_VARIANTS_FOR_COMPARISON) {
      if (storeVariantCompareSet.iterator().next().getStoreCategoryPrefix().equals(storeVariantToCompare.getStoreCategoryPrefix())) {
        storeVariantCompareSet.add(storeVariantToCompare);
        StoreVariantBasicApiResponse storeVariantBasic = getStoreVariantService().getStoreVariantBasicDetails(storeVariantToCompare.getStoreVariantId());
        storeVariantToCompare.setStoreVariantBasic(storeVariantBasic);
        storeVariantToCompareResponse.addMessage(HKWebMessageConstants.VARIANT_ADDED_TO_COMP);
      } else {
        storeVariantToCompareResponse.setException(true).addMessage(HKWebMessageConstants.ONLY_SAME_CAT_VARIANT_COMP);
      }
    } else {
      storeVariantToCompareResponse.setException(true).addMessage(HKWebMessageConstants.VARIANT_COMPARE_LIMIT_REACHED);
    }

    storeVariantToCompareResponse.setStoreVariantListToCompare(storeVariantCompareSet);
    return storeVariantToCompareResponse;
  }


  @POST
  @Path("/remove/")
  @SuppressWarnings("unchecked")
  public StoreVariantToCompareResponse removeVariantToCompare(StoreVariantToCompare storeVariantToCompare,
                                                              @Context HttpServletRequest httpServletRequest) {
    StoreVariantToCompareResponse storeVariantToCompareResponse = new StoreVariantToCompareResponse();

    if (storeVariantToCompare == null || storeVariantToCompare.getStoreVariantId() == null || StringUtils.isBlank(storeVariantToCompare.getStoreCategoryPrefix())) {
      storeVariantToCompareResponse.setException(true).addMessage(HKWebMessageConstants.INVALID_COMPARE_REQ);
      return storeVariantToCompareResponse;
    }

    HttpSession session = httpServletRequest.getSession(false);
    Set<StoreVariantToCompare> storeVariantCompareSet = (Set<StoreVariantToCompare>) session.getAttribute(COMPARISON_SET);

    if (storeVariantCompareSet == null || storeVariantCompareSet.isEmpty()) {
      storeVariantToCompareResponse.setException(true).addMessage(HKWebMessageConstants.NO_VARIANTS_TO_REMOVE_FROM_COMP);
      return storeVariantToCompareResponse;
    } else {
      storeVariantCompareSet.remove(storeVariantToCompare);
      storeVariantToCompareResponse.setStoreVariantListToCompare(storeVariantCompareSet);
      storeVariantToCompareResponse.addMessage(HKWebMessageConstants.VARIANT_REMOVED_FROM_COMP);
      return storeVariantToCompareResponse;

    }
  }

  @POST
  @Path("/remove/all/")
  @SuppressWarnings("unchecked")
  public StoreVariantToCompareResponse removeAllVariantsToCompare(@Context HttpServletRequest httpServletRequest) {
    StoreVariantToCompareResponse storeVariantToCompareResponse = new StoreVariantToCompareResponse();

    HttpSession session = httpServletRequest.getSession(false);
    Set<StoreVariantToCompare> storeVariantCompareSet = (Set<StoreVariantToCompare>) session.getAttribute(COMPARISON_SET);

    if (storeVariantCompareSet == null || storeVariantCompareSet.isEmpty()) {
      storeVariantToCompareResponse.setException(true).addMessage(HKWebMessageConstants.NO_VARIANTS_TO_REMOVE_FROM_COMP);
    } else {
      storeVariantCompareSet.clear();

      storeVariantToCompareResponse.setStoreVariantListToCompare(storeVariantCompareSet);
      storeVariantToCompareResponse.addMessage(HKWebMessageConstants.VARIANT_REMOVED_FROM_COMP);
    }
    return storeVariantToCompareResponse;
  }

  @GET
  @Path("/all/")
  @SuppressWarnings("unchecked")
  public StoreVariantToCompareResponse getAllVariantsToCompare(@Context HttpServletRequest httpServletRequest) {
    HttpSession session = httpServletRequest.getSession(false);
    Set<StoreVariantToCompare> storeVariantCompareSet = (Set<StoreVariantToCompare>) session.getAttribute(COMPARISON_SET);

    StoreVariantToCompareResponse storeVariantToCompareResponse = new StoreVariantToCompareResponse();
    if (storeVariantCompareSet != null) {
      storeVariantToCompareResponse.setStoreVariantListToCompare(storeVariantCompareSet);
    }

    return storeVariantToCompareResponse;
  }

  public StoreVariantService getStoreVariantService() {
    return storeVariantService;
  }*/
}