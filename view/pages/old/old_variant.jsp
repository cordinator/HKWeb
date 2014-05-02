<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
<s:useActionBean beanclass="com.hk.web.action.beta.variant.StoreVariantAction" var="variantAction"/>
<s:layout-component name="content">


<c:set var="variant" value="${variantAction.storeVariant}"/>
<c:set var="attrDefaultVariantMap" value="${variantAction.attrDefaultVariantMap}"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
<div class="mainContainer">
<div class="container_16 clearfix">

  <div class="marginBox">
    <div class="grid_3 bulletImg">

    </div>
    <div class="grid_10 ">
      <h5 class="alignCenter"> ${variant.name}</h5>
    </div>
    <div class="grid_3 bulletImg">

    </div>
  </div>

    <%--<div class="grid_16 embedMargin alignCenter">
      <span class="section2">Rated &nbsp;</span>
      <img src="../images/star-on.png" width="16" height="16" alt="ratingOn1"/>
      <img src="../images/star-on.png" width="16" height="16" alt="ratingOn2"/>
      <img src="../images/star-on.png" width="16" height="16" alt="ratingOn3"/>
      <img src="../images/star-on.png" width="16" height="16" alt="ratingOn4"/>
      <img src="../images/star-off.png" width="16" height="16" alt="ratingOff"/>
      <span class="section2">(43 reviews)</span>
    </div>--%>

  <div class="grid_6">
    <div class="parentImg">
      <c:set var="primaryImage" value="${variant.primaryImage}"/>
      <img width="290" height="445" src="${primaryImage.mlink}" alt="${primaryImage.altText}"/>

      <p>${primaryImage.caption}</p>
    </div>
    <div class="embedMargin">
      <c:forEach items="${variant.images}" var="image">
        <img class="imgBox1" src="${image.slink}" alt="${image.altText}" width="31" height="50"
             caption=${image.caption}/>
      </c:forEach>
    </div>

  </div>

  <div class="grid_10">
    <div class="grid_5 alpha omega">
      <ul>

        <c:forEach items="${variant.keyPoints}" var="keyPoint">
        <li><span>One 5.15-pound tub of chocolate-flavored whey protein</span></li>
        </c:forEach>

        <li><span>Packed with whey protein isolates</span></li>
        <li><span>For maintaining and increasing lean muscle mass</span></li>
        <li><span>Instantized to mix easily with a spoon.</span></li>
        <li><span>Each serving provides over 5 grams of BCAAs </span></li>
      </ul>
    </div>
    <div class="grid_5  omega">


      <c:if test="${variant.discount > 0}">
        <p class="strikethrough">Rs. ${variant.mrp}</p>
      </c:if>
      <p>
        <span class="successText">now Rs. ${variant.offerPrice}</span>
        <c:if test="${variant.discount > 0}">
          <span class="section2">You save ${variant.discount}%</span>
        </c:if>
      </p>

      <div class="offerbox">
        <p> Limited time offer | Get Puresoft(140ml) Free</p>
      </div>
      <div></div>
    </div>
  </div>
  <div class="grid_10">
    <div class="grid_5 alpha omega">
      <c:forEach items="${variant.attributes}" var="attribute">
        <c:set var="selectedValue" value="${variant.selectedAttributes[attribute.name]}"/>
        <label for="${attribute.displayName}">${attribute.displayName}</label>
        <select id="${attribute.displayName}">
          <option value="">- Select One -</option>
          <c:forEach items="${attribute.attrValues}" var="attrValue">
            <c:set var="attrValCombination"
                   value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
            <option attr-val-name="${attrValue.internalValue}"
                    default-variant="${attrDefaultVariantMap[attrValCombination]}"
                    class="label diff-attr-val
                                                   ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? 'label-inverse selected-val' : ''}">
                ${attrValue.displayValue}
            </option>
          </c:forEach>
        </select>
      </c:forEach>
    </div>
    <div class="grid_5  omega embedMarginleft">
      <p>Zero processing fee on EMI: 3,6,9 months</p>

      <p>Discreet packaging</p>

      <p>Cash on delivery available</p>
      <input type="submit" class="buttonControl" value=" Buy Now">

    </div>

  </div>
  <div class="grid_10">
    <div class="buttonblock">
      <button class="secondaryButton"><img src="../images/addwidget.png">Add to compare</button>
      <button class="secondaryButton"><img src="../images/commentImg.png"> speak to a nutritionist</button>

      <button class="secondaryButton"><img src="../images/wishlist.png">add to wishlist</button>
    </div>
  </div>
</div>

<div class="container_16 clearfix " id="ProductInfoBlock">

<div class="marginBox">
<div class="grid_4" id="NavBox">
  <ul class="navBox">

    <li class="liNoStyle"> Jump To</li>
    <li class="liNoStyle"><a href="#alsoBoughtContainer">also bought</a></li>
    <li class="liNoStyle"><a href="#offersContainer">offers</a></li>
    <li class="liNoStyle"><a href="#detailsContainer">details</a></li>
    <li class="liNoStyle"><a href="#buyerGuideContainer">buyer’s guide</a></li>
    <li class="liNoStyle"><a href="#userGuideContainer">users guide</a></li>
    <li class="liNoStyle"><a href="#faqContainer">how to, faqs</a></li>
    <li class="liNoStyle"><a href="#reviewsContainer">reviews</a></li>
    <li class="liNoStyle noBorder"><a href="#header">back to top</a></li>
  </ul>


</div>
<div class="grid_12" id="ProductDetailsBlock">
<div id="alsoBoughtContainer" class="headContainer">
  <div id="productBoughthead">
    <div class="grid_3 productBorder  omega">

    </div>
    <div class="grid_6 alignCenter">
      <h3> With this product, people also bought</h3>
    </div>
    <div class="grid_3 productBorder omega">
    </div>
  </div>
  <div id="productBought" class="embedMargin2 ">
    <div class="grid_3 clickable ">
      <img alt="1" class="imgBox2" src="../images/productImageMedSize.png" width="119" height="191">

      <div class="productDescription embedMargin">

        Optimum Nutrition 100%
        Whey Gold Standard,
        <p class="section2"> Double Rich Chocolate, 1KG
          Rs. 5999
        </p>

      </div>
    </div>

    <div class="grid_3 clickable">
      <img alt="1" class="imgBox2" src="../images/productImageMedSize.png" width="119" height="191">

      <div class="productDescription embedMargin">

        Optimum Nutrition 100%
        Whey Gold Standard,
        <p class="section2"> Double Rich Chocolate, 1KG
          Rs. 5999
        </p>

      </div>
    </div>

    <div class="grid_3 clickable">
      <img alt="1" class="imgBox2" src="../images/productImageMedSize.png" width="119" height="191">

      <div class="productDescription embedMargin">

        Optimum Nutrition 100%
        Whey Gold Standard,
        <p class="section2"> Double Rich Chocolate, 1KG
          Rs. 5999
        </p>

      </div>
    </div>


    <div class="grid_3 clickable  alpha omega">
      <img alt="1" class="imgBox2" src="../images/productImageMedSize.png" width="119" height="191">

      <div class="productDescription embedMargin">

        Optimum Nutrition 100%
        Whey Gold Standard,
        <p class="section2"> Double Rich Chocolate, 1KG
          Rs. 5999
        </p>

      </div>
    </div>
  </div>
</div>
<div id="offersContainer" class="headContainer">
  <div id="productOffershead">
    <div class="grid_3 productBorder  omega">

    </div>
    <div class="grid_6 alignCenter">
      <h3> Offers with this product</h3>
    </div>
    <div class="grid_3 productBorder omega">
    </div>
  </div>
  <div id="productOffers" class="embedMargin2 ">
    <div class="grid_3 clickable ">
      <img alt="1" class="imgBox2" src="../images/productImageMedSize.png" width="119" height="191">

      <div class="productDescription embedMargin">

        Optimum Nutrition 100%
        Whey Gold Standard,
        <p class="section2"> Double Rich Chocolate, 1KG
          Rs. 5999
        </p>

      </div>
    </div>

    <div class="grid_3 clickable">
      <img alt="1" class="imgBox2" src="../images/productImageMedSize.png" width="119" height="191">

      <div class="productDescription embedMargin">

        Optimum Nutrition 100%
        Whey Gold Standard,
        <p class="section2"> Double Rich Chocolate, 1KG
          Rs. 5999
        </p>

      </div>
    </div>

    <div class="grid_3 clickable">
      <img alt="1" class="imgBox2" src="../images/productImageMedSize.png" width="119" height="191">

      <div class="productDescription embedMargin">

        Optimum Nutrition 100%
        Whey Gold Standard,
        <p class="section2"> Double Rich Chocolate, 1KG
          Rs. 5999
        </p>

      </div>
    </div>


    <div class="grid_3 alpha omega">
      <p class="strikethrough"> Rs. 5999</p>

      <p class="successText"> now Rs. 4999</p>

      <p class="section2"> you save 20%</p>
      <input type="submit" class="buttonControl" value=" Buy Now">
    </div>
  </div>
</div>

<div id="detailsContainer" class="headContainer">
<div id="productDetailshead">
  <div class="grid_3 productBorder  omega">

  </div>
  <div class="grid_6 alignCenter">
    <h3> Details</h3>
  </div>
  <div class="grid_3 productBorder omega">
  </div>
</div>
<div id="productDetails" class="embedMargin2">

<div class="embedMargin2 ">
  <div class="grid_12  omega">
    <h6>Optimum Nutrition 100% Whey Gold Standard</h6>
    <iframe width="560" height="315" src="http://www.youtube.com/embed/ujOR4JMYNJE" frameborder="0"
            allowfullscreen=""></iframe>
  </div>
</div>
<div class="grid_12 omega">

  <h6 class="embedPadding2">ONLY TASTY. NOT AFTER-TASTY!</h6>

  <p class="embedPadding1 borderBottom">
    The IntraPro AC6 Whey Isolate is special in ensuring that maximal protein reaches the
    target muscle groups. With pure whey isolate running fuelling your body's recovery, you
    don't need to worry about putting on unwanted fat. ON’s got you covered!
  </p>
</div>

<div class="grid_12 omega">

  <h6 class="embedPadding2">GET HALF OF YOUR DAILY PROTEIN REQUIREMENT & MORE</h6>

  <p class="embedPadding1 borderBottom">
    25 gms of pure muscle building protein in one scoop is what you get. 'Nuff said. From
    ripped to shredded, you can easily cover the entire specturm of body types with ON
    100% Whey Isolate in your gym bag. Not just protein, but you also get loads of other
    essential nutrients, so much so that you can also use it as a low carb meal replacement. It
    won't be wrong to say that no other Protein in the market matches the standards that ON
    100% Whey Isolate has set.

  </p>
</div>


<div class="grid_12 omega">

  <h6 class="embedPadding2">GET GREAT MUSCLE PUMPS & NOT THE FLAB</h6>

  <p class="embedPadding1">
    ON 100% Whey Isolate is special in ensuring that maximal protein reaches the target
    muscle groups. With pure whey isolate running fuelling your body's recovery, you don't
    need to worry about putting on unwanted fat. ON’s got you covered!

  </p>
</div>

<div class="grid_12 embedMargin2 ">
  ${variant.description}
<h4 class="alignCenter"> Nutritional Information</h4>
<h6 class="alignCenter">Your daily values may be higher or lower depending on your calorie needs:</h6>

<div class="grid_12 omega">
<table class="embedMargin font-caps">
  <thead class="borderBottom">
  <tr class="alignLeft">
    <th>serving size 1 rounded scoop(30.4g)</th>
    <th>amount per serving</th>
    <th>% dv</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>calories</td>
    <td>120.00</td>
    <td>120%</td>
  </tr>
  <tr>
    <td>calories from fat</td>
    <td>30.00 mg</td>
    <td>120%</td>
  </tr>
  <tr>
    <td>total carbohydrate</td>
    <td>120.00</td>
    <td>120%</td>
  </tr>
  <tr>
    <td>calories</td>
    <td>120.00</td>
    <td>120%</td>
  </tr>

  <tr>
    <td>calories</td>
    <td>120.00</td>
    <td>120%</td>
  </tr>


  <tr>
    <td>calories</td>
    <td>120.00</td>
    <td>120%</td>
  </tr>

  <tr>
    <td>Vitamin A</td>
    <td>0.00</td>
    <td>120%</td>
  </tr>

  <tr>
    <td>Vitamin B</td>
    <td>0.00</td>
    <td>120%</td>
  </tr>

  <tr>
    <td>Vitamin C</td>
    <td>0.00</td>
    <td>120%</td>
  </tr>

  <tr>
    <td>Vitamin D</td>
    <td>0.00</td>
    <td>120%</td>
  </tr>


  <tr class="borderBottom">
    <td>calories</td>
    <td>120.00</td>
    <td>120%</td>
  </tr>

  <tr>
    <td class="zeropadding" colspan="3">** daily value (dv) not established</td>
  </tr>

  <tr>
    <td class="zeropadding" colspan="3">† percent daily values are based on a 2000 calorie diet.</td>
  </tr>


  </tbody>
</table>
<table class="font-caps embedMargin2">
  <thead class="borderBottom">
  <tr class="alignLeft">
    <th>serving size 1 rounded scoop(30.4g)</th>
    <th>amount per serving</th>
    <th>% dv</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>calories</td>
    <td>2000</td>
    <td>2500</td>
  </tr>
  <tr>
    <td>total fat</td>
    <td>less than 65 g</td>
    <td>80 g</td>
  </tr>
  <tr>
    <td>sat. fat</td>
    <td>less than 20 g</td>
    <td>25 g</td>
  </tr>
  <tr class="borderBottom">
    <td>cholesterol</td>
    <td>less than 300 mg</td>
    <td>300 mg</td>
  </tr>

  <tr>
    <td>total carbohydrate</td>
    <td>300 g</td>
    <td>375 g</td>
  </tr>


  <tr class="borderBottom">
    <td>dietary fiber</td>
    <td>25 g</td>
    <td>30 g</td>
  </tr>


  <tr>
    <td class="zeropadding" colspan="3">calories per gram:</td>
  </tr>


  <tr>
    <td class="zeropadding" colspan="3">fat 9• carbohydrate 4•protein 4</td>

  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50">
  <c:forEach items="${variant.groups}" var="group">
    <thead>
    <tr class="borderTopBottom alignLeft">
      <th class="embedPadding2" group-name="${group.name}" colspan="2">${group.displayName}</th>
    </tr>

    </thead>
    <tbody class="specifications">
    <c:forEach items="${group.groupValues}" var="groupValue">

      <tr>
        <td>${groupValue.displayName}</td>
        <td>${groupValue.value}</td>
      </tr>
    </c:forEach>
    </tbody
  </c:forEach>
</table>
<table class="embedMargin embedMarginTop50">
  <thead>
  <tr class="alignCenter">
    <th class="embedPadding2" colspan="2"><h3 class="embedMarginTop50 alignCenter">Specifications of Nokia Lumia 720
      (Black)</h3></th>
  </tr>

  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">General features</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>In Sales Package</td>
    <td>Battery, Charger, Data Cable, SIM Door Key, Handset, Headset,
      Quick Guide
    </td>
  </tr>
  <tr>
    <td>Form</td>
    <td>Bar</td>
  </tr>
  <tr>
    <td>SIM</td>
    <td>Single SIM, GSM</td>
  </tr>

  <tr>
    <td>Touch Screen</td>
    <td>Yes, Capacitive</td>
  </tr>
  <tr>
    <td>Business Features</td>
    <td>
      Document Viewer, Pushmail (ActiveSync, Mail for Exchange),
      Adobe Acrobat Reader, Office 365(PDF, Excel, Word, Powerpoint,
      OneNote)
    </td>
  </tr>
  <tr>
    <td>Call Features</td>
    <td>Conference Call, Hands Free, Loudspeaker, Call Divert</td>
  </tr>
  <tr>
    <td>Handset Color</td>
    <td>Black</td>
  </tr>
  </tbody>
</table>

<table class="embedMargin embedMarginTop50">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Platform</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Operating Freq</td>
    <td>GSM - 850, 900, 1800, 1900; UMTS - 2100</td>
  </tr>
  <tr>
    <td>OS</td>
    <td>Windows Phone 8</td>
  </tr>
  <tr>
    <td>Processor</td>
    <td>1 GHz Qualcomm Krait, Dual Core</td>
  </tr>

  <tr>
    <td>Graphics</td>
    <td>Adreno 305</td>
  </tr>
  <tr>
    <td>Display</td>
    <td>

    </td>
  </tr>
  <tr>
    <td>Size</td>
    <td></td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>WVGA, 800 x 480 Pixels</td>
  </tr>
  <tr>
    <td>Color</td>
    <td>16 M</td>
  </tr>
  <tr>
    <td>Other Display Features</td>
    <td>ClearBlack, Sculpted Glass, IPS, Corning Gorilla Glass 2</td>
  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Camera</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Primary Camera</td>
    <td>Yes, 6.7 Megapixel</td>
  </tr>
  <tr>
    <td>Secondary Camera</td>
    <td>Yes, 1.3 Megapixel</td>
  </tr>
  <tr>
    <td>Flash</td>
    <td>LED</td>
  </tr>

  <tr>
    <td>Video Recording</td>
    <td>Yes, 720 x 1280, 30 fps</td>
  </tr>
  <tr>
    <td>HD Recording</td>
    <td>
      HD
    </td>
  </tr>
  <tr>
    <td>Zoom</td>
    <td>Digital Zoom - 4x</td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>Digital Zoom - 4x</td>
  </tr>

  <tr>
    <td>Digital Zoom - 4x</td>
    <td>Auto Focus, Touch Focus, Auto and Manual White Balance,
      Multi-scene Mode, Geo-tagging, Carl Zeiss Tessar Lens,
      Image Editor
    </td>
  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Camera</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Primary Camera</td>
    <td>Yes, 6.7 Megapixel</td>
  </tr>
  <tr>
    <td>Secondary Camera</td>
    <td>Yes, 1.3 Megapixel</td>
  </tr>
  <tr>
    <td>Flash</td>
    <td>LED</td>
  </tr>

  <tr>
    <td>Video Recording</td>
    <td>Yes, 720 x 1280, 30 fps</td>
  </tr>
  <tr>
    <td>HD Recording</td>
    <td>
      HD
    </td>
  </tr>
  <tr>
    <td>Zoom</td>
    <td>Digital Zoom - 4x</td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>Digital Zoom - 4x</td>
  </tr>

  <tr>
    <td>Digital Zoom - 4x</td>
    <td>Auto Focus, Touch Focus, Auto and Manual White Balance,
      Multi-scene Mode, Geo-tagging, Carl Zeiss Tessar Lens,
      Image Editor
    </td>
  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Camera</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Primary Camera</td>
    <td>Yes, 6.7 Megapixel</td>
  </tr>
  <tr>
    <td>Secondary Camera</td>
    <td>Yes, 1.3 Megapixel</td>
  </tr>
  <tr>
    <td>Flash</td>
    <td>LED</td>
  </tr>

  <tr>
    <td>Video Recording</td>
    <td>Yes, 720 x 1280, 30 fps</td>
  </tr>
  <tr>
    <td>HD Recording</td>
    <td>
      HD
    </td>
  </tr>
  <tr>
    <td>Zoom</td>
    <td>Digital Zoom - 4x</td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>Digital Zoom - 4x</td>
  </tr>

  <tr>
    <td>Digital Zoom - 4x</td>
    <td>Auto Focus, Touch Focus, Auto and Manual White Balance,
      Multi-scene Mode, Geo-tagging, Carl Zeiss Tessar Lens,
      Image Editor
    </td>
  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Camera</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Primary Camera</td>
    <td>Yes, 6.7 Megapixel</td>
  </tr>
  <tr>
    <td>Secondary Camera</td>
    <td>Yes, 1.3 Megapixel</td>
  </tr>
  <tr>
    <td>Flash</td>
    <td>LED</td>
  </tr>

  <tr>
    <td>Video Recording</td>
    <td>Yes, 720 x 1280, 30 fps</td>
  </tr>
  <tr>
    <td>HD Recording</td>
    <td>
      HD
    </td>
  </tr>
  <tr>
    <td>Zoom</td>
    <td>Digital Zoom - 4x</td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>Digital Zoom - 4x</td>
  </tr>

  <tr>
    <td>Digital Zoom - 4x</td>
    <td>Auto Focus, Touch Focus, Auto and Manual White Balance,
      Multi-scene Mode, Geo-tagging, Carl Zeiss Tessar Lens,
      Image Editor
    </td>
  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Camera</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Primary Camera</td>
    <td>Yes, 6.7 Megapixel</td>
  </tr>
  <tr>
    <td>Secondary Camera</td>
    <td>Yes, 1.3 Megapixel</td>
  </tr>
  <tr>
    <td>Flash</td>
    <td>LED</td>
  </tr>

  <tr>
    <td>Video Recording</td>
    <td>Yes, 720 x 1280, 30 fps</td>
  </tr>
  <tr>
    <td>HD Recording</td>
    <td>
      HD
    </td>
  </tr>
  <tr>
    <td>Zoom</td>
    <td>Digital Zoom - 4x</td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>Digital Zoom - 4x</td>
  </tr>

  <tr>
    <td>Digital Zoom - 4x</td>
    <td>Auto Focus, Touch Focus, Auto and Manual White Balance,
      Multi-scene Mode, Geo-tagging, Carl Zeiss Tessar Lens,
      Image Editor
    </td>
  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Camera</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Primary Camera</td>
    <td>Yes, 6.7 Megapixel</td>
  </tr>
  <tr>
    <td>Secondary Camera</td>
    <td>Yes, 1.3 Megapixel</td>
  </tr>
  <tr>
    <td>Flash</td>
    <td>LED</td>
  </tr>

  <tr>
    <td>Video Recording</td>
    <td>Yes, 720 x 1280, 30 fps</td>
  </tr>
  <tr>
    <td>HD Recording</td>
    <td>
      HD
    </td>
  </tr>
  <tr>
    <td>Zoom</td>
    <td>Digital Zoom - 4x</td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>Digital Zoom - 4x</td>
  </tr>

  <tr>
    <td>Digital Zoom - 4x</td>
    <td>Auto Focus, Touch Focus, Auto and Manual White Balance,
      Multi-scene Mode, Geo-tagging, Carl Zeiss Tessar Lens,
      Image Editor
    </td>
  </tr>
  </tbody>
</table>
<table class="embedMargin embedMarginTop50 borderBottom">
  <thead>


  <tr class="borderTopBottom alignLeft">
    <th class="embedPadding2" colspan="2">Camera</th>
  </tr>
  </thead>
  <tbody class="specifications">
  <tr>
    <td>Primary Camera</td>
    <td>Yes, 6.7 Megapixel</td>
  </tr>
  <tr>
    <td>Secondary Camera</td>
    <td>Yes, 1.3 Megapixel</td>
  </tr>
  <tr>
    <td>Flash</td>
    <td>LED</td>
  </tr>

  <tr>
    <td>Video Recording</td>
    <td>Yes, 720 x 1280, 30 fps</td>
  </tr>
  <tr>
    <td>HD Recording</td>
    <td>
      HD
    </td>
  </tr>
  <tr>
    <td>Zoom</td>
    <td>Digital Zoom - 4x</td>
  </tr>
  <tr>
    <td>Resolution</td>
    <td>Digital Zoom - 4x</td>
  </tr>

  <tr>
    <td>Digital Zoom - 4x</td>
    <td class="embedPadding1">Auto Focus, Touch Focus, Auto and Manual White Balance,
      Multi-scene Mode, Geo-tagging, Carl Zeiss Tessar Lens,
      Image Editor
    </td>
  </tr>
  </tbody>
</table>

</div>
</div>
</div>

</div>
<div id="buyerGuideContainer" class="headContainer">
  <div id="productBuyingGuidehead" class="embedMarginTop50">

    <div class="grid_12  omega alignCenter">
      <h3> Buying guide</h3>
      <h4>Evaluate the shape of your face for a better understanding of frames that will suit you best:</h4>
    </div>

  </div>
  <div id="productBuyingGuide" class="embedMargin2 ">
    <div class="grid_12  omega embedMargin ">

      <div class="productDescription embedMargin">
        <h3 class="embedMargin">QUEEST WHEY PROTEIN?</h3>
        <img alt="1" class="imgBox3" src="../images/Sample_Banner.png" width="680" height="100">

        <p class="embedMargin">
          Whey is obtained as a by product from milk. It contains the highest amounts of BCAAs
          (branch chain amino acids) – essential building blocks for muscles. Whether you are on
          the weight loss wagon or want a 6 pack or are an aspiring bodybuilder or an athlete in
          training – Whey is the best form of protein that you can opt for. While it's true that you
          can get protein from egges, pulses, soy and meat, it is also true that you will end up with a
          number of unwanted calories from carbs or fats.
        </p>

        <p class="embedMargin">
          Given constraints of time and the modern 'urban' lifestyles, Whey protein has emerged as
          the number one choice for protein consumption, at a great price and awesome taste (did
          we mention flavors?).
        </p>

        <h3 class="embedMargin">what is whey protein isolate?</h3>

        <p class="embedMargin">
          Thus Spake Fools Garden - “Isolation is not good for me. Isolation is not good for anybody”.
          They are right, except for Proteins (and StarCraft (zerg, terran and protoss), War-
          Craft (humans, orcs and elves) and Whiskey (single malts, blended & scotch) too).
        </p>

        <p class="embedMargin">
          In a nutshell for time travelers
        </p>

        <p class="embedMargin">
          Whey too, like other awesome things in life comes in 3 kinds. Relax, we won't bore you
          with forgotten tales from Protoss Lore or lays from the Orcish Horde. You just need to
          know that whey is either a concentrate or an isolate or a blend.
        </p>

        <p class="embedMargin">
          In some detail for the somewhat brave
        </p>

        <img alt="1" class="imgBox3" src="../images/Sample_Banner.png" width="680" height="100"/>

        <p class="embedMargin">Whey Protein Isolate: a purer form of whey protein, isolated from fat and
          carbohydrates</p>

        <p class="embedMargin">Whey Protein Concentrate: a pure form of protein only second to whey isolate, higher in
          fat & lactose content </p>

        <p class="embedMargin">
          Whey Protein Blend: a combination of isolate and concentrate whey protein
          Whey isolate is extra-purified and doubly filtered whey protein with almost exclusively
          pure form of protein. It is devoid of fat and is typically lactose-free. If you are aiming at
          discarding as much fat from your diet as possible or are lactose intolerant, whey isolate is
          the ideal whey protein for you. Although priced higher than concentrates, it tastes better
          than and is typically 90% + pure protein by weight, all worth the price you pay.
        </p>


        <h3 class="embedMargin">
          how to choose the right type of whey protein?</h3>

        <p class="embedMargin">
          In one word – it 'depends'. There is no right or wrong here – except if you're lactose intolerant
          (in which case, you're truely in a bath tub with a ferret).
        </p>

        <p class="embedMargin">
          If you're looking at accelerated weight loss, while maintaining lean muscle, then you
          should opt for whey protein isolates. While this is costly, you will get great value for
          money.
        </p>

        <p class="embedMargin">
          If you're just looking for adding just lean mass and not so concerned about gaining extra
          inches, then whey protein concentrate or blends are both a good idea.</p>

        <p class="embedMargin">
          If you're having trouble gaining weight and would rather bank on a protein that does the
          job at a slow and steady pace – then Casein is your best friend.
          If you're stuck somewhere in the middle of a sea of information, then it's best to start with
          a blended whey protein, that will get you good protein, great taste and (hopefully) awesome
          results.
        </p>

        <p class="embedMargin">
          Choosing the right protein is a lot like finding the right guitar. You'll only find out what
          works for you and what does not, only after experiementing. Trainers and gym spotters
          can only dish out (mostly unwanted) advice.</p>

        <h3 class="embedMargin">
          who benefits most from whey protein isolate? </h3>

        <p class="embedMargin">
          It's anyone's guess, that YOU are the one who benefits from Whey Protein Isolate, irrespective
          of your goals and your constitution. Traditionally, only athletes and bodybuilders
          have consumed whey protein and to a large extant public opinion echoes this perception.
        </p>
        <img alt="1" class="imgBox3" src="../images/Sample_Banner.png" width="680" height="100"/>

        <p class="embedMargin">
          Science on the other hand, reveals a host of benefits that one reaps when Whey Protein
          Isolate and a killer workout are combined. Namely, weight loss, gain in muscle mass,
          better immunity and also healthy bones and joints! Like all things awesome, Whey Isolates
          also have evangelists who go as far as suggesting that whey isolates can improve
          infant health, cancer treatments, healing of wounds and fiscal deficit too.
        </p>

      </div>
    </div>
  </div>
</div>
<div id="userGuideContainer" class="headContainer">
  <div id="productUserGuidehead">
    <div class="grid_6 alignCenter">
      <h3> User Guide</h3>
    </div>
  </div>
  <div id="productUserGuide" class="embedMargin2 ">


    <div class="grid_12 omega">
      <h3 class="embedMargin">how much?</h3>

      <div class="productDescription embedMargin">
        Protein requirements vary depending on an individual's age, gender, medical conditions (if
        any) and also the nature of the workout that one does. That being said, anywhere
        between 1-3 scoops of Gaspari IntraPro Pure Whey in 6 – 18 ounces of cold water is usually
        appropriate. If you are not sure, then you can start with 1 scoop of mixed with cold
        water. The amount of water you add, depends on the consistency that you prefer. You can
        also substitute water with skimmed/toned milk if you prefer. For best results, it's advised
        that you consume Gaspari IntraPro Pure Whey twice daily.
      </div>

    </div>
    <div class="grid_12 omega">
      <h3 class="embedMargin">when?</h3>

      <div class="productDescription embedMargin">
        It's a really good idea to consume protein early in the day. Protein takes longer to digest –
        hence consuming protein earlier in the day ensures your muscles are fed and your nutrient
        stores are replenished all day long. Adding a little bit of Gaspari IntraPro Pure Whey
        to your morning cereal or just as a savoury shake, will ensure that you feed your muscle
        and not just your stomach!
        <p class="embedMargin">
          Pure Whey to your morning cereal or just as a savoury shake, will ensure that you feed
          your muscle and not just your stomach!
        </p>
      </div>

    </div>
    <div class="grid_12 omega">
      <h3 class="embedMargin">is it safe?</h3>

      <div class="productDescription embedMargin">
        Gaspari IntraPro Pure Whey is pretty much the best and the purest whey protein known
        to man. Also, Gaspari manufactures protiens, paying attention to every little detail, ensuring
        that you get nothing but the best.
        <p class="embedMargin">
          That being said, it's still a good idea to consume the right amount of protein. If you're not
          sure or have trobule digesting protien, then please consult a physician or a certified dietician/
          trainer before adding Gaspari IntraPro Pure Whey to your diet.
        </p>
      </div>

    </div>
    <div class="grid_12 omega">
      <h3 class="embedMargin">anything else?</h3>

      <div class="productDescription embedMargin">
        Store the Protein under cool and dry conditions. If you live in a place that has high humidity
        and generally soaring temperatures – you should take special care to ensure that the
        Protein box is kept in a cool/dry place. You really don't want to open the case and find
        lumps in it.
      </div>

    </div>

  </div>
</div>
<div id="faqContainer" class="headContainer">
  <div id="productFaqhead" class="embedMargin2">
    <div class="grid_12 omega">
      <h3> FAQS</h3>
    </div>
  </div>
  <div id="productFaq">
    <div class="grid_12 omega">
      <h2 class="embedMargin">1</h2>

      <div class="productDescription embedMargin">
        <p class="embedMargin">DO I NEED TO CONSUME WHEY PROTEIN ISOLATE AT A SPECIFIC TIME OF THE DAY?</p>

        You can consume Gaspari IntraPro Pure Whey Isolate at any time of the day. It is
        designed to be effective both as a replenishment/recover protein and also, the zero carb,
        zero fat profile ensures that it's a great meal replacement. Won't be wrong to say that this
        whey protein isolate is as close to a “one size fits all” that proteins can get.
      </div>

    </div>
    <div class="grid_12 omega">
      <h2 class="embedMargin">2</h2>

      <div class="productDescription embedMargin">

        <p class="embedMargin">Is whey protein isolate meant only for the bodybuilders?</p>
        Proteins are an integral part of the human body and a very critical nutritent for a variety of
        body processes and functions. Besides aiding in the growth and maintenance of muscle
        mass, protein is critical for achieving fat loss, managing health and ensuring that the
        immune system fucntions properly. Furhter, whey isolates can be consumed by anyone in
        your family. If you/someone you know has a history of protein related indigestions, then
        it's better to consult a doctor before adding whey isolate to your diet.
      </div>

    </div>
    <div class="grid_12  omega ">
      <h2 class="embedMargin">3</h2>

      <div class="productDescription embedMargin">

        <p class="embedMargin">Is it okay for women to consume whey protein isolate?</p>
        Yes. Proteins are very critical for ensuring proper health. Often, women are apprehensive
        about consuming whey protein, fearing that they'll end up building huge muscles and will
        look like female body builders. Needless to say – this is a baseless fear. Women can consume
        whey protein isolate and be confident of better health, awesome immmunity and
        above average looks too.
      </div>

    </div>


    <div class="grid_12">

      <div class="grid_4">
        <h2 class="embedMargin">4</h2>

        <div class="productDescription embedMargin">
          <p class="embedMargin">Can I take whey protein in combination with other supplements?</p>
          Yes. Whey protein isolate can be 'stacked' with a number of other supplements like creatine,
          glutamine, dextrose, casein and others. In the off chance that you're planning on
          stacking a number of supplements together – please consult a doctor or a certified trainer,
          so that you can put your worries to rest.
        </div>

      </div>
      <div class="grid_4">
        <h2 class="embedMargin">5</h2>

        <div class="productDescription embedMargin">

          <p class="embedMargin">Can whey protein isolate help me cut my weight?</p>

          <p class="embedMargin">Feed your muscles and not the fat</p>
          Weight loss is best when it's 'fat' that's burnt and not muscles. Crash diets or insane
          workouts with improper nutrition lead to loss of muscles. This leads to problems with
          immunity, strength and culminates in poor overall health.
        </div>

      </div>
      <div class="grid_4 alpha omega ">
        <h2 class="embedMargin">6</h2>

        <div class="productDescription embedMargin">

          <p class="embedMargin">Build muscle to burn fat</p>
          Consuming whey protein isolate ensures that you get pure protein with zero carbs/fats.
          This directly feeds your muscles and doesn't add to the extra inches/flab that you're
          carrying. In addition, if you have a good strength training regimen in place – you will be
          confident about adding lean muscle mass, which will boost your metabolism and further
          help you burn fat. Yes – this sounds kinda insane – but it's Science that hundreds of thousands
          of folks have banked upon!
        </div>
      </div>
    </div>


    <div class="grid_12">

      <div class="grid_4">
        <h2 class="embedMargin">7</h2>

        <div class="productDescription embedMargin">
          <p class="embedMargin">Does that mean I can directly look at the sun?</p>

          You must never look directly at the sun no matter what eyewear you have on.
        </div>

      </div>
      <div class="grid_4">
        <h2 class="embedMargin">8</h2>

        <div class="productDescription embedMargin">

          <p class="embedMargin">Is price an indication of safety?</p>
          Not necessarily. You may spend a fortune
          on a designer pair but all it might offer is
          style. UV protection is key when it comes
          to sunglasses, which comes even if you
          shell a couple of bucks.
        </div>

      </div>
      <div class="grid_4 alpha omega ">
        <h2 class="embedMargin">9</h2>

        <div class="productDescription embedMargin">

          <p class="embedMargin">If my sunglasses are polarized, do they also need be UV protected?</p>
          Yes, because polarization has nothing to do with UV protection.
        </div>

      </div>
    </div>


  </div>
</div>

<div id="reviewsContainer" class="headContainer">

  <div id="productReviewshead" class="embedMargin2">
    <div class="grid_3 productBorder  omega">

    </div>
    <div class="grid_6 alignCenter">
      <h3> Reviews for ON Whey 100% Chocolate 1kg</h3>
    </div>
    <div class="grid_3 productBorder omega">
    </div>
  </div>
  <div id="productReviews">
    <div class="grid_12 alignCenter">
      <h4>write a review</h4>
    </div>

    <div class="grid_4">

      <div class="productDescription embedMargin">
        <p class="embedMargin">Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses. The lens
          and frame are made up of more durable
          material. This makes them less likely to
          shatter during rigorous sports activity.
          Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses. The lens
          and frame are made up of more durable
          material. This makes them less likely to
          shatter during rigorous sports activity.
          Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses. The lens
          and frame are made up of more durable
          material. This makes them less likely to
          shatter during rigorous sports activity</p>

        Yes. Sports sunglasses are safer and
        sturdier than regular sunglasses
      </div>

    </div>
    <div class="grid_4">

      <div class="productDescription embedMargin">

        <p class="embedMargin">Yes. Sports sunglasses are safer and sturdier than regular sunglasses.</p>

        <p class="embedMargin">
          Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses. The lens
          and frame are made up of more durable
          material. This makes them less likely to
          shatter during rigorous sports activity.
          Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses. The lens
          and frame are made up of more durable
          material. This makes them less likely to
          shatter during rigorous sports activity


        </p>
        Yes. Sports sunglasses are safer and sturdier than regular sunglasses.
      </div>

    </div>
    <div class="grid_4 alpha omega ">

      <div class="productDescription embedMargin">

        <p class="embedMargin">Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses. The lens
          and frame are made up of more durable
          material. This makes them less likely to
          shatter during rigorous sports activity.
          Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses. The lens
          and frame are made up of more durable
          material. This makes them less likely to
          shatter during rigorous sports activity.</p>

        <p class="embedMargin">
          Yes. Sports sunglasses are safer and
          sturdier than regular sunglasses.


        </p>

        Yes. Sports sunglasses are safer and sturdier than regular sunglasses.
      </div>

    </div>
  </div>
</div>

</div>
</div>
</div>

</div>


<div class="row-fluid">
  <h4> ${variant.name} </h4>

  <div id="variant-detail" class="span12">
    <div class="span4">
      <ul class="thumbnails">
        <li class="span3 all-images-li">
          <c:forEach items="${variant.images}" var="image">
            <div class="thumbnail">
              <img class="variant-image" src="${image.slink}" alt="${image.altText}" caption=${image.caption}/>
            </div>
          </c:forEach>
        </li>
        <li class="span9 primary-image-li">
          <div class="thumbnail primary-image-div">
            <c:set var="primaryImage" value="${variant.primaryImage}"/>
            <img src="${primaryImage.mlink}" alt="${primaryImage.altText}"/>

            <p>${primaryImage.caption}</p>
          </div>
        </li>
      </ul>
    </div>

    <div class="span8">
      <div class="span6">
        <ul>
          <c:forEach items="${variant.keyPoints}" var="keyPoint">
            <c:if test="${keyPoint != null}">
              <li>${keyPoint}</li>
            </c:if>
          </c:forEach>
        </ul>
      </div>
      <div class="span6">
        <c:if test="${variant.discount > 0}">
          <span class="strike">Rs. ${variant.mrp}</span>

          <div class="clear"></div>
          now
        </c:if>
        Rs. ${variant.offerPrice}
        <c:if test="${variant.discount > 0}">
          <div class="clear"></div>
          <em>you save ${variant.discount}%</em>
        </c:if>
      </div>
      <div class="span12 variant-diff-attr-div">
        <c:forEach items="${variant.attributes}" var="attribute">
          <c:set var="selectedValue" value="${variant.selectedAttributes[attribute.name]}"/>
          <div class="span12 diff-attr" attr-name=${attribute.name}>
              ${attribute.displayName}

            <p>
              <c:forEach items="${attribute.attrValues}" var="attrValue">
                <c:set var="attrValCombination"
                       value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                      <span attr-val-name="${attrValue.internalValue}"
                            default-variant="${attrDefaultVariantMap[attrValCombination]}"
                            class="label diff-attr-val
                           ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? 'label-inverse selected-val' : ''}">
                          ${attrValue.displayValue}
                      </span>
              </c:forEach>
            </p>
          </div>
        </c:forEach>
      </div>

    </div>


  </div>
  <div id="spec-group-attr" class="span12">
    <table class="table table-striped table-bordered spec-group">
      <c:forEach items="${variant.groups}" var="group">
        <thead>
        <th colspan="2" group-name="${group.name}">${group.displayName}</th>
        </thead>
        <c:forEach items="${group.groupValues}" var="groupValue">
          <tr>
            <td>${groupValue.displayName}</td>
            <td>${groupValue.value}</td>
          </tr>
        </c:forEach>
      </c:forEach>
    </table>
  </div>

  <div class="span12">
      ${variant.description}
  </div>
</div>

</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript">

    function buildFilterKey(allAttrDivs, currAttrDiv, currAttrValSpan) {
      var filterKey = "";
      var currAttrName = currAttrDiv.attr("attr-name");
      var currAttrVal = currAttrValSpan.attr("attr-val-name");

      allAttrDivs.each(function() {
        var attrName = $(this).attr("attr-name");
        if (attrName != currAttrName) {
          var selectedDiffAttrValue = $(this).find('span.diff-attr-val.selected-val').attr("attr-val-name");
          filterKey += attrName + "${filterKeyValueSeperator}" + selectedDiffAttrValue + "${filterSeperator}";
        } else {
          filterKey += currAttrName + "${filterKeyValueSeperator}" + currAttrVal + "${filterSeperator}";
        }
      });
      return filterKey;
    }

    function buildFilterKeyVariantMap() {
      return {
        <c:forEach items="${variant.availableVariants}" var="availVariantMap" varStatus="ctr">
        "${availVariantMap.key}":"${availVariantMap.value}"
        <c:if test="${!ctr.last}">
        ,
        </c:if>
        </c:forEach>
      };
    }

    function buildCurrentSelection(attrDivToBeChanged) {
      var currSelection = " in ";
      var attrNameToBeChanged = attrDivToBeChanged.attr('attr-name');
      $('span.diff-attr-val.selected-val').each(function() {
        var attrName = $(this).parents('div.diff-attr').attr('attr-name');
        if (attrName != attrNameToBeChanged) {
          currSelection += $(this).text() + ", ";
        }
      });
      return currSelection;
    }

    $(document).ready(function() {
      var keyVariantMap = buildFilterKeyVariantMap();

      var variantDiffAttributesDiv = $('div.variant-diff-attr-div');
      $('img.imgBox1').click(function() {
        var primaryImageDiv = $('div.parentImg');
        var primaryImage = primaryImageDiv.find('img');
        var primaryImageCaption = primaryImageDiv.find('p');
        primaryImage.attr("src", $(this).attr("src"));
        primaryImage.attr("alt", $(this).attr("alt"));
        primaryImageCaption.text($(this).attr("caption"));
      });

      $('span.diff-attr-val:not(.selected-val)').click(function() {
        var parentAttrDiv = $(this).parents('div.diff-attr');
        var diffAttrDivs = variantDiffAttributesDiv.find('div.diff-attr');
        var key = "";
        var currentAttrValSpan = $(this);
        key = buildFilterKey(diffAttrDivs, parentAttrDiv, currentAttrValSpan);
        if (keyVariantMap[key] == null) {
          window.location.href = "${pageContext.request.contextPath}/variant/StoreVariant.action?pre&storeVariantId=" + $(this).attr("default-variant");
        } else {
          window.location.href = "${pageContext.request.contextPath}/variant/StoreVariant.action?pre&storeVariantId=" + keyVariantMap[key];
        }
      });

      $('span.diff-attr-val:not(.selected-val)').mouseleave(function() {
        $(this).removeClass('label-important');
        $(this).removeClass('label-success');
        $(this).removeAttr("title");
        $(this).tooltip('hide');
      });

      $('span.diff-attr-val:not(.selected-val)').mouseenter(function() {
        var parentAttrDiv = $(this).parents('div.diff-attr');
        var diffAttrDivs = variantDiffAttributesDiv.find('div.diff-attr');
        var key = "";
        var currentAttrValSpan = $(this);
        key = buildFilterKey(diffAttrDivs, parentAttrDiv, currentAttrValSpan);


        if (keyVariantMap[key] == null) {
          var currSelection = buildCurrentSelection(parentAttrDiv);
          //            $(this).attr("title", "Not available" + currSelection);
          $(this).addClass('label-important');
          $(this).tooltip({
            title:"Not available" + currSelection
          });
          $(this).tooltip('show');
        } else {
          $(this).addClass('label-success');
        }
      });


      /*Fixing the left nav*/


      var initialHeight = $("#alsoBoughtContainer").offset().top + 70;

      $(".navBox").css("top", initialHeight);

      $(window).scroll(function(e) {
        if ($(window).scrollTop() > initialHeight) {
          /*console.log(initialHeight);*/
          $('.navBox').css({
            position: 'fixed',
            top: 10
          });
        } else {
          $('.navBox').css({
            position: 'absolute',
            top: initialHeight
          });
        }
      });


      /*Left nav fixing ends here*/


      /*key value css selectors menubar begins here*/


      /*key value css selectors menubar ends*/


    });
  </script>
</s:layout-component>
</s:layout-render>