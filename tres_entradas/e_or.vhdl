entity e_or is
    port(
        A: in bit;
        B: in bit;
        C: in bit;
        S: out bit
    );
end entity;

architecture behavior of e_or is
    begin 
        S <= A or B or C;
end architecture;
