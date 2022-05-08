-- Entity TESTBENCH
-- 10/12/2021

entity pl_2in_tb is
    -- lista vazia
end entity;

architecture tb of pl_2in_tb is
    -- subentidade
    -- vira component
    -- não existe reutilização de código
    component pl_or_2in is
        port(
            A: in bit;
            B: in bit;
            S: out bit
        );
    end component;

    component pl_and_2in is

        port(
            A: in bit;
            B: in bit;
            S: out bit
        );
    
    end component;

    -- sinais internos
    signal sA, sB: bit;
    signal sOR, sAND: bit;

begin
    -- instancia posicional
    -- mais comum
    -- nome : tipo > component
    -- unity port logic or 2 in positional
    -- map é uma função! portanto ordem importa >u<

    u_pl_or_2in_p : pl_or_2in port map(sA, sB, sOR);
    u_pl_and_2in_p : pl_and_2in port map(sA, sB, sAND);

    -- instancia explicita
    -- ordem não importa
    -- u_pl_or_2in_e : pl_or_2in port map(B => sB, S => sOR, A => sA);

    u_tb : process
    begin
        -- situaçao 0 da tabela verdade OR
        sA <= '0';
        sB <= '0';
        wait for 10 ns;

        -- situaçao 1 da tabela verdade OR
        sA <= '0';
        sB <= '1';
        wait for 10 ns;

        -- situaçao 2 da tabela verdade OR
        sA <= '1';
        sB <= '0';
        wait for 10 ns;

        -- situaçao 3 da tabela verdade OR
        sA <= '1';
        sB <= '1';
        wait for 10 ns;

        wait;
    end process;

end architecture;
