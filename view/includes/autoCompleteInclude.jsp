<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <div id="search" class="hk-search-bar">

    <s:form beanclass="com.hk.web.action.beta.search.SearchAction" method="get" id="globalSearch">
      <s:text name="txtQ" class="hk-search-box" placeholder="Search for a product, brand or category" data-provide="typeahead"
              autocomplete="off"/>
    </s:form>                                                 

    <input type="hidden" id="variant-id" value=""/>
    <span class="icn icn-search" style="">SEARCH</span>

    <div id="searchButton" class="search-menu">

      <div class="search-menu-label">
        <div class="search-hdr-txt">ALL CATEGORIES</div>
        <div class="icn-dwn-cs"></div>

      </div>
      <ul id="searchbox" class="search-cat-cont">
        <li class="search-item">Nutrition</li>
        <li class="search-item">Sports & Fitness</li>
        <li class="search-item">Diabetes</li>
        <li class="search-item">Health Devices</li>
        <li class="search-item">Eye</li>
        <li class="search-item">Personal Care</li>
        <li class="search-item">Beauty</li>
        <li class="search-item">Parenting</li>
        <li class="search-item">Services</li>
      </ul>
    </div>
    <div id="hk-search-box-result"></div>

  </div>
  <script id="ac-variants-template" type="text/x-handlebars-template">
    <a class="clearfix" href="{{targetPage}}" style="">
          <span class="img-box img-box-70 cont-lft mrgn-r-10" style="">
               <img src="{{img}}" alt=""/>
          </span>
          <span style="width:80%;">
               <span>{{label}}</span><br>
               <span class='txt-light'>Rs. {{op}}</span>
          </span>
    </a>
  </script>
</s:layout-definition>