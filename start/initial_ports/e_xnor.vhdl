entity e_xnor is
    port (
        A: in bit;
        B: in bit;
        S: out bit
    );
end entity;

architecture behavior of e_xnor is
    begin

        S <= A xnor B;

    end architecture;