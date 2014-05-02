<script>
    function LogE() {

    }
    LogE.prototype = {
        constructor : LogE,

        push : function (info) {
            var url = "<hk:loggingURL/>?" + info,
                    img = document.createElement('img');
            <c:if test="<%=EnvConstants.isProdEnv()%>">img.src= url;</c:if>
        },
        create : function (errorObj) {
            var info = "";
            function getCookie(cname) {
                var name = cname + "=",
                        i = 0,
                        c = '',
                        ca = document.cookie.split(';');
                for(i = 0; i < ca.length; i++) {
                    c = ca[i].replace(/^\s+|\s+$/g, '');
                    if (c.indexOf(name)==0) {
                        return c.substring(name.length,c.length);
                    }
                }
                return "";
            }

            //convert any value i.e. object or array int a string
            for (err in errorObj) {
                if(typeof errorObj[err] === "object"){
                    errorObj[err] = this.getStringFromObject(errorObj[err]);
                }
            }

            //add some required params
            //this.pushInErrorObj(errorObj, "activePage", encodeURIComponent(location.href));
            this.pushInErrorObj(errorObj, "JSESSIONID", getCookie("JSESSIONID"));
            this.pushInErrorObj(errorObj, "userAgent", navigator.userAgent);
            this.pushInErrorObj(errorObj, "platform", navigator.platform);
            this.pushInErrorObj(errorObj, "cookieEnabled", navigator.cookieEnabled);
            this.pushInErrorObj(errorObj, "syslog_appName", "js_error_sv_" + getCookie("SERVERIDN"));

            info = this.prepareQString(errorObj);
            return info;
        },
        prepareQString : function(obj){
            var str = '';
            for (key in obj) {
                str += key + "=" + obj[key] + '&';
            }
            return str;
        },
        createAsynError : function(xhr){
            var errObj = {};
            return this.create();
        },
        createAsynException : function(response){
            var errObj = {};
            errObj["error"] = response;
            return this.create(errObj);
        },
        pushInErrorObj : function (obj, key, value){
            if ( obj[key] === undefined) {
                if (typeof value === "object") {
                    value = this.getStringFromObject(value);
                }
                obj[key] = value;
            }
        },
        getStringFromObject : function(obj){
            var str = '',
                    i = 0;
            if(typeof obj === 'string'){
                str = obj;
            } else if(typeof obj === "object"){
                if(obj.constructor === Array){
                    for(i in obj){
                        str += encodeURIComponent(obj[i])+',';
                    }
                } else {
                    for(i in obj){
                        str += i + '=' + obj[i] + '&';
                    }
                    str = encodeURIComponent(str);
                }
            }
            return str;
        }
    }

    var logE = new LogE();

    window.onerror = function(errDesc, url, lineNumber) {
        var err = {};
        err['error'] = errDesc;
        err['source'] = url;
        err['lineNumber'] = lineNumber;
        logE.push(logE.create(err));
    };

</script>
