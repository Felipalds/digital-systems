entity e_nand is
        port(
            A: in bit;
            B: in bit;
            S: out bit
        );
end entity;

architecture behavior of e_nand is
    begin

        S <= A nand B;
end;