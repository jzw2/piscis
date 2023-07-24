
:- use_module(library(format)).
:- use_module(library(pio)).
:- use_module(library(dcgs)).
:- use_module(library(os)).

:- initialization(main).

as --> [].
as --> [a], as.

xs(said_hi) --> "hi" .
xs(quit) --> "quit" .

%% main :- phrase_from_stream(xs(Thing), user_input), format("~w", [Thing]).
%%
%%

main :- format("Welcome to the shell~n", []), repl.


repl :- write('><> '),
        read(X),
        (X = exit , write('OK Bye!'), halt;
        format("You entreed command ~w, executing", [X]),  (shell(X) -> format("Sucesss!", []), repl ;
        write("Oops, that didn't work, try again. "), repl) ).
