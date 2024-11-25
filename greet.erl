-module(hi).
-export([greet/0, greet/1]).

greet() -> 
    "Hey mom";
greet(n) -> 
    "Hey ".

greet([]) -> 
    io:fwrite("");
greet([Name | Rest]) ->
    io:fwrite("Hey " ++ Name ++ "\n"),
    greet(Rest).