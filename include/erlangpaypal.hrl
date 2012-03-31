% records for managing the Paypal Invoicing API

-record(paypal_auth_hdrs,
        {
          security_userid,
          security_password,
          security_signature,
          ip_address,
          application_id
         }).

-record(paypal_RequestEnvelope,
        {
          detailLevel   = "ReturnAll",
          errorLanguage = "en_US"
         }).

-record(paypal_CreateAndSendInvoiceRequest,
        {
          requestEnvelope,
          invoice
         }).

-record(paypal_Invoice,
        {
          merchantEmail,             % Required
          payerEmail,                % Required
          number,                    % Optional
          merchantInfo,
          itemList,                  % Required
          currencyCode,              % Required
          invoiceData,               % Optional
          dueDate,                   % Optional
          paymentTerms,              % Required
          discountPercentage,        % Optional
          terms,                     % Optional
          note,                      % Optional
          merchantMemo,              % Optional
          billingInfo,               % Optional
          shippingInfo,              % Optional
          shippingAmount,            % Optional
          shippingTaxName,           % Optional
          shippingTaxRate,           % Optional
          logoUrl                    % Optional
         }).

-record(paypal_BusinessInfo,
        {
          firstName,               % Optional
          lastName,                % Optional
          businessName,            % Optional
          phone,                   % Optional
          fax,                     % Optional
          website,                 % Optional
          customValue,             % Optional
          address                  % Optional
         }).

-record(paypal_BaseAddressFields,
        {
          city,                % Required
          countryCode,         % Required
          line1,               % Required
          line2,               % Optional
          postalCode,          % Optional
          state,               % Optional
          type                 % Optional
         }).

-record(paypal_InvoiceItemType,
        {
          name,                % Required
          description,         % Optional
          date,                % Optional
          quantity,            % Required
          unitPrice,           % Required
          taxName,             % Optional
          taxRate              % Optional
         }).

-record(paypal_ResponseEnvelope,
        {
          ack,
          build,
          correlationId,
          timestamp
         }).

-record(paypal_CreateAndSendInvoiceResponse,
        {
          responseEnvelope,
          invoiceID,
          invoiceNumber,
          invoiceURL
         }).

-define(VALID_ISO_CURRENCIES,
        [
         "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD",
         "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF",
         "BMD", "BND", "BOB", "BOV", "BRL", "BSD", "BTN", "BWP",
         "BYR", "BZD", "CAD", "CDF", "CHE", "CHF", "CHW", "CLF",
         "CLP", "CNY", "COP", "COU", "CRC", "CUC", "CUP", "CVE",
         "CZK", "DJF", "DKK", "DOP", "DZD", "EEK", "EGP", "ERN",
         "ETB", "EUR", "FJD", "FKP", "GBP", "GEL", "GHS", "GIP",
         "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG",
         "HUF", "IDR", "ILS", "INR", "IQD", "IRR", "ISK", "JMD",
         "JOD", "JPY", "KES", "KGS", "KHR", "KMF", "KPW", "KRW",
         "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL",
         "LTL", "LVL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK",
         "MNT", "MOP", "MRO", "MUR", "MVR", "MWK", "MXN", "MXV",
         "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD",
         "OMR", "PAB", "PEN", "PGK", "PHP", "PKR", "PLN", "PYG",
         "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR",
         "SDG", "SEK", "SGD", "SHP", "SLL", "SOS", "SRD", "STD",
         "SVC", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP",
         "TRY", "TTD", "TWD", "TZS", "UAH", "UGX", "USD", "USN",
         "USS", "UYI", "UYU", "UZS", "VEF", "VND", "VUV", "WST",
         "XAF", "XCD", "XOF", "XPF", "YER", "ZAR", "ZMK", "ZWL"
        ]).
