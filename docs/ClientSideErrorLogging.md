Client-side error logging
===

Introduction
---
Error logging of erros encountered by user is required if we want to identify the issues faced by a client. Although entire code is tested before deploying on to production, but its a well proven fact that no piece of software is 100% bug free. On 30th Jan 2013, Healthkart also statred logging errors coming on client machines.

Scope
---
###Platforms covered
As of now, client-side error logging is being done only for Healtkart.com's desktop version. Further the scope is reduced by the fact that this logging has been implemented only on pages being served by new code repository i.e HKWeb

###Type of errors logged
1. **Unhandled errors**: Any error that is not handled by any catch statement, and is thrown implicitly or explicitly onto window object of browser is considered as unhandled error. Any such error if logged, must be evaluated ASAP.
	1. [Any issues in rendering on IE8 due to GTM tool](https://healthkart.loggly.com/search#terms=json.error%3A%22HTML%20Parsing%20Error%3A%20Unable%20to%20modify%20the%20parent%20container%20element%20before%20the%20child%20element%20is%20closed%20(KB927917)%22&from=-1d&until=now&source_group=)
	2. Any undeclared variable or method on any page
2. **Failed asynchronous calls**: Certain AJAX calls fail unexpectedly or the response for AJAX call contains an exception. Some of such interactions are being tracked. Below is the list of tracked AJAX calls
	1. [Add to cart calls](https://healthkart.loggly.com/search#terms=%20json.target%3A%22%2Fapi%2Fcart%2FproductVariant%2Fadd%22&from=-1d&until=now&source_group=)
	2. [Add to compare calls](https://healthkart.loggly.com/search#terms=json.target%3A%22%2Fapi%2Fvariant%2Fcompare%2Fadd%22&from=-1d&until=now&source_group=)

##How is it done
**Step 1:Preparing logs on client** : JavaScript is used to achieve this. JavaScript handles all the unhandled/asynchronous call erros and convert it into a query string containing some additional information about client.

**Step 2:Pushing onto Logging server** : Once query string is created it is appended to the URL of logging server. The request to log error is sent in the form of [HTTP GET request](https://www.loggly.com/docs/api-sending-data/). Loggly is responsible for handling all such requests and converting query string into user friendly JSON.

##How to use these logs
Loggly can be used to go through events being tracked. Loggly allowes [searching](https://www.loggly.com/docs/search-overview/), sorting and [filtering](https://www.loggly.com/docs/search-query-language/) of logs. So with the help of Loggly traversing logs is easier as compared to evaluating a monolithic plain text file. You can even [save](https://www.loggly.com/docs/saved-searches/) any search pattern and create [alerts](https://www.loggly.com/docs/adding-alerts/) for same.

##Issues
1. **Improper information**: As of now unhandled exceptions are handled using _window.onerror_ mechanism. Although IE 8+ support this method fully, other popular browsers are still supporting this method partially. This leads to partial information about the errors. Browsers like Safari have started to support this functionality fully, but only in the latest version.
2. **Third party plugins**: Some users block execution of third party plugins on browser. This cause huge number of errors being generated on client machine. Error logging of such events is not of much use.