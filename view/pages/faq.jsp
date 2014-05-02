<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" pageTitle="FAQ | Healthkart">
<s:useActionBean beanclass="com.hk.web.action.beta.hk.FAQAction" var="faqAction"/>
<s:layout-component name="content">
<div class="container clearfix">

<%--breadcrumbs begins--%>
<div class="hk-breadcrumb-cntnr mrgn-bt-10">
      <span>
        <a href="/" title="Home">Home</a>
      </span>
  <span>&raquo;</span>
  <span class="fnt-bold">FAQ</span>
</div>
<%--breadcrumbs ends--%>

<div class="ttl-cntnr">
  <span class="icn icn-sqre "></span>
  <h1>FAQ</h1>
  <span class="icn icn-sqre"></span>
</div>
<div class="row">
<div class="span4 faq-nav-box-cntnr" id="NavBox">
  <ul class="nav faq-nav-box">
    <li><a href="javascript:void(0)" data-target="#account">account</a><span>&raquo;</span></li>
    <li><a href="javascript:void(0)" data-target="#order">order</a><span>&raquo;</span></li>
    <li><a href="javascript:void(0)" data-target="#payment">payment</a><span>&raquo;</span></li>
    <li><a href="javascript:void(0)" data-target="#delivery">deliveries</a><span>&raquo;</span></li>
    <li><a href="javascript:void(0)" data-target="#return">returns & refunds</a><span>&raquo;</span></li>
    <li><a href="javascript:void(0)" data-target="#coupon">coupons & reward points</a><span>&raquo;</span></li>
  </ul>
</div>
<div class="span12" id="faqContainer">
<div id="account" class="mrgn-b-20">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>

    <h2 class="fnt-bolder fnt-caps">Account Related</h2>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What is 'My Account'? How do I update my information?</span>

      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>It is easy to update your HealthKart account and view your orders any time through 'My Account'. My Account'
        allows you complete control over your transactions on HealthKart. Manage/edit your personal data like address,
        phone numbers, email ids, change your password, track the status of your orders, place re-orders, find details
        about your reward points and your wishlist.</p>
    </div>
  </div>
</div>
<div id="order" class="mrgn-b-20">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>

    <h2 class="fnt-bolder fnt-caps">Order Status Related</h2>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What do the different order status mean?</span>

      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p><b>Payment Pending Authorization:</b> Your order has been logged and we are waiting for authorization from the payment
        gateway.</p>

      <p class="mrgn-t-5"><b>Payment Authorized, Order under Processing:</b> Authorization has been received from the payment
        gateway and your order is being processed by the seller.</p>

      <p class="mrgn-t-5"><b>COD Verification Pending:</b> Your order has been received by us but is processed only after a
        verification call if made to your number and you verify the COD order.</p>

      <p class="mrgn-t-5"><b>Order Shipped:</b> Your order has been shipped by the seller and is on its way to the location
        specified by you for delivery.</p>

      <p class="mrgn-t-5"><b>Order Cancelled:</b> The order was cancelled.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How do I know my order has been confirmed?</span>

      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>Once your order has been logged and payment authorization has been received, the seller confirms receipt of the
        order and begins processing it.</p>

      <p class="mrgn-t-5">You will receive an email containing the details of your order when the seller receives it and
        confirms the same. In this mail you will be provided with a unique Order ID, a listing of the item(s) you have
        ordered and the expected dispatch or delivery time.</p>

      <p class="mrgn-t-5">You will also be notified when the item(s) are shipped to you. Shipping details will be
        provided with the respective tracking number(s).</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">Can I order a product that is 'Out of Stock'?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>Unfortunately, products listed as 'Out of Stock' are not available for sale. Please use the 'Notify Me' feature
        to be informed of the product's availability. </p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How do I check the current status of my orders?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>You can review the status of your orders and other related information in the 'My Account' section</p>

      <p class="mrgn-t-5">In the My Account page, click on the 'My Orders' link to view the status of all your orders.
        To view the status of a specific order, click on the 'Order Number' link.</p>
    </div>
  </div>
</div>
<div id="payment" class="mrgn-b-20">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>

    <h2 class="fnt-bolder fnt-caps">Payment Related</h2>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How do I pay for a HealthKart purchase?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>There are zero hidden charges when you make a purchase on HealthKart. The prices listed for all the items are
        final and all-inclusive. The price you see on the product page is exactly what you pay.</p>

      <p class="mrgn-t-5">You may use Credit cards/Debit cards, Internet Banking and Cash on Delivery to make your
        purchase.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">Are there any hidden charges when I make a purchase on HealthKart?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>There are zero hidden charges when you make a purchase on HealthKart. The prices listed for all the items are
        final and all-inclusive. The price you see on the product page is exactly what you pay.</p>

      <p class="mrgn-t-5"> You would be charged Rs 50 delivery charges if your order is less than Rs 500. Also a Rs 50
        COD charges are applicable if your COD purchase is less than Rs 500.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What is Cash on Delivery?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>If you are not comfortable making an online payment on HealthKart.com, you can opt for the Cash on Delivery
        payment mode. With COD you can pay in cash at the time of actual delivery of the product at your doorstep,
        without requiring you to make any advance payment online.</p>

      <p class="mrgn-t-5">The maximum order value for a Cash on Delivery (C-o-D) payment is Rs 10,000. It is strictly a
        cash-only payment method. Rs 30 COD charges are applicable if your order total is less than Rs 500</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How do I pay using a credit/debit card?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p class="fnt-bold">Credit cards</p>

      <p class="mrgn-t-5">We accept payments made using Visa, MasterCard and American Express credit cards.</p>

      <p class="mrgn-t-5">To pay using your credit card at checkout, you will need your card number, expiry date,
        three-digit CVV number (found on the backside of your card). After entering these details, you will be
        redirected to the bank's page for entering the online 3D Secure password.</p>

      <p class="mrgn-t-5 fnt-bold">Debit cards</p>

      <p class="mrgn-t-5">We accept payments made using Visa, MasterCard and Maestro debit cards.</p>

      <p class="mrgn-t-5">To pay using your debit card at checkout, you will need your card number, expiry date
        (optional
        for Maestro cards), three-digit CVV number (optional for Maestro cards). You will then be redirected to your
        bank's secure page for entering your online password (issued by your bank) to complete the payment.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How do I place a Cash on Delivery (COD) order?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>All items that have the "Cash on Delivery Available" icon are valid for order by Cash on Delivery.</p>

      <p class="mrgn-t-5">Add the item(s) to your cart and proceed to checkout. When prompted to choose a payment
        option, select "Pay By Cash on Delivery". Enter the name and contact details of the person who would be receiving the
        COD order.</p>

        <p class="mrgn-t-5">Please verify your order by giving us a missed call on
          <span class="txt-blue">0124-4616414 </span>
          from the number you have given as Cash On Delivery number in the payment options.
          In case you are unable to make this call, we will give you a call to confirm the order.</p>

      <p class="mrgn-t-5">Once verified and confirmed, your order will be processed for shipment in the time specified,
        from the date of confirmation. You will be required to make a cash-only payment to our courier partner at the
        time of delivery of your order to complete the payment.</p>

      <p class="mrgn-t-5 fnt-bold">Terms & Conditions:</p>

      <p class="mrgn-t-5">The maximum order value for COD is Rd 10,000.</p>

      <p class="mrgn-t-5">Rs 30 COD charges for orders under Rs 500.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">I tried placing my order using my debit card/credit card/Net Banking but the order
        was not successful. What happens to the money deducted from the card?</span>
      <span class="icn icn-expand2 mrgn-bt-15 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-15 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>Please check your bank/credit card account to first ensure if your account has been debited. If
        your account has been debited after a payment failure, it is normally rolled back by banks within
        7 business days. The time taken can vary from bank to bank and we unfortunately won't be able
        to expedite this. Please check with your bank for more details.</p>

      <p class="mrgn-t-5">If your bank informs you otherwise please get back to us. If the money has been credited to
        our account we would initiate refund within 3 days of your request. Receipt of the refund would however depend on
        the mode of payment mode chosen by you. The expected timelines are as below:</p>

      <p class="mrgn-t-5">Net Banking 2-4 business days</p>

      <p class="mrgn-t-5">Debit Card 5-7 business days</p>

      <p class="mrgn-t-5">Credit Card 7-21 business days</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">I tried placing my order using my debit card/credit card/Net Banking but the order
        was not successful. What happens to HealthKart reward points deducted from my Account?</span>
      <span class="icn icn-expand2 mrgn-bt-15 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-15 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>In case your order is not successful and HealthKart reward points has been deducted from your
        account we would proactively initiate refund within 3 days.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What should I do if my payment fails?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>In case of a payment failure, please retry ensuring: Information passed on to payment gateway is
        accurate i.e. account details, billing address, password (for net banking) Your Internet connection
        is not disrupted in the process.</p>

      <p class="mrgn-t-5">If your account has been debited after a payment failure, it is normally rolled back to your
        bank
        account within 7 business days. You can email us on info@HealthKart.com or please give us a call
        with your order number for any clarification.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">Why is COD not available to me?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>Cash on Delivery (COD) option is not offered by our Courier partners at few serviceable locations.
        Also, COD option is not available on some of our products. Hence, based on your location and
        your choice of products, COD option may not be available to you. However, you can always opt
        for payment through Net Banking or Credit/Debit Card.</p>
    </div>
  </div>
</div>
<div id="delivery" class="mrgn-b-20">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>

    <h2 class="fnt-bolder fnt-caps">Delivery Related</h2>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How do you ship your orders?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>We ship certain heavy items such as treadmills, dumbbells etc. by ground couriers while other light items are shipped by air. We deliver most of our orders through our own delivery service - Healthkart Reach, or through courier partners such as Bluedart and FedEx. For a few remote locations where there is no other courier service available, we use India Post to deliver your orders.</p>
    </div>
  </div>
    <div class="faq-qa">
    <div class="row faq-question show-answer">
        <span class="span11 mrgn-lr-5">Do you ship to international locations?</span>
        <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
        <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
        <p>We currently ship only within India and do not ship to any international location.</p>
    </div>
    </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How much time does it take for an order to be delivered?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>We deliver your order within 2-3 working days post-dispatch in A-1 and A-2 Metros (New Delhi, Mumbai, Kolkata, Bengaluru, Chennai, Pune, Ahmedabad and Hyderabad). For the rest of the cities, we deliver between 2-5 business days. Delivery by ground takes a little longer than air couriers. Ground-shipped orders are delivered to you between 5-7 business days post-dispatch. Deliveries to very remote locations such as North East may take up to 7 business days or longer, depending on the location's geographical constraints.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5"> How can I track my order?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>As soon as we ship your order, you receive an e-mail notification with a link to track your order. You can also access this information from your 'My Account' section at the top right corner on our website <a href="${pageContext.request.contextPath}">www.healthkart.com</a>. Online tracking usually goes live within 24-48 business hours post shipping.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How long do you take to dispatch an order?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
        <p>The duration of dispatching an order depends on the type of order you have placed. Types of order are:</p>
        <p class="mrgn-t-5">In-stock items (Items that we stock in our 4 warehouses across India: Gurgaon, Mumbai, Bangalore and Delhi): These items are dispatched the same or the next day of order placement.</p>
        <p class="mrgn-t-5">JIT Items (Just-in-time Items): These items are procured from vendors on receiving your confirmation on an order. It takes 2-7 business days to dispatch JIT orders after you have placed an order.</p>
        <p class="mrgn-t-5">Drop-ship Items: These items are shipped directly by our vendors to you. It takes 2-5 business days to dispatch drop-ship orders.</p>
        <p class="mrgn-t-5">We strive to dispatch your order as soon as possible. In case you have placed a mixed order of In-stock, JIT and Drop-ship items, we sub-divide your order and dispatch it in parts, shipping the earliest available items first.</p>
        <p class="mrgn-t-5">At all steps of your order processing, we are in constant touch with you over phone, email and SMS to keep you updated.</p>
    </div>
  </div>
    <div class="faq-qa">
        <div class="row faq-question show-answer">
            <span class="span11 mrgn-lr-5">What are the shipping charges on <a href="${pageContext.request.contextPath}" class="txt-blue">healthkart.com?</a></span>
            <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
            <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
        </div>
        <div class="faq-answer hide">
            <p>We deliver an order free of cost at your doorstep for all orders above Rs 500. We bear all the Octroi/sales tax and there is no additional shipping charge that you have to pay at the time of the delivery.
            </p>
            <p class="mrgn-t-5">However, if you order amount is less than Rs 500, a minimal shipping charge of Rs 50 is applicable.</p>
            <p class="mrgn-t-5"><b>Note:</b> Certain additional procedures like state-wise taxes may apply to your order depending upon you order type, the utility of your order, the order size and the state/region the order is being delivered to.</p>
        </div>
    </div>
</div>
<div id="return" class="mrgn-b-20">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Returns & Refunds</h2>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What is the general return policy on HealthKart?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>14 Day Return Policy</p>

      <p class="mrgn-t-5">We offer you complete peace of mind while ordering at HealthKart - you can return all items
        within 14 days of receipt of goods.</p>

      <p class="mrgn-t-5">If you are not satisfied with what you have bought, we’ll gladly take it back within 14 days
        from the date of delivery. If you have paid by card then we will reverse the payment. In case of Cash on Delivery or
        Bank Deposits as modes of payment, we will issue a cheque in the registered name of the customer.</p>

      <p class="mrgn-t-5">We also will refund you the shipping charges in store credits. Please ensure however that the
        product is unused and the tags, boxes and other packaging is intact.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What should I do if I receive a Defective Item?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>If an item is found defective, please get in touch with our customer care on info@healthkart.com
        or call us on 0124-4616444 within 14 days of receipt of the product. We will arrange a reverse
        pickup for the product and then issue either a full refund, Healthkart Cash (store credit) or a different item
        in exchange, as per your request. Please note that replacements are subject to availability of the particular
        product.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">Is there a category specific policy for returns?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>Nutrition: Products should be received in original packaging and sealed condition. Opened or
        used boxes will not be accepted as returns. For issues like rashes, stomach upset, headache,
        flavor like/dislike, flavor difference from one brand to other etc. products would not be applicable for return.
        Please consult with the doctor before buying the product</p>

      <p class="mrgn-t-5">Sports & Fitness: Return policy is applicable only in case of issues with size of the apparel
        or footwear.</p>

      <p class="mrgn-t-5">Diabetes: Products in this category are NOT eligible for return</p>

      <p class="mrgn-t-5">Beauty: Returns will be considered for change of color requests</p>

      <p class="mrgn-t-5">Home Devices: Products in this category are NOT eligible for return</p>

      <p class="mrgn-t-5">Eye: If contact lenses are returned, they have to be returned in sealed boxes; opened or used
        lenses will not be accepted as returns. Lens solutions, lens cases are NOT eligible for returns</p>

      <p class="mrgn-t-5">Personal Care: Adult Diapers, Women hygiene products (sanitary napkins, tampons, panty
        liners), Condoms, Ovulation Kits, Toothbrushes, Toothpastes etc. are NOT eligible for returns</p>

      <p class="mrgn-t-5">Parenting: Ovulation Kits and Diapers are NOT eligible for returns</p>

      <p class="mrgn-t-5">Following shall NOT be eligible for return or replacement:</p>

      <p><span class="mrgn-r-10">1.</span>Damages due to misuse of product</p>

      <p><span class="mrgn-r-10">2.</span>Incidental damage due to malfunctioning of product</p>

      <p><span class="mrgn-r-10">3.</span>Any consumable item which has been used or installed</p>

      <p><span class="mrgn-r-10">4.</span>Products with tampered or missing serial / UPC numbers</p>

      <p class="mrgn-t-5">Any damage / defect which are not covered under the manufacturer's warranty</p>

      <p class="mrgn-t-5">Any product that is returned without all original packaging and accessories, including the
        box,
        manufacturer's packaging if any, and all other items originally included with the product(s) delivered</p>

      <p class="mrgn-t-5">Some special rules for promotional offers may override "Healthkart.com's 14 Day Returns
        Policy"</p>

      <p class="mrgn-t-5">In case of any queries, please write to our customer care on info@healthkart.com or call us on
        0124-4616444</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">I need to return an item, how do I arrange for a pick-up?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>You can Contact Us to initiate a return. You will receive a call explaining the process, once you
        have initiated a return.</p>

      <p class="mrgn-t-5">Wherever possible we will facilitate the pick-up of the item through HealthKart Reach or
        through
        our courier partners like FEDEX, bluedart etc. In case, the pick-up cannot be arranged by us, you
        can return the item through a third-party courier service and we will return the courier costs.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What are the modes of refund available after cancellation?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p> In order to confirm cancellation of item(s) in your order, you need to indicate your refund preference.</p>

      <p class="mrgn-t-5">There are two modes of refund:</p>

      <p class="mrgn-r-10">HealthKart Cash - If you choose this option, the amount will be added to your HealthKart reward points.</p>

      <p class="mrgn-r-10">Back to Source - In this case, the money will be refunded back to the payment mode/account that
        was originally used to make the transaction.</p>

      <p class="mrgn-t-5">Once you have requested the cancellation of item(s) in your order, HealthKart will complete
        the
        cancellation and initiate the refund, depending on your preference.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What is the validity period of reward points?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>The validity period of reward points is generally 180 days from the date of issue. Please check
        your reward points email for exact date.</p>
    </div>
  </div>
</div>
<div id="coupon" class="mrgn-b-20">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>

    <h2 class="fnt-bolder fnt-caps">Coupons & Reward Points</h2>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What is a promo coupon?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>To give you the best deals around, we occasionally issue promo coupons. It is a simple code
      which can be applied to get discounts.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">Can I club two coupons in one purchase?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>No two coupons can be applied at the same time. In general our promotions cannot be used in
      conjunction with any other offer.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">How do I use a promo coupon?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>Add products you want to shop in your cart. Once you are on the cart page, you will see the list of
      offers available for you which you can apply on your cart. Also you can enter the coupon code on
      this page. You would have to be logged in to be able to use any offers or coupons.</p>
    </div>
  </div>
  <div class="faq-qa">
    <div class="row faq-question show-answer">
      <span class="span11 mrgn-lr-5">What is the validity period of reward points?</span>
      <span class="icn icn-expand2 mrgn-bt-5 mrgn-lr-5 show-answer-icn"></span>
      <span class="icn icn-collapse2 mrgn-bt-5 mrgn-lr-5 hide-answer-icn hide"></span>
    </div>
    <div class="faq-answer hide">
      <p>The validity period of reward points is generally 180 days from the date of issue. Please check
      your reward points email for exact date.</p>
    </div>
  </div>
</div>
</div>
</div>
</div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript">
    $(document).ready(function () {

      var reftag = "#${faqAction.reftag}";
      if(reftag != null) {
          var target = $(reftag);
          /*console.log(target);*/
          HK.utils.Scroll.toElement($(target));
      }

      $('.faq-nav-box li a').click(function () {
        var target = $(this).data('target');
        HK.utils.Scroll.toElement($(target));
      });
      /*expand collapse faq's begins*/
      $('.faq-question').click(function () {
        if ($(this).hasClass('show-answer')) {
          $(this).removeClass('show-answer').addClass('hide-answer');
          $(this).children('.show-answer-icn').hide();
          $(this).children('.hide-answer-icn').show();
          $(this).parent().children('.faq-answer').slideDown('slow');
        }
        else {
          $(this).addClass('show-answer').removeClass('hide-answer');
          $(this).children('.show-answer-icn').show();
          $(this).children('.hide-answer-icn').hide();
          $(this).parent().children('.faq-answer').slideUp('slow');
        }
      });


      /*expand collapse faq's ends*/
      function fixFAQNav() {
        var initialHeight = $(".faq-nav-box-cntnr").offset().top;
        var bottomHeight = $("#footer").offset().top - $(".faq-nav-box-cntnr").height();
        $(window).scroll(function (e) {
          if ($(window).scrollTop() > initialHeight) {
            if($(window).scrollTop() < bottomHeight){
              $('.faq-nav-box').css({
                position: 'fixed',
                top: 10
              });
            } else {
              $('.faq-nav-box').css({
                position: 'absolute',
                top: bottomHeight
              });
            }
          } else {
            $('.faq-nav-box').css({
              position: 'absolute',
              top: initialHeight
            });
          }
        });
      }

      fixFAQNav();
    });

  </script>
</s:layout-component>
</s:layout-render>