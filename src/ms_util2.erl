%% This module automatically generated by make_ms_util
%% DO NOT EDIT
%%% This module provides utilities for use in building
%%% match specifications from records
%%% @private
-module(ms_util2).

-export([get_index/2,
         no_of_fields/1,
         is_in_record/2,
         name_by_index/2,
         get_record_info/1]).

is_in_record(Record, Field) ->
    Return = try get_index(Record, Field)
             catch
                exit : _ -> false
                end,
    case Return of
      false -> false;
      _     -> true
    end.

get_index(Record, Field) when is_atom(Field)-> 
   get_index2(Record, Field);
get_index(Record, Field) ->
   Field2 = try erlang:list_to_existing_atom(Field)
      catch
          _Error : _ -> exit({error, Record, no_exists, Field})
      end,
     get_index2(Record, Field2).
no_of_fields(paypal_auth_hdrs) -> 5;
no_of_fields(paypal_RequestEnvelope) -> 2;
no_of_fields(paypal_CreateAndSendInvoiceRequest) -> 2;
no_of_fields(paypal_Invoice) -> 19;
no_of_fields(paypal_BusinessInfo) -> 8;
no_of_fields(paypal_BaseAddressFields) -> 7;
no_of_fields(paypal_InvoiceItemType) -> 7;
no_of_fields(paypal_ResponseEnvelope) -> 4;
no_of_fields(paypal_CreateAndSendInvoiceResponse) -> 4;
no_of_fields(Other) -> exit({error, "Invalid Record Name: "++Other}).


get_index2(paypal_auth_hdrs, 'security_userid')-> 1;
get_index2(paypal_auth_hdrs, 'security_password')-> 2;
get_index2(paypal_auth_hdrs, 'security_signature')-> 3;
get_index2(paypal_auth_hdrs, 'ip_address')-> 4;
get_index2(paypal_auth_hdrs, 'application_id')-> 5;
get_index2(paypal_auth_hdrs,F) -> exit({error, paypal_auth_hdrs, no_exists, F});
get_index2(paypal_RequestEnvelope, 'detailLevel')-> 1;
get_index2(paypal_RequestEnvelope, 'errorLanguage')-> 2;
get_index2(paypal_RequestEnvelope,F) -> exit({error, paypal_RequestEnvelope, no_exists, F});
get_index2(paypal_CreateAndSendInvoiceRequest, 'requestEnvelope')-> 1;
get_index2(paypal_CreateAndSendInvoiceRequest, 'invoice')-> 2;
get_index2(paypal_CreateAndSendInvoiceRequest,F) -> exit({error, paypal_CreateAndSendInvoiceRequest, no_exists, F});
get_index2(paypal_Invoice, 'merchantEmail')-> 1;
get_index2(paypal_Invoice, 'payerEmail')-> 2;
get_index2(paypal_Invoice, 'number')-> 3;
get_index2(paypal_Invoice, 'merchantInfo')-> 4;
get_index2(paypal_Invoice, 'itemList')-> 5;
get_index2(paypal_Invoice, 'currencyCode')-> 6;
get_index2(paypal_Invoice, 'invoiceData')-> 7;
get_index2(paypal_Invoice, 'dueDate')-> 8;
get_index2(paypal_Invoice, 'paymentTerms')-> 9;
get_index2(paypal_Invoice, 'discountPercentage')-> 10;
get_index2(paypal_Invoice, 'terms')-> 11;
get_index2(paypal_Invoice, 'note')-> 12;
get_index2(paypal_Invoice, 'merchantMemo')-> 13;
get_index2(paypal_Invoice, 'billingInfo')-> 14;
get_index2(paypal_Invoice, 'shippingInfo')-> 15;
get_index2(paypal_Invoice, 'shippingAmount')-> 16;
get_index2(paypal_Invoice, 'shippingTaxName')-> 17;
get_index2(paypal_Invoice, 'shippingTaxRate')-> 18;
get_index2(paypal_Invoice, 'logoUrl')-> 19;
get_index2(paypal_Invoice,F) -> exit({error, paypal_Invoice, no_exists, F});
get_index2(paypal_BusinessInfo, 'firstName')-> 1;
get_index2(paypal_BusinessInfo, 'lastName')-> 2;
get_index2(paypal_BusinessInfo, 'businessName')-> 3;
get_index2(paypal_BusinessInfo, 'phone')-> 4;
get_index2(paypal_BusinessInfo, 'fax')-> 5;
get_index2(paypal_BusinessInfo, 'website')-> 6;
get_index2(paypal_BusinessInfo, 'customValue')-> 7;
get_index2(paypal_BusinessInfo, 'address')-> 8;
get_index2(paypal_BusinessInfo,F) -> exit({error, paypal_BusinessInfo, no_exists, F});
get_index2(paypal_BaseAddressFields, 'city')-> 1;
get_index2(paypal_BaseAddressFields, 'countryCode')-> 2;
get_index2(paypal_BaseAddressFields, 'line1')-> 3;
get_index2(paypal_BaseAddressFields, 'line2')-> 4;
get_index2(paypal_BaseAddressFields, 'postalCode')-> 5;
get_index2(paypal_BaseAddressFields, 'state')-> 6;
get_index2(paypal_BaseAddressFields, 'type')-> 7;
get_index2(paypal_BaseAddressFields,F) -> exit({error, paypal_BaseAddressFields, no_exists, F});
get_index2(paypal_InvoiceItemType, 'name')-> 1;
get_index2(paypal_InvoiceItemType, 'description')-> 2;
get_index2(paypal_InvoiceItemType, 'date')-> 3;
get_index2(paypal_InvoiceItemType, 'quantity')-> 4;
get_index2(paypal_InvoiceItemType, 'unitPrice')-> 5;
get_index2(paypal_InvoiceItemType, 'taxName')-> 6;
get_index2(paypal_InvoiceItemType, 'taxRate')-> 7;
get_index2(paypal_InvoiceItemType,F) -> exit({error, paypal_InvoiceItemType, no_exists, F});
get_index2(paypal_ResponseEnvelope, 'ack')-> 1;
get_index2(paypal_ResponseEnvelope, 'build')-> 2;
get_index2(paypal_ResponseEnvelope, 'correlationId')-> 3;
get_index2(paypal_ResponseEnvelope, 'timestamp')-> 4;
get_index2(paypal_ResponseEnvelope,F) -> exit({error, paypal_ResponseEnvelope, no_exists, F});
get_index2(paypal_CreateAndSendInvoiceResponse, 'responseEnvelope')-> 1;
get_index2(paypal_CreateAndSendInvoiceResponse, 'invoiceID')-> 2;
get_index2(paypal_CreateAndSendInvoiceResponse, 'invoiceNumber')-> 3;
get_index2(paypal_CreateAndSendInvoiceResponse, 'invoiceURL')-> 4;
get_index2(paypal_CreateAndSendInvoiceResponse,F) -> exit({error, paypal_CreateAndSendInvoiceResponse, no_exists, F});
get_index2(Record,_Field) -> exit({error, "Invalid Record Name: "++Record}).
name_by_index('paypal_auth_hdrs', 1) -> "security_userid";
name_by_index('paypal_auth_hdrs', 2) -> "security_password";
name_by_index('paypal_auth_hdrs', 3) -> "security_signature";
name_by_index('paypal_auth_hdrs', 4) -> "ip_address";
name_by_index('paypal_auth_hdrs', 5) -> "application_id";
name_by_index('paypal_RequestEnvelope', 1) -> "detailLevel";
name_by_index('paypal_RequestEnvelope', 2) -> "errorLanguage";
name_by_index('paypal_CreateAndSendInvoiceRequest', 1) -> "requestEnvelope";
name_by_index('paypal_CreateAndSendInvoiceRequest', 2) -> "invoice";
name_by_index('paypal_Invoice', 1) -> "merchantEmail";
name_by_index('paypal_Invoice', 2) -> "payerEmail";
name_by_index('paypal_Invoice', 3) -> "number";
name_by_index('paypal_Invoice', 4) -> "merchantInfo";
name_by_index('paypal_Invoice', 5) -> "itemList";
name_by_index('paypal_Invoice', 6) -> "currencyCode";
name_by_index('paypal_Invoice', 7) -> "invoiceData";
name_by_index('paypal_Invoice', 8) -> "dueDate";
name_by_index('paypal_Invoice', 9) -> "paymentTerms";
name_by_index('paypal_Invoice', 10) -> "discountPercentage";
name_by_index('paypal_Invoice', 11) -> "terms";
name_by_index('paypal_Invoice', 12) -> "note";
name_by_index('paypal_Invoice', 13) -> "merchantMemo";
name_by_index('paypal_Invoice', 14) -> "billingInfo";
name_by_index('paypal_Invoice', 15) -> "shippingInfo";
name_by_index('paypal_Invoice', 16) -> "shippingAmount";
name_by_index('paypal_Invoice', 17) -> "shippingTaxName";
name_by_index('paypal_Invoice', 18) -> "shippingTaxRate";
name_by_index('paypal_Invoice', 19) -> "logoUrl";
name_by_index('paypal_BusinessInfo', 1) -> "firstName";
name_by_index('paypal_BusinessInfo', 2) -> "lastName";
name_by_index('paypal_BusinessInfo', 3) -> "businessName";
name_by_index('paypal_BusinessInfo', 4) -> "phone";
name_by_index('paypal_BusinessInfo', 5) -> "fax";
name_by_index('paypal_BusinessInfo', 6) -> "website";
name_by_index('paypal_BusinessInfo', 7) -> "customValue";
name_by_index('paypal_BusinessInfo', 8) -> "address";
name_by_index('paypal_BaseAddressFields', 1) -> "city";
name_by_index('paypal_BaseAddressFields', 2) -> "countryCode";
name_by_index('paypal_BaseAddressFields', 3) -> "line1";
name_by_index('paypal_BaseAddressFields', 4) -> "line2";
name_by_index('paypal_BaseAddressFields', 5) -> "postalCode";
name_by_index('paypal_BaseAddressFields', 6) -> "state";
name_by_index('paypal_BaseAddressFields', 7) -> "type";
name_by_index('paypal_InvoiceItemType', 1) -> "name";
name_by_index('paypal_InvoiceItemType', 2) -> "description";
name_by_index('paypal_InvoiceItemType', 3) -> "date";
name_by_index('paypal_InvoiceItemType', 4) -> "quantity";
name_by_index('paypal_InvoiceItemType', 5) -> "unitPrice";
name_by_index('paypal_InvoiceItemType', 6) -> "taxName";
name_by_index('paypal_InvoiceItemType', 7) -> "taxRate";
name_by_index('paypal_ResponseEnvelope', 1) -> "ack";
name_by_index('paypal_ResponseEnvelope', 2) -> "build";
name_by_index('paypal_ResponseEnvelope', 3) -> "correlationId";
name_by_index('paypal_ResponseEnvelope', 4) -> "timestamp";
name_by_index('paypal_CreateAndSendInvoiceResponse', 1) -> "responseEnvelope";
name_by_index('paypal_CreateAndSendInvoiceResponse', 2) -> "invoiceID";
name_by_index('paypal_CreateAndSendInvoiceResponse', 3) -> "invoiceNumber";
name_by_index('paypal_CreateAndSendInvoiceResponse', 4) -> "invoiceURL";
name_by_index(Record,N) -> exit({error, Record, no_field_at_index, N}).

get_record_info(paypal_auth_hdrs) ->['security_userid', 'security_password', 'security_signature', 'ip_address', 'application_id'];
get_record_info(paypal_RequestEnvelope) ->['detailLevel', 'errorLanguage'];
get_record_info(paypal_CreateAndSendInvoiceRequest) ->['requestEnvelope', 'invoice'];
get_record_info(paypal_Invoice) ->['merchantEmail', 'payerEmail', 'number', 'merchantInfo', 'itemList', 'currencyCode', 'invoiceData', 'dueDate', 'paymentTerms', 'discountPercentage', 'terms', 'note', 'merchantMemo', 'billingInfo', 'shippingInfo', 'shippingAmount', 'shippingTaxName', 'shippingTaxRate', 'logoUrl'];
get_record_info(paypal_BusinessInfo) ->['firstName', 'lastName', 'businessName', 'phone', 'fax', 'website', 'customValue', 'address'];
get_record_info(paypal_BaseAddressFields) ->['city', 'countryCode', 'line1', 'line2', 'postalCode', 'state', 'type'];
get_record_info(paypal_InvoiceItemType) ->['name', 'description', 'date', 'quantity', 'unitPrice', 'taxName', 'taxRate'];
get_record_info(paypal_ResponseEnvelope) ->['ack', 'build', 'correlationId', 'timestamp'];
get_record_info(paypal_CreateAndSendInvoiceResponse) ->['responseEnvelope', 'invoiceID', 'invoiceNumber', 'invoiceURL'];
get_record_info(Rec) -> exit({error, "no such record", Rec}).