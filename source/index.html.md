---
title: API Reference

language_tabs:
  - shell

toc_footers:

includes:

search: true
---

# Models

## Store
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | integer | true | Store ID's
retailer_id | integer | true | Retailer ID
alias | string | true | Store ID alias
*phone | Phone | true | Phone Number : Phone
*address | Address | true | Store Address : Address

*required only if the store does not exist in the system.

## Location
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
address_1 | string | true | Address Line 1
address_2 | string | true | Address Line 2
city | string | true | City
state | string | true | State
zip | string | true | Zip

## Customer Info
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
first_name | string | true | First Name
last_name | string | true | Last Name
middle_name | string | true | Middle Name
phone | string | true | Phone
email | string | false | Email
business_name | string | false | Business Name
should_email | bool | false | Should Email
should_sms | bool | false | Should SMS
custom_fields | List<CustomFields> | false | CustomFields : List<CustomFields>

## Order Details
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
retailer_order_id | int | true | Retailer Order ID
order_total | decimal | true | Order Total
packages_count | int | true | No. of Packages
size | Size| true | Size of the package
has_beer_or_wine | bool | true | Has Beer/Wine(Y/N)
has_spirits | bool | true | Has Spirits(Y/N)
has_refrigerated_items | string | true | Has Refrigerated items(Y/N)
has_perishable_items | string | true | Has Perishable Items(Y/N)
list_of_products | string | false | Items : list of Product
custom_fields | string | true | CustomFields : List<CustomFields>

## Time
Property | Type | Required | Description
-------- | ---- | -------- | -----------
ready_for_pick_up | string | true | Ready for Pick up
deliver_by | string | true | Deliver by

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

## Order Status
Property | Type | Required | Description
-------- | ---- | -------- | -----------
code | string | true | code(see global Order Status)
description | string | true | description

## Product
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
name | string | true | Name
price | decimal | true | Price
sku | string | true | Sku
height | decimal | true | Height
width | decimal | true | Width
depth | decimal | true | Depth
weight | decimal | true | Weight
is_fragile | bool | true | IsFragile
custom_fields | List<CustomFields> | true | CustomFields : List<CustomFields>

## Phone
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
number | string | true | Number
extension | string | true | Extension
department | string | true | Department

## Notification
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
email | string | true | Email
sms | string | true | SMS
url | string | true | Url (might not need it at all)

## CustomFields
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | string | true | Name
name | string | true | Name
value | string | true | Value
type | string | true | CustomFieldValueType : Default(string)

## CustomFieldValueType
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | string | true | string
type | string | true | (json, string, csv)

## Order
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
delivery_customer_info | string | true | Customer Info
store_id | int | true | StoreId
order_details | string | true | Order Details
status_update_notification | List<Notification> | true | Status Update Notification : List<Notification>
exception_notification | string | true | Exception Notification : List<Notification>
delivery_time | timestamp | true | Delivery Time : Time
custom_fields | List<CustomFields> | true | CustomFields : List<CustomFields>


## Size
Property | Type | Required | Description
-------- | ---- | -------- | -----------
height | decimal | false | Height
width | decimal | false | Width
depth | decimal | false | Depth

## Dimension
Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | false | custom measurements already defined such as 'small','medium' etc.
weight | decimal | false | Weight
size | Size | false | height, width , depth in inches.

Note: name or weight & size is required.


## Dates, Times and Timezones
All dates and times in the API are expressed in <a href='http://en.wikipedia.org/wiki/ISO_8601'> ISO 8601 </a>, with a UTC offset (denoted by the Z).


# Store Resource

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
       "amount": 5273,
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
 delivery_contact | Delivery Contact | true | Minimum customer information to obtain an estimate.
 delivery_address | Location | true | Address to deliver the package to.
 packages | [Dimension[ ]](#dimension) | true | Array of Dimension of each package.
 has_spirits | bool | true | Contains Spirits
 has_beer_or_wine | bool | false | Contains beer or wine
 is_fragile | bool | false | Is Fragile.
 has_refrigerated_items | bool | false | Has refrigerated items
 has_perishable_items | bool | false | Has perishable items
 custom_fields | CustomFields[] | false | optional custom fields;

# Order Resource

## Create Order

> Sample Request

```json
{
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
  "has_perishable_items": true
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

`PUT http://api.gateway.com/order/<id>/status`

### URL Parameters

Parameter | Description
--------- | -----------
id | Order id

## Cancel Order


> Request body

```json
{
  "status": "CANCELED"
}
```

> Response

```json
{
  "id": 123,
  "price": 123,
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
    "alcohol" : "wet",
    "zoning" : 
      { 
        "result" : true
      }
  }
}
```

> Sample Response

```json
{
  "compliance": {
    "alcohol" : "wet",
    "zoning" :
     {
      "result" : false,
      "errors":
    [ 
      { "type" : "CROSS_COUNTY_RULE_FAILURE",
        "description" : "same county delivery rule violated."
      },
      { 
        "type" : "CROSS_STATE_RULE_FAILURE",
        "description" : "same state delivery rule violated."  
       }
     ]
     }
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


