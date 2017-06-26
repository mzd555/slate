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

`POST http://api.gateway.com/stores`

> Request

```json

 {
   "name": "HighlandPark-53",
   "description": "General Store in Highland Park",
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
  "_id": "5948c0a31da414722237c1f4",
  "tenantId": "D-mart",
  "active": true,
   "name": "HighlandPark-53",
   "description": "General Store in Highland Park",
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

`GET http://api.gateway.com/stores`

Get all the configured stores in the system.

> Response

```json
[
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
  },
  {
    "_id": "590905dc55776b47decb4870",
    "name": "Uptown-Store77",
    "description": "Uptown Store 77",
    "contact": {
      "name": "Michael Stevenson",
      "phone": "971-175-4446"
    },
    "deliveryInstructions": "Ensure package is not damaged before handing it over.",
    "address": {
      "street": "4100 Midway St",
      "street2": "",
      "secondary": "2120",
      "city": "Carrollton",
      "state": "TX",
      "zipcode": "75007"
    },
    "departments": [
      {
        "name": "General",
        "description": "",
        "deliveryInstructions": ""
      },
      {
        "name": "Alcohol",
        "description": "",
        "deliveryInstructions": ""
      }
    ],
    "DSPs": [
      {
        "name": "postmate"
      },
      {
        "name": "fedex"
      }
    ],
    "active": true
  }
]


```

## Get Store by ID

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

## Get Store by Alias

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
   "store": {
     "name": "HighlandPark #53"
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
   "has_perishable_items": true
 }
 ```
 
 > Sample Response
 
 ```json
 {
   "estimates": [
     {
       "provider": "fedex",
       "service_type": "PR",
       "estimated_pickup_time": "2017-05-28T08:46:00.000Z",
       "estimated_delivery_time": "2017-05-28T09:30:00.000Z",
       "expires": null,
       "currency": "cents",
       "amount": 5273
     },
     {
       "provider": "postmates",
       "estimated_pickup_time": "2017-05-28T08:46:00.000Z",
       "estimated_delivery_time": "2017-05-28T09:46:00.000Z",
       "expires": null,
       "currency": "cents",
       "amount": 6354
     }
   ],
   "estimate_id": "592a60ac34df3a5ed908bccd"
 }
 
 
 ```
 
  <h3>HTTP Request</h3>
 
 `POST http://api.gateway.com/estimate`
 
  <h3> POST Parameters </h3>
 
 Property | Type | Required | Description
 -------- | ---- | -------- | -----------
 store | Store | true | Store
 order_external_id | string | false | Any Id that the corporate system wants to assign to this request.
 department | string | false | Department 
 order_value | decimal | false | Value of the order, though this field is optional but depending upon the DSP mapped to the request a validation failure may occur
 pickup_time | string | false | ISO 8601 standard e.g. 2014-01-29T04:30:00Z
 dropoff_time | string | false | ISO 8601 standard e.g. 2014-01-29T04:30:00Z
 delivery_contact | [Customer Info](#customer-info) | true | Customer information to obtain an estimate.
 delivery_address | Location | true | Address to deliver the package to.
 packages | [Dimension[ ]](#dimension) | true | Array of Dimension of each package.
 has_spirits | bool | true | Contains Spirits
 has_beer_or_wine | bool | false | Contains beer or wine
 is_fragile | bool | false | Is Fragile.
 has_refrigerated_items | bool | false | Has refrigerated items
 has_perishable_items | bool | false | Has perishable items
 status_update_notification | Array of Notification | true | Status Update Notification
 exception_notification | string | true | Exception Notification : List<Notification>
 custom_fields | CustomFields[] | false | optional custom fields;

# Order Resource

## Create Order

> Sample Request

```json
{
  "store": {
    "name": "HighlandPark #53"
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
  "notification": [
      {
        "email": "jane.doe@gmail.com",
        "sms": "232-323-2323"
      },
      {
        "url" :"listener.foobar.com?order_id=XPMT-AXDC",
        "email" : "support@foobar.com"
      }
    ]
}
```

> Sample Response

```json
{
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
   ],
   "order_id": "592b6f7b34df3a5ed908bccf"
 }
```
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


## Get Order

### HTTP Request

> Sample Response

```json
 {
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
```
`GET http://api.gateway.com/order/<id>`

### URL Parameters

Parameter | Description
--------- | -----------
id | Order id


## Get Order Status

> Response

```json
  {
    "status": "ORDER_PLACED",
    "status_description" : "DSP has accepted the order",
    "updated_at": "2014-01-29T04:30:00Z"
  }
```


### HTTP Request

`PUT http://api.gateway.com/order/<id>`

### URL Parameters

Parameter | Description
--------- | -----------
id | Order id

## Cancel Order


> Request body

```json
{
  "status": "CANCELED",
  "comment" : "client changed their mind."
}
```

> Response

```json
{
  "status": "CANCELED"
}
```
### HTTP Request

`PUT http://api.gateway.com/order/<id>`

### URL Parameters

Parameter | Description
--------- | -----------
id | Order id


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

> Sample Response

```json
{
  "compliance": {
    "result" : "COMPLIANT",
    "status" : "wet"
  }
}
```

> Sample Response

```json
{
  "compliance": {
    "result" : "NONCOMPLIANT",
    "status" : null
  }
}
```

### HTTP Request

`POST http://api.gateway.com/getalcoholcompliance`

### POST Parameters

Parameter |  Type | Required
--------- | ----------- | ---------
delivery_from | Location | true
delivery_to | Location | true

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































