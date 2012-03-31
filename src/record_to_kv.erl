%%% @author    Gordon Guthrie
%%% @copyright (C) 2012, Hypernumbers Ltd
%%% @doc       A library that turns records into web-encoded
%%%            KV pairs
%%% @end
%%% Created :  31 Mar 2012 by gordon@hypernumbers.com

-module(record_to_kv).

-export([
         to_kv/1
        ]).

to_kv(Record) ->
    Rec = element(1, Record),
    [_ | List] = tuple_to_list(Record),
    make_kv(List, 1, Rec, []).

make_kv([], _N, _Rec, Acc) ->
    lists:flatten(lists:reverse(Acc));
make_kv([V | T], N, Rec, Acc) ->
    K = ms_util2:name_by_index(Rec, N),
    make_kv(T, N + 1, Rec, [{K, V} | Acc]).
