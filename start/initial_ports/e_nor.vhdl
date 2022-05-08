entity e_nor is
    port (
        A: in bit;
        B: in bit;
        S: out bit
    );
end entity;

architecture behavior of e_nor is
    begin

        S <= A nor B;

end;