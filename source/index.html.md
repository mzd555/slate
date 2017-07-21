---
title: API Reference

language_tabs:
  - shell

toc_footers:
- <h2><a href='http://deliverysolutions.co'>Back to Site</a></h2>

includes:

search: true
---

# Introduction

## Authentication

> Example call with API key passed in the request header

```shell
  curl -X GET https://api.gateway.com/stores \
    --header "Content-Type:application/json" \
    --header "apikey:8153ae5698c34cc51212bef9de23a1df1"  
```

After your account has been setup, you will be provided with an API key. Please make sure to keep this key secured and never embed it in client-side code.
You must pass the <code>API Key</code> in the request header with the value <code>apikey</code>.

Requests made without an API key will return a <code> 401 Unauthorized response</code>.

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

## Status Codes

The API uses conventional HTTP response codes to indicate success or failure on all requests.

Status Code	| Result
------------- | --------
<b>200 OK</b> |	Request completed as expected.
<b>201 Created</b>	 | Used for requests that create new objects (i.e. DeliveryEstimate, Delivery).
<b>204 No Content</b> |	The server has completed the request but does not need to return a body (i.e. DELETE requests).
<b>400 Bad Request </b>|	The request contains invalid/missing information or is out of context. The status text will contain more specific message(s).
<b>401 Unauthorized </b>|	Authentication credentials were missing or incorrect.
<b>403 Forbidden</b> |	The request is understood, but it has been refused or access is not allowed.
<b>404 Not Found </b> |	The requested resource could not be found.
<b>429 Client Error </b>|	 The request was refused per our rate limiting policy.
<b>50X Errors </b> |	Occur when something goes wrong in the API.

# Models

## Contact
Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | true | Full name
phone | string | true | Phone

## Customer Info
Property | Type | Required | Description
-------- | ---- | -------- | -----------
first_name | string | true | First Name
last_name | string | true | Last Name
middle_name | string | true | Middle Name
phone | string | true | Phone
email | string | false | Email
business_name | string | false | Business Name
should_email | bool | false | Should Email
should_sms | bool | false | Should SMS
custom_fields | List<CustomFields> | false | CustomFields : List<CustomFields>

## CustomFields
Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | true | Name
value | string | true | Value
type | string | true | CustomFieldValueType : Default(string)

## CustomFieldValueType
Property | Type | Required | Description
-------- | ---- | -------- | -----------
type | string | true | (json, string, csv)


## Dates, Times
All dates and times in the API are expressed in <a href='http://en.wikipedia.org/wiki/ISO_8601'> ISO 8601 </a>, with a UTC offset (denoted by the Z).


## Delivery Details
Property | Type | Required | Description
-------- | ---- | -------- | -----------
name_of_driver | string | true | Name of Driver
phone_of_driver | string | true | Phone Number of Driver
driver_lat | string | true | Driver location lat
driver_long | string | true | Driver location long
dropoff_notes | string | true | Dropoff Notes
dropoff_signature | string | true | Dropoff Signature
dropoff_photo | string | true | Dropoff Photo

## Dimension
Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | false | custom measurements already defined such as 'small','medium' etc.
weight | decimal | false | Weight
size | Size | false | height, width , depth in inches.

Note: name or weight & size is required.

## Department

Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | true | Name of the department.
description | string | false | Description of the department.
deliveryInstructions | string | false | Delivery instructions for the driver / label / packaging.

## Generic Entity
Property | Type | Required | Description
---- | ----- | ---- | ----
name | string | true | name of the entity
value | string | false | value of the entity

## Location
Property | Type | Required | Description
-------- | ---- | -------- | -----------
address_1 | string | true | Address Line 1
address_2 | string | true | Address Line 2
city | string | true | City
state | string | true | State
zip | string | true | Zip


## Notification
Property | Type | Required | Description
-------- | ---- | -------- | -----------
email | string | true | Email
sms | string | true | SMS
url | string | true | Url (might not need it at all)


## Order Status

Name | Key |  Description
-------- |  -------- | -----------
Order Placed | order_placed | Order has been placed and excepted by the DSP.
Received | order_received |  a request has been received by the system and it is being processed.
Failed | request_failed | an estimate or order request has failed.
Estimates Received | estimates_received | one or more estimates have been obtained for the request.
Estimates Failed | estimates_failed | no valid estimates received against the request.
Dispatched to DSP | dispatched_to_dsp | Order has been dispatched to the DSP.
Order Confirmed | order_confirmed | a dispatched order has been confirmed.
Pickup Complete | pickup_complete | DSP has successfully acquired the package.
Shipping | shipping | package is en-route.
Delivered | order_delivered | order has been delivered.
Canceled | order_canceled | order has been canceled.

## Phone
Property | Type | Required | Description
-------- | ---- | -------- | -----------
number | string | true | Number
extension | string | true | Extension
department | string | true | Department

## Product
Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | true | Name
price | decimal | true | Price
sku | string | true | Sku
height | decimal | true | Height
width | decimal | true | Width
depth | decimal | true | Depth
weight | decimal | true | Weight
is_fragile | bool | true | IsFragile
custom_fields | List<CustomFields> | true | CustomFields : List<CustomFields>

## Size
Property | Type | Required | Description
-------- | ---- | -------- | -----------
height | decimal | false | Height
width | decimal | false | Width
depth | decimal | false | Depth

## Store
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | string | true | Store ID assigned by the system when creating the store and retrieved by the GetStoreList api call.
name | string | true | Store name provided when creating the store.

* either id or name is required.

## Time
Property | Type | Required | Description
-------- | ---- | -------- | -----------
ready_for_pick_up | string | true | Ready for Pick up
deliver_by | string | true | Deliver by

## Timezones

Name | Description
-----| -----------
America/Los_Angeles | Pacific Time (PT)
America/Edmonton | Mountain Time (MT)
America/Chicago | Central Time (CT)
America/New_York | Eastern Time (ET)


# Store Resource

## Create Store
### HTTP Request

`POST http://api.gateway.com/api/v1/store`

> Request

```json

 {
   "name": "HighlandPark-53-tesstasdasd",
   "storeExternalId": "test",
   "description": "General Store in Highlasnd Park",
   "timeZone": "America/Chicago",
   "contact": {
     "name": "Peter Brown",
     "phone": "214-234-2232"
   },
   "deliveryInstructions": "always be smiling",
   "address": {
     "street": "123 Main St",
     "street2": "",
     "secondary": "",
     "city": "Highland Park",
     "state": "TX",
     "zipcode": "75062"
   },
   "departments": [
     {
       "name": "Produce",
       "description": "Fresh Produce and Vegetables",
       "deliveryInstructions": "might be wet"
     },
     {
       "name": "Electronics",
       "description": "Electronics and Phones",
       "deliveryInstructions": "Handle with care"
     }
   ],
   "DSPs": [
     {
       "name": "FedEx"
     },
     {
       "name": "Postmates"
     }
   ]
 }

```
> Response

```json
{
    "_id": "5972264460cfc7548926536e",
    "tenantId": "lash",
    "active": true,
    "name": "HighlandPark-53-tesstasdasd",
    "storeExternalId": "test",
    "description": "General Store in Highlasnd Park",
    "timeZone": "America/Chicago",
    "contact": {
        "name": "Peter Brown",
        "phone": "214-234-2232"
    },
    "deliveryInstructions": "always be smiling",
    "address": {
        "street": "123 Main St",
        "street2": "",
        "secondary": "",
        "city": "Highland Park",
        "state": "TX",
        "zipcode": "75062"
    },
    "departments": [
        {
            "name": "Produce",
            "description": "Fresh Produce and Vegetables",
            "deliveryInstructions": "might be wet"
        },
        {
            "name": "Electronics",
            "description": "Electronics and Phones",
            "deliveryInstructions": "Handle with care"
        }
    ],
    "DSPs": [
        {
            "name": "FedEx",
            "corporateDspId": "5972264460cfc7548926536b"
        },
        {
            "name": "Postmates",
            "corporateDspId": "5972264460cfc7548926536c"
        }
    ]
}


```

Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | true | Name of the store (must be unique among other stores)
description | string| false | Description of the store.
timeZone | [Timezone](#timezone) | true | Timezone that the store is located in.
contact | [Contact](#contact) | true | Contact information for the store.
deliveryInstructions | string | false | Delivery Instructions for the store.
address | [Location](#location) | true | Location of the store.
departments | Array of [Department](#department) | true | Departments.
DSPs | [Generic Entity](#generic-entity) | false | List of the DSPs that the store would utilize for delivery.

## List Stores
### HTTP Request

`GET http://baseapi.co/api/v1/store`

Get all the configured stores in the system.

> Response

```json
[
   {
      "_id":"59314bd26f228d23619634c4",
      "tenantId":"lash",
      "active":false,
      "name":"dsf123",
      "description":"",
      "contact":{
         "name":"df",
         "phone":"454-545-4545"
      },
      "deliveryInstructions":"",
      "address":{
         "street":"dsf",
         "street2":"",
         "secondary":"",
         "city":"dsf",
         "state":"KY",
         "zipcode":"44444"
      },
      "departments":[
         {
            "name":"dsf",
            "description":"",
            "deliveryInstructions":""
         }
      ],
      "DSPs":[
         {
            "name":"fedex",
            "corporateDspId":"592eafb9a974d14f0273068f"
         }
      ],
      "deleted":{
         "deleteTime":1496402934608,
         "user":{
            "_id":"591c5b75b9d21c04c34612e1",
            "tenantId":"lash",
            "address":{
               "zipcode":"12200",
               "street":"Sohna",
               "street2":"",
               "secondary":"",
               "city":"Gurgaon",
               "state":"KY"
            },
            "password":"$2a$10$RZmUPcRtx33wp2ZWaenET.4YojoU514U05AgjFGtO2DF./eQ6e3ay",
            "role":"admin",
            "acive":true,
            "active":true,
            "email":"sgoyal@gmail.com",
            "corporateName":"Sourabh",
            "contact":"887-756-4449",
            "notification":{
               "email":true,
               "phone":false
            },
            "accountNumber":"KY-0000"
         }
      },
      "timeZone":"America/Chicago"
   },
   {
      "_id":"591c4c18b9d21c04c34612e0",
      "tenantId":"lash",
      "name":"ABC",
      "description":"",
      "contact":{
         "phone":"2342354544",
         "name":"Sourabh"
      },
      "deliveryInstructions":"",
      "address":{
         "zipcode":"45453",
         "street":"sdfds",
         "street2":"",
         "secondary":"",
         "city":"assaf",
         "state":"KY"
      },
      "departments":[
         {
            "name":"Dept1",
            "description":"",
            "deliveryInstructions":""
         }
      ],
      "DSPs":[
         {
            "name":"fedex",
            "corporateDspId":"591051908195721f2bde578a"
         },
         {
            "name":"postmate",
            "corporateDspId":"59105959bc91c21691f43613"
         }
      ],
      "active":false,
      "deactivateBy":{
         "user":{
            "_id":"591c5b75b9d21c04c34612e1",
            "tenantId":"lash",
            "corporateName":"Sourabh",
            "password":"$2a$10$RZmUPcRtx33wp2ZWaenET.4YojoU514U05AgjFGtO2DF./eQ6e3ay",
            "accountNumber":"KY-0000",
            "role":"admin",
            "active":true,
            "email":"sgoyal@gmail.com",
            "contact":"887-756-4449",
            "address":{
               "street2":"",
               "secondary":"",
               "city":"Gurgaon",
               "state":"KY",
               "zipcode":"12200",
               "street":"Sohna"
            },
            "notification":{
               "email":true,
               "phone":false
            },
            "acive":true
         },
         "updateOn":1496324714467
      },
      "activateBy":{
         "user":{
            "_id":"591c5b75b9d21c04c34612e1",
            "password":"$2a$10$RZmUPcRtx33wp2ZWaenET.4YojoU514U05AgjFGtO2DF./eQ6e3ay",
            "accountNumber":"KY-0000",
            "role":"admin",
            "acive":true,
            "active":true,
            "tenantId":"lash",
            "email":"sgoyal@gmail.com",
            "corporateName":"Sourabh",
            "contact":"887-756-4449",
            "address":{
               "state":"KY",
               "zipcode":"12200",
               "street":"Sohna",
               "street2":"",
               "secondary":"",
               "city":"Gurgaon"
            },
            "notification":{
               "email":true,
               "phone":false
            }
         },
         "updateOn":1496324717534
      },
      "deleted":{
         "user":{
            "email":"sgoyal@gmail.com",
            "address":{
               "secondary":"",
               "city":"Gurgaon",
               "state":"KY",
               "zipcode":"12200",
               "street":"Sohna",
               "street2":""
            },
            "notification":{
               "email":true,
               "phone":false
            },
            "password":"$2a$10$RZmUPcRtx33wp2ZWaenET.4YojoU514U05AgjFGtO2DF./eQ6e3ay",
            "acive":true,
            "tenantId":"lash",
            "corporateName":"Sourabh",
            "contact":"887-756-4449",
            "accountNumber":"KY-0000",
            "role":"admin",
            "active":true,
            "_id":"591c5b75b9d21c04c34612e1"
         },
         "deleteTime":1496325324448
      },
      "timeZone":"America/Chicago"
   }
]


```

## Get Store by ID [DOESN'T WORK]

### HTTP Request

`GET http://api.gateway.com/stores/<id>`

### URL Parameters

Parameter | Type | Description
--------- | ------- | -----------
ID | string |Store ID

> Response

```json

{
    "name": "MidTown",
    "description": "",
    "contact": {
      "name": "John Doe",
      "phone": "2342354544"
    },
    "deliveryInstructions": "",
    "address": {
      "street": "123 Main St",
      "street2": "",
      "secondary": "",
      "city": "Dallas",
      "state": "TX",
      "zipcode": "75963"
    },
    "departments": [
      {
        "name": "Electronics",
        "description": "Electronic deparment",
        "deliveryInstructions": ""
      }
    ],
    "DSPs": [
      {
        "name": "Fedex"
      },
      {
        "name": "Postmates"
      }
    ]
  }
  
```

## Get Store by Alias [DOESN'T WORK]

### HTTP Request

`GET http://api.gateway.com/stores/<alias>`

### URL Parameters

Parameter | Type | Description
--------- | ----------- | -----
alias | string | Store's alias

> Response

```json

{
    "_id": "591c4c18b9d21c04c34612e0",
    "name": "MidTown",
    "description": "",
    "contact": {
      "name": "John Doe",
      "phone": "2342354544"
    },
    "deliveryInstructions": "",
    "address": {
      "street": "123 Main St",
      "street2": "",
      "secondary": "",
      "city": "Dallas",
      "state": "TX",
      "zipcode": "75963"
    },
    "departments": [
      {
        "name": "Electronics",
        "description": "",
        "deliveryInstructions": ""
      }
    ],
    "DSPs": [
      {
        "name": "fedex"
      },
      {
        "name": "postmate"
      }
    ],
    "active": true
  }
  
```

# Estimate Resource

## Create an Estimate

> Sample Request

```json
{
  "_id": "595b4634bdd429000192e7b0",
  "userEmail": "dmart@gmail.com",
  "storeExternalId": "LASH at Lamar",
  "orderExternalId": "abcd-dfndnf",
  "department": "Apparel",
  "orderValue": 121,
  "userPickupTime": null,
  "dropOffTime": null,
  "deliveryContact": {
    "name": "ali jam",
    "phone": "972-499-0672"
  },
  "deliveryAddress": {
    "street": "211234 Bammel North Houston Rd",
    "street2": "Apt/Suite",
    "secondary": "",
    "city": "Houston",
    "state": "TX",
    "zipcode": "77014",
    "apartment": "no"
  },
  "packages": [
    "large"
  ],
  "isSpirit": false,
  "isBeerOrWine": false,
  "isFragile": false,
  "hasRefrigeratedItems": false,
  "hasPerishableItems": false,
  "notifications": {
    "url": "ali jam",
    "email": [
      "ali jam"
    ],
    "sms": [
      "ali jam"
    ]
  }
} 
```
 
 > Sample Response
 
 ```json
 [
   {
      "_id":"59722a611f0b250001a03e2e",
      "provider":"FedEx",
      "serviceType":"LM",
      "estimatedPickupTime":1500656820000,
      "estimatedPickupTimeByZone":"July 21st 2017, 10:07:00 am",
      "estimatedDeliveryTime":1500685200000,
      "estimatedDeliveryTimeByZone":"July 21st 2017, 6:00:00 pm",
      "expires":null,
      "currency":"cents",
      "amount":450,
      "chargeDetails":[
         {
            "currency":"cents",
            "name":"DIRECT SIGNATURE REQUIRED",
            "amount":450
         }
      ],
      "tenantId":"D-mart",
      "active":true,
      "RequestBody":{
         "userEmail":"dmart@gmail.com",
         "storeExternalId":"Headspace",
         "orderExternalId":"4444",
         "department":"Alcohol",
         "orderValue":100,
         "userPickupTime":null,
         "dropOffTime":null,
         "deliveryContact":{
            "name":"Manil Uppal",
            "phone":"919-949-2639"
         },
         "deliveryAddress":{
            "street":"2801 Middle Gate Ln",
            "street2":"",
            "secondary":"",
            "city":"Plano",
            "state":"TX",
            "zipcode":"75093",
            "apartment":"no"
         },
         "packages":[
            {
               "name":"small",
               "size":{
                  "width":5,
                  "height":5,
                  "length":5
               },
               "weight":5
            }
         ],
         "isSpirit":false,
         "isBeerOrWine":false,
         "isFragile":false,
         "hasRefrigeratedItems":false,
         "hasPerishableItems":false,
         "notifications":{
            "url":"",
            "email":[

            ],
            "sms":[

            ]
         },
         "timeZone":"America/Los_Angeles",
         "pickUpContact":{
            "name":"Arshaad Mirza",
            "phone":"971-175-4446"
         },
         "pickUpAddress":{
            "street":"4100 Midway St",
            "street2":"",
            "secondary":"",
            "city":"Carrollton",
            "state":"TX",
            "zipcode":"75024"
         },
         "pickUpTime":1500655071332,
         "pickUpTimeByZone":"July 21st 2017, 9:37:51 am"
      },
      "orderId":"596e82d73743a00001c257cb",
      "fullresponse":[{...}]
   },
   {
      "_id":"59722a611f0b250001a03e2f",
      "provider":"FedEx",
      "serviceType":"PR",
      "estimatedPickupTime":1500660420000,
      "estimatedPickupTimeByZone":"July 21st 2017, 11:07:00 am",
      "estimatedDeliveryTime":1500662220000,
      "estimatedDeliveryTimeByZone":"July 21st 2017, 11:37:00 am",
      "expires":null,
      "currency":"cents",
      "amount":1623,
      "chargeDetails":[
         {
            "currency":"cents",
            "name":"Base Rate",
            "amount":1600
         },
         {
            "currency":"cents",
            "name":"Base Rate Discount (25%)",
            "amount":-400
         },
         {
            "currency":"cents",
            "name":"DIRECT SIGNATURE REQUIRED",
            "amount":375
         },
         {
            "currency":"cents",
            "name":"Fuel Surcharge",
            "amount":48
         }
      ],
      "tenantId":"D-mart",
      "active":true,
      "RequestBody":{
         "userEmail":"dmart@gmail.com",
         "storeExternalId":"Headspace",
         "orderExternalId":"4444",
         "department":"Alcohol",
         "orderValue":100,
         "userPickupTime":null,
         "dropOffTime":null,
         "deliveryContact":{
            "name":"Manil Uppal",
            "phone":"919-949-2639"
         },
         "deliveryAddress":{
            "street":"2801 Middle Gate Ln",
            "street2":"",
            "secondary":"",
            "city":"Plano",
            "state":"TX",
            "zipcode":"75093",
            "apartment":"no"
         },
         "packages":[
            {
               "name":"small",
               "size":{
                  "width":5,
                  "height":5,
                  "length":5
               },
               "weight":5
            }
         ],
         "isSpirit":false,
         "isBeerOrWine":false,
         "isFragile":false,
         "hasRefrigeratedItems":false,
         "hasPerishableItems":false,
         "notifications":{
            "url":"",
            "email":[

            ],
            "sms":[

            ]
         },
         "timeZone":"America/Los_Angeles",
         "pickUpContact":{
            "name":"Arshaad Mirza",
            "phone":"971-175-4446"
         },
         "pickUpAddress":{
            "street":"4100 Midway St",
            "street2":"",
            "secondary":"",
            "city":"Carrollton",
            "state":"TX",
            "zipcode":"75024"
         },
         "pickUpTime":1500655071332,
         "pickUpTimeByZone":"July 21st 2017, 9:37:51 am"
      },
      "orderId":"596e82d73743a00001c257cb",
      "fullresponse":[{...}]
   }
]
 
 
 ```
 
  <h3>HTTP Request</h3>
 
 `POST http://api.gateway.com/api/v1/order/estimates`
 
  <h3> POST Parameters </h3>
 
 Property | Type | Required | Description
 -------- | ---- | -------- | -----------
 store | Store | true | Store
 orderExternalId | string | false | Any Id that the corporate system wants to assign to this request.
 department | string | false | Department 
 orderValue | decimal | false | Value of the order, though this field is optional but depending upon the DSP mapped to the request a validation failure may occur
 userPickupTime | string | false | ISO 8601 standard e.g. 2014-01-29T04:30:00Z
 dropOffTime | string | false | ISO 8601 standard e.g. 2014-01-29T04:30:00Z
 deliveryContact | [Customer Info](#customer-info) | true | Customer information to obtain an estimate.
 deliveryAddress | Location | true | Address to deliver the package to.
 packages | [Dimension[ ]](#dimension) | true | Array of Dimension of each package.
 isSpirit | bool | true | Contains Spirits
 isBeerOrWine | bool | false | Contains beer or wine
 isFragile | bool | false | Is Fragile.
 hasRefrigeratedItems | bool | false | Has refrigerated items
 hasPerishableItems | bool | false | Has perishable items
 notifications | Array of Notification | true | Status Update Notification,
 userEmail | string | true | User email

# Order Resource

## Create Order

> Sample Request

```json
{
  "_id": "596e82d73743a00001c257cb",
  "userEmail": "dmart@gmail.com",
  "storeExternalId": "Headspace",
  "orderExternalId": "4444",
  "department": "Alcohol",
  "orderValue": 100,
  "userPickupTime": null,
  "dropOffTime": null,
  "deliveryContact": {
    "name": "Manil Uppal",
    "phone": "919-949-2639"
  },
  "deliveryAddress": {
    "street": "2801 Middle Gate Ln",
    "street2": "",
    "secondary": "",
    "city": "Plano",
    "state": "TX",
    "zipcode": "75093",
    "apartment": "no"
  },
  "packages": [
    "small"
  ],
  "isSpirit": false,
  "isBeerOrWine": false,
  "isFragile": false,
  "hasRefrigeratedItems": false,
  "hasPerishableItems": false,
  "notifications": {
    "url": "",
    "email": [],
    "sms": []
  }
}
```

> Sample Response

```json
{
    "provider": "FedEx",
    "trackingNumber": "220088590637",
    "status": "RECEIVED_BY_LMA",
    "estimatedPickupTime": 1500659160000,
    "estimatedDeliveryTime": 1500685200000,
    "estimatedPickupTimeByZone": "July 21st 2017, 10:46:00 am",
    "estimatedDeliveryTimeByZone": "July 21st 2017, 6:00:00 pm",
    "currency": "cents",
    "amount": 450,
    "courier": null,
    "labels": [
        {
            "trackingNumber": "220088590637",
            "url": "https://staging.fedexsameday.com/fdx_getlabel.aspx?id=5272931037882052911527989344",
            "code": "FXF2200885906372200885906370721173",
            "pdf": "..."
        }
    ],
    "orderId": "596e82d73743a00001c257cb"
}
```

<h3>HTTP Request</h3>
`POST http://api.gateway.com/api/v1/order/placeorder`
### Post Parameters

Property | Type | Required | Description
 -------- | ---- | -------- | -----------
 store | Store | true | Store
 order_external_id | string | false | Any Id that the corporate system wants to assign to this request.
 department | string | false | Department 
 order_value | decimal | false | Value of the order, though this field is optional but depending upon the DSP mapped to the request a validation failure may occur
 pickup_time | string | false | ISO 8601 standard e.g. 2014-01-29T04:30:00Z
 dropoff_time | string | false | ISO 8601 standard e.g. 2014-01-29T04:30:00Z
 delivery_contact | [Customer Info](#customer-info) | true | Customer information to obtain an estimate.
 delivery_address | [Location](#location) | true | Address to deliver the package to.
 packages | [Dimension[ ]](#dimension) | true | Array of Dimension of each package.
 has_spirits | bool | true | Contains Spirits
 has_beer_or_wine | bool | false | Contains beer or wine
 is_fragile | bool | false | Is Fragile.
 has_refrigerated_items | bool | false | Has refrigerated items
 has_perishable_items | bool | false | Has perishable items
 notification | Array of [Notification](#notification)|false| email/sms/status update notification
 custom_fields | CustomFields[] | false | optional custom fields;

## Create Order From Estimate

> Sample Response

```json
{
   "provider":"FedEx",
   "trackingNumber":"220088590578",
   "status":"RECEIVED_BY_LMA",
   "estimatedPickupTime":1500663420000,
   "estimatedDeliveryTime":1500674400000,
   "estimatedPickupTimeByZone":"July 21st 2017, 11:57:00 am",
   "estimatedDeliveryTimeByZone":"July 21st 2017, 3:00:00 pm",
   "currency":"cents",
   "amount":2322,
   "courier":null,
   "labels":[
      {
         "code": "FXF220088590578220088590578072117",
         "pdf": "...",
         "trackingNumber":"220088590578",
         "url":"https://staging.fedexsameday.com/fdx_getlabel.aspx?id=7540231473342011054524273139",
         "code":"FXF2200885905782200885905780721175"
      }
   ],
   "orderId":"596360614cfa472eedcce8fe"
}
```

<h3>HTTP Request</h3>
`POST http://api.gateway.com/api/v1/order/createorderfromestimate/<estimateId>`

### URL Parameters

Property | Type | Required | Description
-------- | ---- | -------- | -----------
estimateId | string | true | ID of an Estimate


## Get Order

### HTTP Request

> Sample Response

```json
{
    "_id": "596360614cfa472eedcce8fe",
    "userEmail": "dmart@gmail.com",
    "storeExternalId": "LASH at Lamar",
    "orderExternalId": "",
    "department": "Apparel",
    "orderValue": 24,
    "userPickupTime": null,
    "dropOffTime": null,
    "deliveryContact": {
        "name": "Sourabh",
        "phone": "565-665-5555"
    },
    "deliveryAddress": {
        "street": "690 5th St CA",
        "street2": "",
        "secondary": "",
        "city": "San Francisco",
        "state": "CA",
        "zipcode": "75070",
        "apartment": "yes",
        "apartmentNumber": "4223"
    },
    "packages": [
        {
            "name": "medium",
            "size": {
                "width": 10,
                "height": 10,
                "length": 10
            },
            "weight": 10
        }
    ],
    "isSpirit": false,
    "isBeerOrWine": false,
    "isFragile": true,
    "hasRefrigeratedItems": false,
    "hasPerishableItems": true,
    "notifications": {
        "url": "",
        "email": [],
        "sms": []
    },
    "timeZone": "America/Los_Angeles",
    "pickUpContact": {
        "name": "Robart",
        "phone": "811-897-7756"
    },
    "pickUpAddress": {
        "street": "2363 Van Ness Ave CA",
        "street2": "",
        "secondary": "",
        "city": "San Francisco",
        "state": "CA",
        "zipcode": "75024"
    },
    "pickUpTime": 1500656270288,
    "pickUpTimeByZone": "July 21st 2017, 9:57:50 am",
    "requestReceiveTime": 1500655370290,
    "requestReceiveTimeByZone": "July 21st 2017, 9:42:50 am",
    "tenantId": "D-mart",
    "active": true,
    "status": "RECEIVED_BY_LMA",
    "providerResponse": {
        "data": {
            "provider": "FedEx",
            "trackingNumber": "220088590578",
            "status": null,
            "estimatedPickupTime": 1500663420000,
            "estimatedDeliveryTime": 1500674400000,
            "estimatedPickupTimeByZone": "July 21st 2017, 11:57:00 am",
            "estimatedDeliveryTimeByZone": "July 21st 2017, 3:00:00 pm",
            "currency": "cents",
            "amount": 2322,
            "courier": null,
            "labels": [
                {
                    "trackingNumber": "220088590578",
                    "url": "https://staging.fedexsameday.com/fdx_getlabel.aspx?id=7540231473342011054524273139",
                    "code": "FXF2200885905782200885905780721175",
                    "pdf": "...",
                    "qrCodeImage": "..."
                }
            ]
        },
        "fullResponse": {
            "trackingNumber": "220088590578",
            "shipmentCreateDate": 1500613200000,
            "labels": [
                {
                    "trackingNumber": "220088590578",
                    "refId": null,
                    "url": "https://staging.fedexsameday.com/fdx_getlabel.aspx?id=7540231473342011054524273139",
                    "code": "FXF2200885905782200885905780721175",
                    "sortId": "A4",
                    "pdfData": "..."
                }
            ],
            "service": {
                "serviceType": "EC",
                "signatureService": "DSR",
                "specialServices": null,
                "restrictions": null
            },
            "pricingZone": "0C",
            "chargeAmount": {
                "currencyCode": "USD",
                "amount": 23.22
            },
            "chargeDetails": [
                {
                    "name": "BR - Base Rate",
                    "currencyAmount": {
                        "currencyCode": "USD",
                        "amount": 18
                    }
                },
                {
                    "name": "DSR - DIRECT SIGNATURE REQUIRED",
                    "currencyAmount": {
                        "currencyCode": "USD",
                        "amount": 4.5
                    }
                },
                {
                    "name": "FUE - Fuel Surcharge",
                    "currencyAmount": {
                        "currencyCode": "USD",
                        "amount": 0.72
                    }
                }
            ],
            "totalWeight": {
                "units": "LB",
                "value": 10
            },
            "totalPackageCount": 1,
            "packages": [
                {
                    "trackingNumber": "220088590578",
                    "refId": null,
                    "items": null,
                    "weight": {
                        "units": "LB",
                        "value": 10
                    },
                    "dimensions": {
                        "length": 10,
                        "width": 10,
                        "height": 10,
                        "units": "IN"
                    }
                }
            ],
            "estPickupTime": 1500663420000,
            "estDeliveryTime": 1500674400000,
            "externalReferences": null,
            "accessCode": null,
            "labelURL": null
        }
    },
    "estimatedId": "59722f0e7ea0420001ddad7b"
}
```
`GET http://api.gateway.com/api/v1/order/getById/<orderId>`

### URL Parameters

Parameter | Description
--------- | -----------
orderId | Order id


## Get Order Status

> Response

```json
[
    {
        "_id": "596360734cfa472eedcce903",
        "orderId": "596360614cfa472eedcce8fe",
        "tenantId": "D-mart",
        "orderStatus": [
            {
                "status": "REQUEST_RECEIVED",
                "updatedAt": "July 10th 2017, 6:09:39 am"
            },
            {
                "status": "ESTIMATES_RECEIVED",
                "updatedAt": "July 10th 2017, 6:09:40 am"
            },
            {
                "status": "RECEIVED_BY_LMA",
                "updatedAt": "July 21st 2017, 11:43:11 am"
            }
        ]
    }
]
```


### HTTP Request

`PUT http://api.gateway.com/api/v1/order/getOrderStatus/<orderId>`

### URL Parameters

Parameter | Description
--------- | -----------
orderId | Order id



## Cancel Order

> Response [406]

```json
{
    "name": "FedEx",
    "message": "{\"Message\":\"FEDEX_CANCEL_NOT_SUPPORTED\",\"Orderid\":\"596360614cfa472eedcce8fe\"}"
}
```

> Response [200]

```json
```

### HTTP Request

`DELETE http://api.gateway.com/api/v1/order/<orderId>`

### URL Parameters

Parameter | Description
--------- | -----------
orderId | Order id


# Alcohol Compliance

## Get Alcohol Compliance

> Sample Request

```json
{
  "delivery_from": {
    "address_1" : "123 Main St.",
    "address_2" : "",
    "city" : "Plano",
    "state" : "tx",
    "zip" : "75024"
  },
  "delivery_to": {
      "address_1" : "555 Macarthur Avenue.",
      "address_2" : "",
      "city" : "Richardson",
      "state": "tx",
      "zip" : "75045"
    }
}
```

> Sample Response [200]

```json
{
    "compliance": {
        "alcohol": "Beer/Wine",
        "zoning": {
            "result": true
        }
    }
}
```

> Sample Response

```json
{
    "compliance": {
        "alcohol": "Information unavailable",
        "zoning": {
            "result": false,
            "errors": [
                {
                    "type": "CROSS_STATE_RULE_FAILURE",
                    "description": "same state delivery rule violated."
                },
                {
                    "type": "CROSS_COUNTY_RULE_FAILURE",
                    "description": "same county delivery rule violated."
                }
            ]
        }
    }
}
```

### HTTP Request

`POST http://api.gateway.com/api/v1/getAlcoholCompliance`

### POST Parameters

Parameter |  Type | Required
--------- | ----------- | ---------
delivery_from | Location | true
delivery_to | Location | true

## List of Compliances

### HTTP Request
`GET http://api.gateway.com/api/v1/compliance?page={:page}&state={:state}`

> Response

```json
{
    "page": 1,
    "pages": 2100,
    "perPage": 20,
    "itemsCount": 41986,
    "items": [
        {
            "id": 1,
            "state": "AK",
            "city": "Akutan",
            "metro_area": "N/A",
            "county": "Aleutians East Borough",
            "county_id": 68,
            "county_status": null,
            "city_status": null,
            "other": null,
            "complexities": null
        },
        {
            "id": 2,
            "state": "AK",
            "city": "Cold Bay",
            "metro_area": "N/A",
            "county": "Aleutians East Borough",
            "county_id": 68,
            "county_status": null,
            "city_status": null,
            "other": null,
            "complexities": null
        }
    ]
}
```


# Webhooks / SMS / Email

> Sample Webhook Response

```json
{
 "event" : "order_placed",
 "event_time" : "2014-01-29T04:30:00Z",
 "order" : {
    "order_id": "592b6f7b34df3a5ed908bccf",
    "store": {
      "alias": "LASH at Lamar"
    },
    "order_external_id": "XAPTM-ADC001",
    "department": "Jewellery",
    "order_value": 323.22,
    "pickup_time": "2014-01-29T04:30:00Z",
    "drop_off_time": null,
    "delivery_contact": {
      "name": "John Doe",
      "phone": "233-232-3232"
    },
    "delivery_address": {
      "address_1": "123 London Dr",
      "address_2": "",
      "city": "Arlington",
      "state": "TX",
      "zip": "75060"
    },
    "packages": [
      {
        "size": {
          "length": 12,
          "width": 12,
          "height": 6
        },
        "weight": 15
      }
    ],
    "has_spirits": true,
    "has_beer_or_wine": true,
    "is_fragile": true,
    "has_refrigerated_items": true,
    "has_perishable_items": true,
    "provider": "fedex",
    "tracking_number": "220088057510",
    "status": "RECEIVED_BY_LMA",
    "estimated_pickup_time": "2014-01-29T04:30:00Z",
    "estimated_delivery_time": "2014-01-29T04:30:00Z",
    "currency": "cents",
    "amount": 4115,
    "labels": [
      {
        "tracking_number": "220088057510",
        "url": "https://staging.fedexsameday.com/fdx_getlabel.aspx?id=5181131558901765435944766360",
        "code": "FXF2200880575102200880575100528172",
        "pdf": "<base_64_encoded_image>",
        "qr_code_image": "<base_64_encoded_image>"
      }
    ]
  }
}
```

If you provided a notification item, when the order was created our platform can automatically POST to that URL, send an email, send a sms message with events that happen in the lifetime of the order.

Event | Description
--------- | -----------
order_placed | Order has been placed with the DSP.
order_picked | Package has been picked up by the DSP and is in enroute.
order_delivered | Package has been delivered.
driver_arrived | When the driver has arrived to pickup the delivery
order_canceled | When the order has been canceled.
order_exception | When an out of ordinary event happens in the process.

<aside class="notice">
The data included with every event type will differ based on the context. The exact structure of these responses will get established soon.
</aside>

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />































