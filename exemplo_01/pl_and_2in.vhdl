-- Entidade AND
-- AND de duas entradas
-- 03/12/2021

-- Interface
entity pl_and_2in is

    port(
        A: in bit;
        B: in bit;
        S: out bit
    );

end entity pl_and_2in;

-- Comportamento

architecture behavior of pl_and_2in is
    -- Subentidades
    -- Sinais internos
begin
    -- Expressão Booleana: S = A + B
    S <= A and B;


end architecture;