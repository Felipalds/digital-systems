entity e_and is
    port(
        A: in bit;
        B: in bit;
        S: out bit
    );
end entity;

architecture behavior of e_and is
    begin
        S <= A and B;
end;