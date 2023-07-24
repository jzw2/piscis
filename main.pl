
:- use_module(library(format)).
:- use_module(library(pio)).
:- use_module(library(dcgs)).
:- use_module(library(os)).
:- use_module(library(charsio)).
:- use_module(library(lists)).

:- initialization(main).

as --> [].
as --> [a], as.

xs(said_hi) --> "hi" .
xs(quit) --> "quit" .

%% main :- phrase_from_stream(xs(Thing), user_input), format("~w", [Thing]).
%%
%%

main :- format("Welcome to the shell~n", []), repl.


repl :- format("~n><>",[]),
        current_input(InputStream),
        get_line_to_chars(InputStream, RawInput, []),
        append(NoNewLine, "\n", RawInput),
        (NoNewLine = "exit" , write('OK Bye!'), halt;
        format("You entreed command ~s, executing ~n", [NoNewLine]),  (shell(NoNewLine) -> format("Sucesss!", []), repl ;
        write('Oops, that didn\'t work, try again. '), repl) ).
