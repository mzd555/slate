---
title: API Reference

language_tabs:
  - shell

toc_footers:

includes:

search: true
---

# Models

## Retailer Store
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | integer | true | Store ID's
retailer_id | integer | true | Retailer ID
alias | string | true | Store ID alias
phone | Phone | true | Phone Number : Phone
address | Address | true | Store Address : Address

## Delivery Customer Location
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
address_1 | string | true | Address Line 1
address_2 | string | true | Address Line 2
city | string | true | City
state | string | true | State
zip | string | true | Zip

## Delivery Customer Info
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
height | decimal | true | Height
width | decimal | true | Width
depth | decimal | true | Depth
weight | decimal | true | Weight
has_beer_or_wine | string | true | Has Beer/Wine(Y/N)
has_spirits | bool | true | Has Spirits(Y/N)
has_refrigerated_items | string | true | Has Refrigerated items(Y/N)
has_perishable_items | string | true | Has Perishable Items(Y/N)
list_of_products | string | true | Items : list of Product
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

## Delivery Estimate
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
delivery_customer_info | string | true | Delivery Customer Info
store_id | int | true | StoreId
order_details | string | true | Order Details
customer_zip | string | true | Customer ZipCode
delivery_customer_location | string | true | Delivery Customer Location
custom_fields | List<CustomFields> | true | CustomFields : List<CustomFields>

## Order
Property | Type | Required | Description
-------- | ---- | -------- | -----------
id | int | true | ID
delivery_customer_info | string | true | Delivery Customer Info
store_id | int | true | StoreId
order_details | string | true | Order Details
status_update_notification | List<Notification> | true | Status Update Notification : List<Notification>
exception_notification | string | true | Exception Notification : List<Notification>
delivery_time | timestamp | true | Delivery Time : Time
custom_fields | List<CustomFields> | true | CustomFields : List<CustomFields>

# Store Resource

## List Stores
### HTTP Request

`GET http://api.gateway.com/stores`

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```


> The above command returns JSON structured like this:

```json
[
  {
    "kind": "delivery",
    "id": "del_3vDjjkd21b",
    "created": "2014-08-26T10:04:03Z",
    "updated": "2014-08-26T11:21:16Z",
    "status": "pickup",
    "complete": false,
    "pickup_eta": "2014-08-26T10:16:00Z",
    "dropoff_eta": "2014-08-26T10:29:00Z",
    "dropoff_deadline": "2014-08-26T10:45:00Z",
    "quote_id": "dqt_qUdje83jhdk",
    "fee": 799,
    "currency": "usd",
    "manifest": {
      "reference": "SP 937-215"
      "description": "10kg cardboard box",
    },
    "dropoff_identifier": "Picard",
    "pickup": {
      "name": "The Warehouse",
      "phone_number": "5558675309",
      "address": "20 McAllister St, San Francisco, CA 94102",
      "detailed_address": {
        "street_address_1": "20 McAllister St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94102",
        "country": "US",
      },
      "notes": "Invoice #123",
      "location" : {
          "lat" : 37.781116,
          "lng" : -122.412339
      },
    },
    "dropoff": {
      "name": "Alice Customer"
      "phone_number": "4155555555",
      "address": "101 Market St, San Francisco, CA 94105",
      "detailed_address": {
        "street_address_1": "101 Market St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94105",
        "country": "US",
      },
      "notes": "Ring the bell, meow loudly.",
      "location" : {
          "lat" : 37.793274,
          "lng" : -122.395934
      },
    },
    "courier": {
      "name": "Robo Courier",
      "rating": "5.0",
      "vehicle_type": "bicycle",
      "phone_number": "+14151234567"
      "location" : {
          "lat" : 37.42291810,
          "lng" : -122.08542120
      },
      "img_href": "https://images.postmates.com/06c9a53c-f89f-4eac-8861-60e34039d9ea/121.jpg"
    },
    "related_deliveries": [{
      "id": "del_9A3jsld89s",
      "relationship": "original"
    }]
  }
]
```

## Get Store by ID

### HTTP Request

`GET http://api.gateway.com/stores/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | Store ID


```json
  {
    "kind": "delivery",
    "id": "del_3vDjjkd21b",
    "created": "2014-08-26T10:04:03Z",
    "updated": "2014-08-26T11:21:16Z",
    "status": "pickup",
    "complete": false,
    "pickup_eta": "2014-08-26T10:16:00Z",
    "dropoff_eta": "2014-08-26T10:29:00Z",
    "dropoff_deadline": "2014-08-26T10:45:00Z",
    "quote_id": "dqt_qUdje83jhdk",
    "fee": 799,
    "currency": "usd",
    "manifest": {
      "reference": "SP 937-215"
      "description": "10kg cardboard box",
    },
    "dropoff_identifier": "Picard",
    "pickup": {
      "name": "The Warehouse",
      "phone_number": "5558675309",
      "address": "20 McAllister St, San Francisco, CA 94102",
      "detailed_address": {
        "street_address_1": "20 McAllister St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94102",
        "country": "US",
      },
      "notes": "Invoice #123",
      "location" : {
          "lat" : 37.781116,
          "lng" : -122.412339
      },
    },
    "dropoff": {
      "name": "Alice Customer"
      "phone_number": "4155555555",
      "address": "101 Market St, San Francisco, CA 94105",
      "detailed_address": {
        "street_address_1": "101 Market St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94105",
        "country": "US",
      },
      "notes": "Ring the bell, meow loudly.",
      "location" : {
          "lat" : 37.793274,
          "lng" : -122.395934
      },
    },
    "courier": {
      "name": "Robo Courier",
      "rating": "5.0",
      "vehicle_type": "bicycle",
      "phone_number": "+14151234567"
      "location" : {
          "lat" : 37.42291810,
          "lng" : -122.08542120
      },
      "img_href": "https://images.postmates.com/06c9a53c-f89f-4eac-8861-60e34039d9ea/121.jpg"
    },
    "related_deliveries": [{
      "id": "del_9A3jsld89s",
      "relationship": "original"
    }]
  }
```

## Get Store by Alias

### HTTP Request

`GET http://api.gateway.com/stores/<alias>`

### URL Parameters

Parameter | Description
--------- | -----------
alias | Store's alias


```json
  {
    "kind": "delivery",
    "id": "del_3vDjjkd21b",
    "created": "2014-08-26T10:04:03Z",
    "updated": "2014-08-26T11:21:16Z",
    "status": "pickup",
    "complete": false,
    "pickup_eta": "2014-08-26T10:16:00Z",
    "dropoff_eta": "2014-08-26T10:29:00Z",
    "dropoff_deadline": "2014-08-26T10:45:00Z",
    "quote_id": "dqt_qUdje83jhdk",
    "fee": 799,
    "currency": "usd",
    "manifest": {
      "reference": "SP 937-215"
      "description": "10kg cardboard box",
    },
    "dropoff_identifier": "Picard",
    "pickup": {
      "name": "The Warehouse",
      "phone_number": "5558675309",
      "address": "20 McAllister St, San Francisco, CA 94102",
      "detailed_address": {
        "street_address_1": "20 McAllister St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94102",
        "country": "US",
      },
      "notes": "Invoice #123",
      "location" : {
          "lat" : 37.781116,
          "lng" : -122.412339
      },
    },
    "dropoff": {
      "name": "Alice Customer"
      "phone_number": "4155555555",
      "address": "101 Market St, San Francisco, CA 94105",
      "detailed_address": {
        "street_address_1": "101 Market St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94105",
        "country": "US",
      },
      "notes": "Ring the bell, meow loudly.",
      "location" : {
          "lat" : 37.793274,
          "lng" : -122.395934
      },
    },
    "courier": {
      "name": "Robo Courier",
      "rating": "5.0",
      "vehicle_type": "bicycle",
      "phone_number": "+14151234567"
      "location" : {
          "lat" : 37.42291810,
          "lng" : -122.08542120
      },
      "img_href": "https://images.postmates.com/06c9a53c-f89f-4eac-8861-60e34039d9ea/121.jpg"
    },
    "related_deliveries": [{
      "id": "del_9A3jsld89s",
      "relationship": "original"
    }]
  }
```

# Estimate Resource

## Get Estimate
### HTTP Request

`GET http://api.gateway.com/estimate/<id>`

### URL Parameters

Parameter | Description
--------- | -----------
id | estimate id

```json
  {
    "kind": "delivery",
    "id": "del_3vDjjkd21b",
    "created": "2014-08-26T10:04:03Z",
    "updated": "2014-08-26T11:21:16Z",
    "status": "pickup",
    "complete": false,
    "pickup_eta": "2014-08-26T10:16:00Z",
    "dropoff_eta": "2014-08-26T10:29:00Z",
    "dropoff_deadline": "2014-08-26T10:45:00Z",
    "quote_id": "dqt_qUdje83jhdk",
    "fee": 799,
    "currency": "usd",
    "manifest": {
      "reference": "SP 937-215"
      "description": "10kg cardboard box",
    },
    "dropoff_identifier": "Picard",
    "pickup": {
      "name": "The Warehouse",
      "phone_number": "5558675309",
      "address": "20 McAllister St, San Francisco, CA 94102",
      "detailed_address": {
        "street_address_1": "20 McAllister St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94102",
        "country": "US",
      },
      "notes": "Invoice #123",
      "location" : {
          "lat" : 37.781116,
          "lng" : -122.412339
      },
    },
    "dropoff": {
      "name": "Alice Customer"
      "phone_number": "4155555555",
      "address": "101 Market St, San Francisco, CA 94105",
      "detailed_address": {
        "street_address_1": "101 Market St",
        "street_address_2": "",
        "city": "San Francisco",
        "state": "CA",
        "zip_code": "94105",
        "country": "US",
      },
      "notes": "Ring the bell, meow loudly.",
      "location" : {
          "lat" : 37.793274,
          "lng" : -122.395934
      },
    },
    "courier": {
      "name": "Robo Courier",
      "rating": "5.0",
      "vehicle_type": "bicycle",
      "phone_number": "+14151234567"
      "location" : {
          "lat" : 37.42291810,
          "lng" : -122.08542120
      },
      "img_href": "https://images.postmates.com/06c9a53c-f89f-4eac-8861-60e34039d9ea/121.jpg"
    },
    "related_deliveries": [{
      "id": "del_9A3jsld89s",
      "relationship": "original"
    }]
  }
```

# Order Resource

## Get Order

### HTTP Request

`POST http://api.gateway.com/order/<id>`

### URL Parameters

Parameter | Description
--------- | -----------
id | Order id

```json
  {
    "id": 123,
    "price": 123
  }
```

## Get Order Status

### HTTP Request

`PUT http://api.gateway.com/order/<id>/status`

### URL Parameters

Parameter | Description
--------- | -----------
id | Order id

> Response

```json
  {
    "status": "CANCELED",
    "updated_at": 123123123
  }
```

## Create Order

### HTTP Request

`POST http://api.gateway.com/order`

> Request body

```json
{
  "price": 123
}
```

> Response

```json
{"test":"test"}
```

## Update Order

### HTTP Request

`PUT http://api.gateway.com/order/<id>`

> Request body

```json
{
  "price": 123
}
```

> Response

```json
{
  "id": 123,
  "price": 123
}
```

## Cancel Order

### HTTP Request

`PUT http://api.gateway.com/order/<id>`

### URL Parameters

Parameter | Description
--------- | -----------
id | Order id

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
