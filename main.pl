
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


red :-  format("\x1b\[1;31m  hi", []).

up(N) :- format("\x1b\[~wA", [N]) .


clear :- format("\x1b\[2J", []).

home :- format("\x1b\[H", []).

getplace :- format("\x1b\[6n", []).

save :- format("\x1b\[s", []).

load :- format("\x1b\[u", []).

backspace :- format("\x1b\H", []).

backspace2 :- format("~b", []).

report :- format("\x1b\[6n ok what next", []), read(X), write(X).

repl :-
    %% format("~n><> ",[]),
        %%  current_input(InputStream),
        get_single_char(C),

        (C = '\x1b\H' -> format("We are done", []);
                C = '\b' -> write('\b'), repl;
        format("~w", [C]), repl).

        %% get_line_to_chars(InputStream, RawInput, []),
        %% append(NoNewLine, "\n", RawInput),
        %% (NoNewLine = "exit" , write('OK Bye!'), halt;
        %% format("You entreed command ~s, executing ~n", [NoNewLine]),  (shell(NoNewLine) -> format("Sucesss!", []), repl ;
        %% write('Oops, that didn\'t work, try again. '), repl) ).
