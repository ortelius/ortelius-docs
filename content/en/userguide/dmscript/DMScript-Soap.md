---
title: "Soap"
linkTitle: "Soap"
weight: 98
description: >
  Make a call to an external Soap-based API.
---

_soap_ is used to make a call to an external soap-based API. It takes two mandatory parameters: the URL to which the message should be sent and string containing the XML message body. There are three optional parameters which allow for the SOAP action to be specified, for cookies to be passed (or received if the cookie parameter is a string) and for a credential object to be passed for basic authentication.

**Usage:**

soap(url,payload[,soapaction[,cookiejar[,credential]]])

| Parameters| Description|
| --- | --- |
|url | Is the URL to which the XML payload (the SOAP message) should be posted.|
|payload| Is the XML payload, a string containing the SOAP message that represents the request body of the SOAP request.|
|soapaction| Optional. If specified this is included as a SOAPAction in the HTTP Header.|
|cookiejar | Optional. If specified this is an array of name/value pairs representing the cookies to be set in the request.|
|credential| Optional. If specified, this is a credential object used for basic authentication.|

**Returns:**

Array: An associate array which is a decoded version of the XML reply from the SOAP call. See xmlparse above for more information on the rules employed to do this.

**Example:**
Call an external SOAP service to list cities in a specified country:

```bash
set soapmessage = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
"<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"

"<soap:Body>"
"    <GetCitiesByCountry xmlns=\"http://www.webserviceX.NET\">"
"      <CountryName>Ukraine</CountryName>"
"    </GetCitiesByCountry>"
"  </soap:Body>"
"</soap:Envelope>";

set soapres = soap("http://www.webserviceX.NET/globalweather.asmx",$soapmessage,
"http://www.webserviceX.NET/GetCitiesByCountry");

set res=${soapres.Envelope.Body.GetCitiesByCountryResponse.GetCitiesByCountryResult};

set jsonvals = ${res.xmlparse()};

for (i=0;$i<${jsonvals.NewDataSet.Table.length()};i=$i+1) {
 echo "City=${jsonvals.NewDataSet.Table[$i].City}";
}
```

The returned XML will look like this:

```bash
\<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"\>

\<soap:Body\>

\<GetCitiesByCountryResponse xmlns="http://www.webserviceX.NET"\>

\<GetCitiesByCountryResult\> lt;NewDataSet &gt;

 &lt;Table &gt;

 &lt;Country&gt;Ukraine &lt;/Country&gt;

 &lt;City&gt;Boryspil&lt;/City&gt;

 &lt;/Table&gt;

 &lt;Table&gt;

 &lt;Country&gt;Ukraine&lt;/Country&gt;

 &lt;City&gt;Simferopol&lt;/City&gt;

 &lt;/Table&gt;

 &lt;Table&gt;

 &lt;Country&gt;Ukraine&lt;/Country&gt;

 &lt;City&gt;Kharkiv&lt;/City&gt;

 &lt;/Table&gt;

 &lt;Table&gt;

 &lt;Country&gt;Ukraine&lt;/Country&gt;

 &lt;City&gt;Kyiv&lt;/City&gt;

 &lt;/Table&gt;

 &lt;Table&gt;

 &lt;Country&gt;Ukraine&lt;/Country&gt;

 &lt;City&gt;L'Viv&lt;/City&gt;

 &lt;/Table&gt;

 &lt;Table &gt;

 &lt;Country &gt;Ukraine lt;/Country &gt;

 &lt;City &gt;Odesa lt;/City &gt;

 &lt;/Table &gt;

 &lt;/NewDataSet &gt; lt;/GetCitiesByCountryResult\>

\</GetCitiesByCountryResponse\>

\</soap:Body\>

\</soap:Envelope\>
```

Due to the way the reply is constructed, the \<GetCitiesByCountryResult\> tag contains HTML escaped data. We therefore pull this from the Array using dot syntax:

```bash
soapres.Envelope.Body.GetCitiesByCountryResponse.GetCitiesByCountryResult
```

We then need to parse the XML contained within the GetCitiesByCountryResult:

```bash
set jsonvals = ${res.xmlparse()};
```

We can then loop around this parsed data, printing out the cities:

```bash
for (i=0;$i\<${jsonvals.NewDataSet.Table.length()};i=$i+1) {

echo "City=${jsonvals.NewDataSet.Table[$i].City}";

}
```

**See Also:**

restful\_get(), restful\_post()
