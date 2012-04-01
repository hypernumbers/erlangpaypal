%%% @author    Gordon Guthrie
%%% @copyright (C) 2012, Hypernumbers Ltd
%%% @doc        A client for the Paypal Invoice API
%%%             https://www.x.com/developers/paypal/documentation-tools/api/createandsendinvoice-api-operation
%%% @end
%%% Created :  31 Mar 2012 by gordon@hypernumbers.com

-module(paypal_invoice).

-export([
         debug/0
         ]).

-export([
         create_and_send_inv/2
         ]).

-include("erlangpaypal.hrl").
-include("erlangpaypal_vals.hrl").
-include("paypal_debug.hrl").

debug() ->
    Auth = #paypal_auth_hdrs{'X-PAYPAL-SECURITY-USERID'      = ?USERID,
                             'X-PAYPAL-SECURITY-PASSWORD'    = ?PASSWORD,
                             'X-PAYPAL-SECURITY-SIGNATURE'   = ?SIGNATURE,
                             'X-PAYPAL-DEVICE-IPADDRESS'     = ?IPADDIE,
                             'X-PAYPAL-REQUEST-DATA-FORMAT'  = "NV",
                             'X-PAYPAL-RESPONSE-DATA-FORMAT' = "NV",
                             'X-PAYPAL-APPLICATION-ID'       = ?APP_ID},
    Item1 = #paypal_InvoiceItemType{name = "bish",
                                    quantity = 1,
                                    unitPrice = 1
                                    },
    Item2 = #paypal_InvoiceItemType{name = "bash",
                                    quantity = 1,
                                    unitPrice = 1
                                    },
    Item3 = #paypal_InvoiceItemType{name = "bosh",
                                    quantity = 1,
                                    unitPrice = 1
                                    },
    EncodedItemList = make_item_list([Item1, Item2, Item3]),
    Inv = #paypal_Invoice{merchantEmail = "gordon@hypernumbers.com",
                          payerEmail    = "stephen@hypernumbers.com",
                          number        = "http://example.com/some/page/a1",
                          itemList      = EncodedItemList,
                          currencyCode  = "GBP",
                          paymentTerms  = "DueOnReceipt"},
    create_and_send_inv(Auth, Inv).

create_and_send_inv(Auth, Inv) ->
    Headers = record_to_kv:to_kv(Auth),
    InvKV = record_to_kv:to_kv(Inv),
    InvKV2 = encode_inv(InvKV, []),
    io:format("Headers is ~p~nBody is ~p~n", [Headers, InvKV2]),
    ok.

encode_inv([], Acc) ->
    string:join(lists:reverse(Acc) , "&");
% special case for itemList...
encode_inv([{itemList, V} | T], Acc) ->
    encode_inv(T, [V | Acc]);
encode_inv([{K, V} | T], Acc) ->
    case make(K, V) of
        [] -> encode_inv(T, Acc);
        _  -> encode_inv(T, [make(K, V) | Acc])
    end.

make(_K, undefined) ->
    "";
make(K, V) when is_list(V) ->
    K ++ "=" ++ V;
make(K, V) when is_integer(V) ->
    K ++ "=" + integer_to_list(V);
make(K, V) when is_float(V) ->
    K ++ "=" ++ float_to_list(V).

make_item_list(List) ->
    make_item_l2(List, 0, []).

make_item_l2([], _N, Acc) ->
    lists:flatten(lists:reverse(Acc));
make_item_l2([H | T], N, Acc) ->
    make_item_l2(T, N + 1, [encode(record_to_kv:to_kv(H), N, []) | Acc]).

encode([], _N, Acc) ->
    string:join(lists:reverse(Acc), "&");
encode([{_K, undefined} | T], N, Acc) ->
    encode(T, N, Acc);
encode([{K, V} | T], N, Acc) when is_list(V) ->
    encode(T, N, ["invoice.itemList.item(" ++ integer_to_list(N) ++ ")." ++
                  K ++ "=" ++ V | Acc]);
encode([{K, V} | T], N, Acc) when is_integer(V) ->
    encode(T, N, ["invoice.itemList.item(" ++ integer_to_list(N) ++ ")." ++
                  K ++ "=" ++ integer_to_list(V) | Acc]);
encode([{K, V} | T], N, Acc) when is_float(V) ->
    encode(T, N, ["invoice.itemList.item(" ++ integer_to_list(N) ++ ")." ++
                  K ++ "=" ++ float_to_list(V) | Acc]).
