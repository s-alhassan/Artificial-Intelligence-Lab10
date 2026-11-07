% Task 1: Area and perimete
% Square: area = side * side, perimeter = 4 * side.
square_area(Side, Area) :-
    number(Side),
    Side > 0,
    Area is Side * Side.

square_perimeter(Side, Perimeter) :-
    number(Side),
    Side > 0,
    Perimeter is 4 * Side.

% Rectangle: area = length * width, perimeter = 2 * (length + width).
rectangle_area(Length, Width, Area) :-
    number(Length),
    number(Width),
    Length > 0,
    Width > 0,
    Area is Length * Width.

rectangle_perimeter(Length, Width, Perimeter) :-
    number(Length),
    number(Width),
    Length > 0,
    Width > 0,
    Perimeter is 2 * (Length + Width).

% Triangle: area and perimeter
triangle_perimeter(A, B, C, Perimeter) :-
    valid_triangle(A, B, C),
    Perimeter is A + B + C.

triangle_area(A, B, C, Area) :-
    valid_triangle(A, B, C),
    SemiPerimeter is (A + B + C) / 2,
    Area is sqrt(SemiPerimeter *
                 (SemiPerimeter - A) *
                 (SemiPerimeter - B) *
                 (SemiPerimeter - C)).

valid_triangle(A, B, C) :-
    number(A),
    number(B),
    number(C),
    A > 0,
    B > 0,
    C > 0,
    A + B > C,
    A + C > B,
    B + C > A.

% Task 2: Login system
% Dataset
user_password(sukainah, sk1234).
user_password(omar, oma123).
user_password(admin, admin333).

start_login :-
    writeln('===== LOGIN PAGE ====='),
    login_attempts(3).

login_attempts(AttemptsLeft) :-
    AttemptsLeft > 0,

    write('Enter username: '),
    flush_output,
    read_line_to_string(user_input, UsernameString),

    write('Enter password: '),
    flush_output,
    read_line_to_string(user_input, PasswordString),

    atom_string(Username, UsernameString),
    atom_string(Password, PasswordString),

    (   user_password(Username, Password)
    ->  writeln('Login Successful')
    ;   AttemptsLeft > 1
    ->  Remaining is AttemptsLeft - 1,
        writeln('Login Unsuccessful'),
        format('You have ~d attempt(s) remaining.~n', [Remaining]),
        login_attempts(Remaining)
    ;   writeln('Login Unsuccessful'),
        writeln('Sorry, you exceeded the maximum number of attempts, try again later.')
    ).
