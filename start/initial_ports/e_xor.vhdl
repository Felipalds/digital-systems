entity e_xor is
    port (
        A: in bit;
        B: in bit;
        S: out bit
    );
end entity;

architecture behavior of e_xor is
    begin
        S <= A xor B;
end architecture;