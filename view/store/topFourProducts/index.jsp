<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/general.jsp">
    <%
        boolean isSecure = WebContext.isSecure();
        pageContext.setAttribute("isSecure", isSecure);

        PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
        if (principal != null) {
            pageContext.setAttribute("user_hash", principal.getUserHash());
            pageContext.setAttribute("gender", principal.getGender());
            pageContext.setAttribute("orderCount", principal.getOrderCount());
        } else {
            pageContext.setAttribute("user_hash", "guest");
            pageContext.setAttribute("gender", null);
            pageContext.setAttribute("orderCount", null);
        }
    %>


    <s:layout-component name="content">
        <style>
            .mbReviews {
                color: #969696;
                font-size: 12px;
                font-weight: normal;
            }
            .bestValue {
                background-color: #0092D7;
                color: #FFFFFF;
                line-height: 2em;
                margin-left: -11px;
                width: 113%;
            }
            .fontBold {
                font-weight:bold;
            }
        </style>
        <div class="span16 alpha omega">

            <table cellspacing="0" cellpadding="0" class="cmpre-varnts-tbl">
                <thead>
                <tr>
                    <th></th>
                    <th class="head-items">
                        <div class="img-box img-box-160">
                            <a href="http://www.healthkart.com/sv/on-gold-standard-100-whey-protein/SP-9558" target="_blank">
                                <img alt="ON Gold 100% Whey Protein" src="images/onGoldStandard.jpg">
                            </a>
                        </div>
                    </th>
                    <th class="head-items">
                        <div class="img-box img-box-160">
                            <a href="http://www.healthkart.com/sv/ultimate-nutrition-prostar-100-whey-protein/SP-9929"  target="_blank">
                                <img alt="Ultimate Nutrition Prostar 100% Whey Protein" src="images/ultimateNutrition.jpg">
                            </a>
                        </div>
                    </th>
                    <th class="head-items">

                        <div class="img-box img-box-160">
                            <a target="_blank" href="http://www.healthkart.com/sv/muscleblaze-whey-protein/SP-8686">
                                <img alt=" MuscleBlaze Whey Protein" src="images/muscleblaze.jpg">
                            </a>
                        </div>
                    </th>
                    <th class="head-items last">
                        <div class="img-box img-box-160">
                            <a target="_blank" href="http://www.healthkart.com/sv/dymatize-elite-whey/SP-9720">
                                <img alt="Dymatize Elite Whey " src="images/dymatize.jpg">
                            </a>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th></th>
                    <th class=" head-items"> <div class="varnt-title"> <a target="_blank" href="http://www.healthkart.com/sv/on-gold-standard-100-whey-protein/SP-9558"> ON Gold 100% Whey Protein </a> </div>
                    </th>
                    <th class=" head-items"> <div class="varnt-title"> <a target="_blank" href="http://www.healthkart.com/sv/ultimate-nutrition-prostar-100-whey-protein/SP-9929"> Ultimate Nutrition Prostar 100% Whey Protein </a> </div>
                    </th>
                    <th class=" head-items"> <div class="varnt-title"> <a target="_blank" href="http://www.healthkart.com/sv/muscleblaze-whey-protein/SP-8686"> MuscleBlaze Whey Protein </a> </div>
                    </th>
                    <th class=" head-items last"> <div class="varnt-title"> <a target="_blank" href="http://www.healthkart.com/sv/dymatize-elite-whey/SP-9720"> Dymatize Elite Whey </a> </div>
                    </th>
                </tr>
                <tr>
                    <th class=""></th>
                    <th class=" head-items"> <div class="varnt-title">
                        <div class="rtng-star-s">
                            <div class="rtng-usr" style="width:85.20834%"></div>
                        </div>
                        <div class="mbReviews">
                            288 Reviews
                        </div>
                        <p class="mrgn-b-10 price">Rs. 3,399</p>


                        <a  class="btn btn-blue-mini" target="_blank" href="http://www.healthkart.com/sv/on-gold-standard-100-whey-protein/SP-9558" >Buy Now</a>

                    </div>
                    </th>
                    <th class=" head-items"> <div class="varnt-title">
                        <div class="rtng-star-s">
                            <div class="rtng-usr" style="width:95.31772000000001%;"></div>
                        </div>
                        <div class="mbReviews">
                            299 Reviews
                        </div>

                        <p class="mrgn-b-10 price">Rs. 3,099</p>
                        <a  class="btn btn-blue-mini" target="_blank" href="http://www.healthkart.com/sv/ultimate-nutrition-prostar-100-whey-protein/SP-9929" >Buy Now</a>

                    </div>
                    </th>
                    <th class=" head-items"> <div class="varnt-title">
                        <div class="rtng-star-s">
                            <div class="rtng-usr" style="width:73.57142%;"></div>
                        </div>
                        <div class="mbReviews">
                            140 Reviews
                        </div>
                        <p class="mrgn-b-10 price">Rs. 2,899</p>
                        <a  class="btn btn-blue-mini" target="_blank" href="http://www.healthkart.com/sv/muscleblaze-whey-protein/SP-8686" >Buy Now</a>

                    </div>
                    </th>
                    <th class=" head-items last"> <div class="varnt-title">
                        <div class="rtng-star-s">
                            <div class="rtng-usr" style="width:86.07844%;"></div>
                        </div>
                        <div class="mbReviews">
                            102 Reviews
                        </div>
                        <p class="mrgn-b-10 price">Rs. 3,600</p>
                        <a  class="btn btn-blue-mini" target="_blank" href="http://www.healthkart.com/sv/dymatize-elite-whey/SP-9720" >Buy Now</a>

                    </div>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr class="varnt-specs-tr  first-tr">
                    <td class="border-td fontBold">Value Index</td>
                    <td class="border-td fontBold">3 (27% higher)</td>
                    <td class="border-td fontBold">2 (22% higher)</td>
                    <td class="border-td fontBold">1 (Best value)</td>
                    <td class="border-td fontBold">4 (50% higher)</td>
                </tr>
                <tr class="varnt-specs-tr bg-gray">
                    <td class="border-td">Protein Price/ 100 gm</td>
                    <td class="border-td"> 488 </td>
                    <td class="border-td"> 413 </td>
                    <td class="border-td"> 383 </td>
                    <td class="border-td"> 576 </td>
                </tr>
                <tr class="varnt-specs-tr">
                    <td class="border-td">Protein %</td>
                    <td class="border-td">77 %</td>
                    <td class="border-td">83 %</td>
                    <td class="border-td">76 %</td>
                    <td class="border-td">69 %</td>
                </tr>
                <tr class="varnt-specs-tr  bg-gray">
                    <td class="border-td">Servings Size (g)</td>
                    <td class="border-td">31</td>
                    <td class="border-td">30</td>
                    <td class="border-td">33</td>
                    <td class="border-td">36</td>
                </tr>

                <tr class=" varnt-specs-tr">
                    <td class="border-td">Protein/ Serving (g)</td>
                    <td class="border-td">24</td>
                    <td class="border-td">25</td>
                    <td class="border-td">25</td>
                    <td class="border-td">25</td>
                </tr>
                <tr class="varnt-specs-tr  bg-gray">
                    <td class="border-td">Servings/ Box</td>
                    <td class="border-td">29</td>
                    <td class="border-td">30</td>
                    <td class="border-td">30</td>
                    <td class="border-td">25</td>
                </tr>
                <tr class=" varnt-specs-tr">
                    <td class="border-td">Protein/ Box</td>
                    <td class="border-td">696</td>
                    <td class="border-td">750</td>
                    <td class="border-td">756</td>
                    <td class="border-td">625</td>
                </tr>
                <tr class="varnt-specs-tr bg-gray">
                    <td class="border-td">Box Size (g)</td>
                    <td class="border-td"> 909 </td>
                    <td class="border-td">909</td>
                    <td class="border-td"> 1,000</td>
                    <td class="border-td"> 909</td>
                </tr>
                </tbody>
            </table>

        </div>
    </s:layout-component>




</s:layout-render>
