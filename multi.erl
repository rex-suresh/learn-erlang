-module(multi).
-export([micFn/0, speakerFn/0, run/0]).

micFn() -> 
    receive
        Message ->
        io:fwrite("At Mic : " ++ Message ++ "\n"),
        speaker ! Message,
        micFn()
    end.

speakerFn() -> 
    receive
        Message -> io:fwrite("From Speaker : " ++ Message ++ "\n"),
        speakerFn()
    end.

run() ->
    register(speaker, spawn(multi, speakerFn, [])),
    register(mic, spawn(multi, micFn, [])),
    mic ! "I'm here",
    mic ! "It Works",
done.
