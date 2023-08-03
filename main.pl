
:- use_module(library(format)).
:- use_module(library(pio)).
:- use_module(library(dcgs)).
:- use_module(library(os)).
:- use_module(library(charsio)).
:- use_module(library(lists)).

%% :- initialization(main).

as --> [].
as --> [a], as.

dollar_variable(X) --> "$" , lower(X) .

lower([S]) --> [S], { char_type(S, lower) }.
lower([Char | Rest]) --> [Char], { char_type(Char, lower) }, lower(Rest).

main :- format("Welcome to the shell~n", []), repl.


handle_list(List) :-
    shell(List) -> format("~nSuccess", []) ;
     format("Encountered a failure with ~s", [List]).

repl :- repeat,
        format("~n><> ",[]),
         get_line_to_chars(user_input, RawInput, []),
         append(NoNewLine, "\n", RawInput),
         handle_list(NoNewLine),
         false.
