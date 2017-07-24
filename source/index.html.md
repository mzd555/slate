---
title: API Reference

language_tabs:
  - shell
  - php
 

toc_footers:
- <b><a href='https://deliverysolutions.co'>Back to Delivery Solution</a></b>
- <b><a href='https://sandbox.portal.deliverysolutions.co'>Sandbox Portal</a></b>


includes:

search: true
---

# Introduction

## API URL 

 <h3>Sandbox</b>
 <h3> API  : https://sandbox.api.deliverysolutions.co/api/v1 </h3>
 <h3> Portal : https://sandbox.portal.deliverysolutions.co </h3>
<h3>Production</h4>
<h3> API : https://production.deliverysolutions.co/api/v1 </h3>
<h3> Portal : https://production.portal.deliverysolutions.co </h3>


## Authentication

> Example call with API key passed in the request header

```shell
  curl -X GET https://<BASE_URL>/store \
    --header "Content-Type:application/json" \
    --header "x-api-key:YOUR_API_KEY"  
```

After your account has been setup, you will be provided with an API key. Please make sure to keep this key secured and never embed it in client-side code.
You must pass the <code>x-api-key</code> in the request header with the value <code>apikey</code>.

<aside class='notice'> Requests made with an invalid API key will return <code> 401 Unauthorized response</code>.
</aside>
<aside class='notice'> Requests made without an API key will return <code> 403 Forbidden</code>.
</aside>

<aside class='success'>
Please replace 'YOUR_API_KEY' with the actual key.
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
name | string | true | Middle Name
phone | string | true | Phone

## Dates, Times
All dates and times in the API are expressed Unix Time / Epoch time in milliseconds. 

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
name | string | false | either package name or 'custom'.
weight | decimal | false | Weight
size | Size | false | height, width , depth in inches.

Note: 'name' should match the packages available for your account. 

<aside class="success" >
<a href='https://sandbox.portal.deliverysolutions.co/#/corporate/packages'>View Packages</a>
</aside>

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
street | string | true | Address Line 1
street2 | string | true | Address Line 2
city | string | true | City
state | string | true | State
zipcode | string | true | Zip
apartment | string | true | yes/no
apartmentNumber |string | false | Apartment number required if <code>apartment = 'yes' </code>


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

> Request

```shell
curl -X POST \
  https://sandbox.api.deliverysolutions.co/api/v1/store \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: b02c9da2-666c-f366-4d75-41e9ac35dc68' \
  -H 'x-api-key: YOUR_API_KEY' \
  -d '{
   "name": "Mango-101",
   "storeExternalId": "Mango101",
   "description": "General Store in Highland Park 101",
   "timeZone": "America/Chicago",
   "contact": {
     "name": "Peter Brown",
     "phone": "214-234-2232"
   },
   "deliveryInstructions": "Always be smiling",
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
 }'

```

```php

<?php

$client = new http\Client;
$request = new http\Client\Request;

$body = new http\Message\Body;
$body->append('{
   "name": "Mango-101",
   "storeExternalId": "Mango101",
   "description": "General Store in Highland Park 101",
   "timeZone": "America/Chicago",
   "contact": {
     "name": "Peter Brown",
     "phone": "214-234-2232"
   },
   "deliveryInstructions": "Always be smiling",
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
 }');

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/store');
$request->setRequestMethod('POST');
$request->setBody($body);

$request->setHeaders(array(
  'postman-token' => 'fb698077-804c-5d17-605d-e447c651925b',
  'cache-control' => 'no-cache',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();

```
> Response

```json
{
    "_id": "5974ccf77b0a620001c253e9",
    "tenantId": "LASH Delivery",
    "active": true,
    "name": "Mango-101",
    "storeExternalId": "Mango101",
    "description": "General Store in Highland Park 101",
    "timeZone": "America/Chicago",
    "contact": {
        "name": "Peter Brown",
        "phone": "214-234-2232"
    },
    "deliveryInstructions": "Always be smiling",
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
            "corporateDspId": "5974ccf77b0a620001c253e7"
        },
        {
            "name": "Postmates",
            "corporateDspId": "5974ccf77b0a620001c253e8"
        }
    ]
}

```

### HTTP Request

`POST https://<API_URL>/api/v1/store`


Property | Type | Required | Description
-------- | ---- | -------- | -----------
name | string | true | Name of the store (must be unique among other stores)
storeExternalId | string | true | Unique Id of the store. 
description | string| false | Description of the store.
timeZone | [Timezone](#timezone) | true | Timezone that the store is located in.
contact | [Contact](#contact) | true | Contact information for the store.
deliveryInstructions | string | false | Delivery Instructions for the store.
address | [Location](#location) | true | Location of the store.
departments | Array of [Department](#department) | true | Departments.
DSPs | [Generic Entity](#generic-entity) | false | List of the DSPs that the store should be configured for delivery.


## List Stores
### HTTP Request

> Request

```shell

curl -X GET \
  https://sandbox.api.deliverysolutions.co/api/v1/store \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'x-api-key: YOUR_API_KEY'

```

```php
<?php

$client = new http\Client;
$request = new http\Client\Request;

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/store');
$request->setRequestMethod('GET');
$request->setHeaders(array(
  'postman-token' => '5a0f1b0c-7684-27cc-5fe4-d1785ec364b8',
  'cache-control' => 'no-cache',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();

```
> Response

```json

[
    {
        "_id": "597398c63e526c00012078f4",
        "tenantId": "LASH Delivery",
        "active": true,
        "name": "Mango-100",
        "storeExternalId": "Mango100",
        "description": "General Store in Highland Park",
        "timeZone": "America/Chicago",
        "contact": {
            "name": "Peter Brown",
            "phone": "214-234-2232"
        },
        "deliveryInstructions": "Always be smiling",
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
                "corporateDspId": "597398c63e526c00012078f2"
            },
            {
                "name": "Postmates",
                "corporateDspId": "597398c63e526c00012078f3"
            }
        ]
    }
]

```

`GET https://<BASE_URL>/store`

Get all the configured stores for your account.

# Estimate Resource

## Create an Estimate

> Request

```shell
curl -X POST \
  https://sandbox.api.deliverysolutions.co/api/v1/order/estimates \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 97d96891-ba9f-499d-bcac-ff0a51d319b0' \
  -H 'x-api-key: YOUR_API_KEY' \
  -d '{
  "userEmail": "dmart@gmail.com",
  "storeExternalId": "Mango101",
  "orderExternalId": "223",
  "department": "Apparel",
  "orderValue": 23,
  "userPickupTime": 1600616800000,
  "dropOffTime": null,
  "deliveryContact": {
    "name": "ali jam",
    "phone": "232-323-2323"
  },
  "deliveryAddress": {
    "street": "123 Main Street",
    "street2": "",
    "secondary": "",
    "city": "Irving",
    "state": "TX",
    "zipcode": "75024",
    "apartment": "no"
  },
   "packages": [
    {
      "name": "custom",
      "size": {
        "length": 2,
        "width": 22,
        "height": 2
      },
      "weight": 22
    }
  ],
  "isSpirit": false,
  "isBeerOrWine": false,
  "isFragile": false,
  "hasRefrigeratedItems": false,
  "hasPerishableItems": false,
  "notifications": {
    "url": "",
    "email": [
      "abcd@test.com",
      "abcd@test.com"
    ],
    "sms": [
      "972-342-2627",
      "232-232-3232"
    ]
  }
}'

```

```php
<?php

$client = new http\Client;
$request = new http\Client\Request;

$body = new http\Message\Body;
$body->append('{
  "userEmail": "dmart@gmail.com",
  "storeExternalId": "Mango101",
  "orderExternalId": "223",
  "department": "Apparel",
  "orderValue": 23,
  "userPickupTime": 1600616800000,
  "dropOffTime": null,
  "deliveryContact": {
    "name": "ali jam",
    "phone": "232-323-2323"
  },
  "deliveryAddress": {
    "street": "123 Main Street",
    "street2": "",
    "secondary": "",
    "city": "Irving",
    "state": "TX",
    "zipcode": "75024",
    "apartment": "no"
  },
   "packages": [
    {
      "name": "custom",
      "size": {
        "length": 2,
        "width": 22,
        "height": 2
      },
      "weight": 22
    }
  ],
  "isSpirit": false,
  "isBeerOrWine": false,
  "isFragile": false,
  "hasRefrigeratedItems": false,
  "hasPerishableItems": false,
  "notifications": {
    "url": "",
    "email": [
      "abcd@test.com",
      "abcd@test.com"
    ],
    "sms": [
      "972-342-2627",
      "232-232-3232"
    ]
  }
}');

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/order/estimates');
$request->setRequestMethod('POST');
$request->setBody($body);

$request->setHeaders(array(
  'postman-token' => '7a796edc-4f33-6068-32fc-f136ecf7752e',
  'cache-control' => 'no-cache',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();

```
 
 > Response
 
 ```json
{
    "estimates": [
        {
            "provider": "FedEx",
            "serviceType": "PR",
            "estimatedPickupTime": 1600625760000,
            "estimatedPickupTimeByZone": "September 20th 2020, 1:16:00 pm",
            "estimatedDeliveryTime": 1600627560000,
            "estimatedDeliveryTimeByZone": "September 20th 2020, 1:46:00 pm",
            "expires": null,
            "currency": "cents",
            "amount": 5003,
            "chargeDetails": [
                {
                    "currency": "cents",
                    "name": "Base Rate",
                    "amount": 3800
                },
                {
                    "currency": "cents",
                    "name": "Base Rate Discount (25%)",
                    "amount": -950
                },
                {
                    "currency": "cents",
                    "name": "DIRECT SIGNATURE REQUIRED",
                    "amount": 375
                },
                {
                    "currency": "cents",
                    "name": "Sunday Pickup",
                    "amount": 1600
                },
                {
                    "currency": "cents",
                    "name": "Fuel Surcharge",
                    "amount": 178
                }
            ],
            "tenantId": "LASH Delivery",
            "active": true,
            "RequestBody": {
                "userEmail": "dmart@gmail.com",
                "storeExternalId": "Mango101",
                "orderExternalId": "223",
                "department": "Apparel",
                "orderValue": 23,
                "userPickupTime": 1600616800000,
                "dropOffTime": null,
                "deliveryContact": {
                    "name": "ali jam",
                    "phone": "232-323-2323"
                },
                "deliveryAddress": {
                    "street": "123 Main Street",
                    "street2": "",
                    "secondary": "",
                    "city": "Irving",
                    "state": "TX",
                    "zipcode": "75024",
                    "apartment": "no"
                },
                "packages": [
                    {
                        "name": "custom",
                        "size": {
                            "length": 2,
                            "width": 22,
                            "height": 2
                        },
                        "weight": 22
                    }
                ],
                "isSpirit": false,
                "isBeerOrWine": false,
                "isFragile": false,
                "hasRefrigeratedItems": false,
                "hasPerishableItems": false,
                "notifications": {
                    "url": "",
                    "email": [
                        "abcd@test.com",
                        "abcd@test.com"
                    ],
                    "sms": [
                        "972-342-2627",
                        "232-232-3232"
                    ]
                },
                "timeZone": "America/Chicago",
                "pickUpContact": {
                    "name": "Peter Brown",
                    "phone": "214-234-2232"
                },
                "pickUpAddress": {
                    "street": "123 Main St",
                    "street2": "",
                    "secondary": "",
                    "city": "Highland Park",
                    "state": "TX",
                    "zipcode": "75062"
                },
                "pickUpTime": 1600616800000,
                "pickUpTimeByZone": "September 20th 2020, 10:46:40 am"
            },
            "orderId": "5974ceb57b0a620001c253f1",
            "fullresponse": [
                {
                    "chargeDetails": [
                        {
                            "name": "Base Rate",
                            "currencyAmount": {
                                "currencyCode": "USD",
                                "amount": 38
                            }
                        },
                        {
                            "name": "Base Rate Discount (25%)",
                            "currencyAmount": {
                                "currencyCode": "USD",
                                "amount": -9.5
                            }
                        },
                        {
                            "name": "DIRECT SIGNATURE REQUIRED",
                            "currencyAmount": {
                                "currencyCode": "USD",
                                "amount": 3.75
                            }
                        },
                        {
                            "name": "Sunday Pickup",
                            "currencyAmount": {
                                "currencyCode": "USD",
                                "amount": 16
                            }
                        },
                        {
                            "name": "Fuel Surcharge",
                            "currencyAmount": {
                                "currencyCode": "USD",
                                "amount": 1.78
                            }
                        }
                    ],
                    "shippingService": {
                        "serviceType": "PR",
                        "signatureService": "DSR",
                        "specialServices": null,
                        "restrictions": null
                    },
                    "estPickupTime": 1600625760000,
                    "estDeliveryTime": 1600627560000,
                    "pricingZone": "0D",
                    "totalWeight": {
                        "units": "LB",
                        "value": 22
                    },
                    "pieces": 1,
                    "fee": 50.03
                }
            ],
            "_id": "5974ceba7b0a620001c253f4"
        }
    ],
    "errors": [
        {
            "name": "Postmates",
            "message": "POSTMATE_CANNOT_PROVIDE_ESTIMATES_FOR_THE_GIVEN_TIME",
            "stack": "Dsp_Error"
        }
    ],
    "orderId": "5974ceb57b0a620001c253f1"
}
 
 ```
 
  <h3>HTTP Request</h3>
 
 `POST https://<API_URL>/order/estimates`
 
  <h3> POST Parameters </h3>
 
 Property | Type | Required | Description
 -------- | ---- | -------- | -----------
 storeExternalId | string | true | StoreId for which the estimate is being requested.
 orderExternalId | string | false | Any Id that the corporate system wants to assign to this request.
 department | string | false | Department 
 orderValue | decimal | false | Value of the order, though this field is optional but depending upon the DSP mapped to the request a validation failure may occur
 userPickupTime | string | false | time at which the package will be ready to be picked up, Unix time in milliseconds e.g. 1500616800000
 dropoffTime | string | false | last time to which the package must be delivered by, Unix time in milliseconds e.g. 1500616800000
 deliveryContact | [Customer Info](#customer-info) | true | Customer information to obtain an estimate.
 deliveryAddress | [Location](#location) | true | Address to deliver the package to.
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

> Request

```shell
curl -X POST \
  https://sandbox.api.deliverysolutions.co/api/v1/order/placeorder \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 767ba74b-bc42-b69a-8124-c95cea6e6580' \
  -H 'tenantid: Mango' \
  -H 'x-api-key: YOUR_API_KEY' \
  -d '{
  "userEmail": "dmart@gmail.com",
  "storeExternalId": "Mango101",
  "orderExternalId": "223",
  "department": "Apparel",
  "orderValue": 23,
  "userPickupTime": 1600616800000,
  "dropOffTime": null,
  "deliveryContact": {
    "name": "ali jam",
    "phone": "232-323-2323"
  },
  "deliveryAddress": {
    "street": "123 Main Street",
    "street2": "",
    "secondary": "",
    "city": "Irving",
    "state": "TX",
    "zipcode": "75024",
    "apartment": "no"
  },
   "packages": [
    {
      "name": "custom",
      "size": {
        "length": 2,
        "width": 22,
        "height": 2
      },
      "weight": 22
    }
  ],
  "isSpirit": false,
  "isBeerOrWine": false,
  "isFragile": false,
  "hasRefrigeratedItems": false,
  "hasPerishableItems": false,
  "notifications": {
    "url": "",
    "email": [
      "abcd@test.com",
      "abcd@test.com"
    ],
    "sms": [
      "972-342-2627",
      "232-232-3232"
    ]
  }
}'

```

```php
<?php

$client = new http\Client;
$request = new http\Client\Request;

$body = new http\Message\Body;
$body->append('{
  "userEmail": "dmart@gmail.com",
  "storeExternalId": "Mango101",
  "orderExternalId": "223",
  "department": "Apparel",
  "orderValue": 23,
  "userPickupTime": 1600616800000,
  "dropOffTime": null,
  "deliveryContact": {
    "name": "ali jam",
    "phone": "232-323-2323"
  },
  "deliveryAddress": {
    "street": "123 Main Street",
    "street2": "",
    "secondary": "",
    "city": "Irving",
    "state": "TX",
    "zipcode": "75024",
    "apartment": "no"
  },
   "packages": [
    {
      "name": "custom",
      "size": {
        "length": 2,
        "width": 22,
        "height": 2
      },
      "weight": 22
    }
  ],
  "isSpirit": false,
  "isBeerOrWine": false,
  "isFragile": false,
  "hasRefrigeratedItems": false,
  "hasPerishableItems": false,
  "notifications": {
    "url": "",
    "email": [
      "abcd@test.com",
      "abcd@test.com"
    ],
    "sms": [
      "972-342-2627",
      "232-232-3232"
    ]
  }
}');

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/order/placeorder');
$request->setRequestMethod('POST');
$request->setBody($body);

$request->setHeaders(array(
  'postman-token' => '516f9e22-9bb2-c825-13a3-aef03d2b06e2',
  'cache-control' => 'no-cache',
  'tenantid' => 'Mango',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();
```
> Response

```json
{
    "provider": "FedEx",
    "trackingNumber": "220088599494",
    "status": "ESTIMATES_RECEIVED",
    "estimatedPickupTime": 1600625760000,
    "estimatedDeliveryTime": 1600627560000,
    "estimatedPickupTimeByZone": "September 20th 2020, 1:16:00 pm",
    "estimatedDeliveryTimeByZone": "September 20th 2020, 1:46:00 pm",
    "currency": "cents",
    "amount": 5003,
    "courier": null,
    "labels": [
        {
            "trackingNumber": "220088599494",
            "url": "https://staging.fedexsameday.com/fdx_getlabel.aspx?id=8833431793442046914574116155",
            "code": "FXF2200885994942200885994940920209",
            "pdf": "actual data removed for brevity",
            "qrCodeImage": "actual data removed for brevity"
        }
    ],
    "orderId": "5974d2faa4d9dc0001f2ccd7"
}

```

<h3>HTTP Request</h3>
`POST https://<BASE_URL>/order/placeorder`
### Post Parameters

Property | Type | Required | Description
 -------- | ---- | -------- | -----------
 store | Store | true | Store
 orderExternalId | string | false | Any Id that the corporate system wants to assign to this request.
 department | string | false | Department 
 orderValue | decimal | false | Value of the order, though this field is optional but depending upon the DSP mapped to the request a validation failure may occur
 userPickupTime | string | false | time at which the package will be ready to be picked up, Unix time in milliseconds e.g. 1500616800000
 dropoffTime | string | false | last time to which the package must be delivered by, Unix time in milliseconds e.g. 1500616800000
 deliveryContact | [Customer Info](#customer-info) | true | Customer information to obtain an estimate.
 deliveryAddress | [Location](#location) | true | Address to deliver the package to.
 packages | [ Dimension[] ](#dimension) | true | Array of Dimension of each package.
 isSpirit | bool | true | Contains Spirits
 isBeerOrWine | bool | false | Contains beer or wine
 isFragile | bool | false | Is Fragile.
 hasRefrigeratedItems | bool | false | Has refrigerated items
 hasPerishableItems | bool | false | Has perishable items
 notifications | Array of [Notification](#notification)|false| email/sms/status update notification
 userEmail | string | true | User email
 
 
 Error Code |  Detail | Resolution
 --------- | ----------- | ---------
 NO_ESTIMATES_FOR_APPROVED_DELIVERY_AMOUNT | None of the estimates received were below the set threshold amount | Visit Corporate/Business Rules and check the threshold amount.


## Create Order From Estimate

> Request

```shell
curl -X POST \
  https://sandbox.api.deliverysolutions.co/api/v1/order/createorderfromestimate/5974ceba7b0a620001c253f4 \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 8c144f36-2f4c-0a9d-3bf5-375f2a0ee214' \
  -H 'x-api-key: YOUR_API_KEY'
```
```php
<?php

$client = new http\Client;
$request = new http\Client\Request;

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/order/createorderfromestimate/5974ceba7b0a620001c253f4');
$request->setRequestMethod('POST');
$request->setHeaders(array(
  'postman-token' => '9b3cacb0-d0d1-7c72-6c2f-b8f709a993e8',
  'cache-control' => 'no-cache',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();

```
> Response

```json
{
    "provider": "FedEx",
    "trackingNumber": "220088599509",
    "status": "RECEIVED_BY_LMA",
    "estimatedPickupTime": 1600625760000,
    "estimatedDeliveryTime": 1600627560000,
    "estimatedPickupTimeByZone": "September 20th 2020, 1:16:00 pm",
    "estimatedDeliveryTimeByZone": "September 20th 2020, 1:46:00 pm",
    "currency": "cents",
    "amount": 5003,
    "courier": null,
    "labels": [
        {
            "trackingNumber": "220088599509",
            "url": "https://staging.fedexsameday.com/fdx_getlabel.aspx?id=8388831095892064030571984856",
            "code": "FXF2200885995092200885995090920209",
            "pdf": "actual data removed for brevity"
            "qrCodeImage": "actual data removed for brevity"
        }
    ],
    "orderId": "5974ceb57b0a620001c253f1"
}

```

<h3>HTTP Request</h3>

### URL Parameters

Property | Type | Required | Description
-------- | ---- | -------- | -----------
estimateId | string | true | ID of an Estimate

<aside class="success">
<code>estimateId</code> The '_id' obtained from a GetEstimate response e.g. "_id":"5974ceba7b0a620001c253f4"
</aside>



## Get Order

### HTTP Request

> Request

 ```shell

curl -X GET \
  https://sandbox.api.deliverysolutions.co/api/v1/order/getById/5972ddec72ff1500012b0cd6 \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 46877cc5-6d7a-c9fd-feac-ba72c3eacf17' \
  -H 'x-api-key: YOUR_API_KEY'

```
  
```php

<?php

$client = new http\Client;
$request = new http\Client\Request;

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/order/getById/5972ddec72ff1500012b0cd6');
$request->setRequestMethod('GET');
$request->setHeaders(array(
  'postman-token' => '42475f83-e2a3-22e3-ec8d-3210c0312ea2',
  'cache-control' => 'no-cache',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();

```

>  Response

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
`GET https://<BASE_URL>/order/getById/<orderId>`

### URL Parameters

Parameter | Description
--------- | -----------
orderId | Order id - this is returned when an order is placed. 
<p> <code> e.g. "orderId":"596360614cfa472eedcce8fe" </code></p>


## Get Order Status
> Request

```shell

curl -X GET \
  https://sandbox.api.deliverysolutions.co/api/v1/order/getOrderStatus/5972ddec72ff1500012b0cd6 \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: cfbfa29c-27bd-39f8-28f9-9f5bed3b2eb6' \
  -H 'x-api-key: YOUR_API_KEY'
  
```
```php

<?php

$client = new http\Client;
$request = new http\Client\Request;

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/order/getOrderStatus/5972ddec72ff1500012b0cd6');
$request->setRequestMethod('GET');
$request->setHeaders(array(
  'postman-token' => 'aa90ada6-b845-0cfc-456d-fb00a690ba92',
  'cache-control' => 'no-cache',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();


```
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

`PUT https://<BASE_URL>/order/getOrderStatus/<orderId>`

### URL Parameters

Parameter | Description
--------- | -----------
orderId | Order id

<p> <code> e.g. "orderId":"596360614cfa472eedcce8fe" </code></p>

## Cancel Order
> Request

```php
<?php

$client = new http\Client;
$request = new http\Client\Request;

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/order/5974d2faa4d9dc0001f2ccd7');
$request->setRequestMethod('DELETE');
$request->setHeaders(array(
  'postman-token' => 'fa9a459f-7406-623e-3a11-abd66339e6db',
  'cache-control' => 'no-cache',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();

```

```shell

curl -X DELETE \
  https://sandbox.api.deliverysolutions.co/api/v1/order/5974d2faa4d9dc0001f2ccd7 \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: f85b3797-784c-8920-c5ca-1037c4570cd2' \
  -H 'x-api-key: YOUR_API_KEY'

```

> Response [406]

```json
{
    "name": "FedEx",
    "message": "{\"Message\":\"FEDEX_CANCEL_NOT_SUPPORTED\",\"Orderid\":\"596360614cfa472eedcce8fe\"}"
}
```

> Response [200]

```json
[
    {
        "_id": "596360614cfa472eedcce8fe",
        "orderId": "596360614cfa472eedcce8fe",
        "tenantId": "D-mart",
        "orderStatus": [
            {
              "status": "ORDER_CANCELLED",
              "updatedAt": "July 10th 2017, 6:09:39 am"
            },
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

`DELETE https://<BASE_URL>/v1/order/<orderId>`

### URL Parameters

Parameter | Description
--------- | -----------
orderId | Order id


# Alcohol Compliance

## Get Alcohol Compliance

> Request

```shell

curl -X POST \
  https://sandbox.api.deliverysolutions.co/api/v1/getAlcoholCompliance \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 5948e1fd-c63d-caab-278e-495c61e79930' \
  -H 'tenantid: Mango' \
  -H 'x-api-key: YOUR_API_KEY' \
  -d '{
  "delivery_from": {
    "address_1" : "9019 Jasmine Ln",
    "address_2" : "",
    "city" : "Irving",
    "state" : "TX",
    "zip" : "75063"
  },
  "delivery_to": {
      "address_1" : "1111 Christopher Court",
      "address_2" : "",
      "city" : "Irving",
      "state": "TX",
      "zip" : "75060"
    }
}
'

```

```php
<?php

$client = new http\Client;
$request = new http\Client\Request;

$body = new http\Message\Body;
$body->append('{
  "delivery_from": {
    "address_1" : "9019 Jasmine Ln",
    "address_2" : "",
    "city" : "Irving",
    "state" : "TX",
    "zip" : "75063"
  },
  "delivery_to": {
      "address_1" : "1111 Christopher Court",
      "address_2" : "",
      "city" : "Irving",
      "state": "TX",
      "zip" : "75060"
    }
}
');

$request->setRequestUrl('https://sandbox.api.deliverysolutions.co/api/v1/getAlcoholCompliance');
$request->setRequestMethod('POST');
$request->setBody($body);

$request->setHeaders(array(
  'postman-token' => '6a7b4bd9-b9d0-05db-a6a9-cdbc23be6b0a',
  'cache-control' => 'no-cache',
  'tenantid' => 'Mango',
  'content-type' => 'application/json',
  'x-api-key' => 'YOUR_API_KEY'
));

$client->enqueue($request)->send();
$response = $client->getResponse();

echo $response->getBody();

```

> Response [200]

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

> Response

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

`POST https://<BASE_URL>/getAlcoholCompliance`

### POST Parameters

Parameter |  Type | Required
--------- | ----------- | ---------
delivery_from | Location | true
delivery_to | Location | true


# Webhooks / SMS / Email

> Sample Webhook Response

```json
{
        "status" : "SHIPPING", 
        "event" : "event.courier_update", 
        "receivedAt" : "June 15th 2017, 12:08:26 pm", 
        "trackingNumber" : "del_LJ9ycrKkbBuETV", 
        "provider" : "Postmates", 
        "orderId" : "5942be979401b5083f089578", 
        "tenantId" : "D-mart"
 }
```

<h3>Email</h3> 
In the Corporate Profile make sure Email is checked.

<h3>SMS</h3> 
In the Corporate Profile make sure Phone is checked.


Status | Description
--------- | -----------
DISPATCHED_TO_DSP | Order has been placed with the DSP.
ORDER_CONFIRMED | Pickup has been initiated for the order.
PICKUP_COMPLETE | Order has been picked up successfully.
SHIPPING | Order is out for delivery.
DELIVERED | Order has been delivered successfully.
RETURNED | Order has been returned.
CANCELED | Order has been canceled.

<aside class="notice">

For every DSP the status for which notification is sent can be configured. 
You can view the configuration by visiting the <a href="https://sandbox.portal.deliverysolutions.co/#/corporate/dsp" > DSP </a> page. 

</aside>

<h3>Webhooks Url</h3>
You can configure a notification url in the corporate profile and also provide url with in the notification item with each order.


# Errors

Error Code |  Detail | Resolution
--------- | ----------- | ---------
NO_ESTIMATES_FOR_APPROVED_DELIVERY_AMOUNT | None of the estimates received were below the set threshold amount | Visit Corporate/Business Rules and check the threshold amount.


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































