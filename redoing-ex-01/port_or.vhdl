entity port_or is

    port(
        A:in bit;
        B:in bit;
        S: out bit
    );

end entity;

architecture behavior of port_or is

    begin
        -- or
        S <= A or B;

        -- and
        S <= A and B;

        S <= not ( A and B);

        S <= nand, nor, xnor;
end;