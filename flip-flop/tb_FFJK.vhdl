library ieee;
use ieee.std_logic_1164.all;

entity tb_ffjk is
    -- entidade vazia
end tb_ffjk;

architecture test of tb_ffjk is
    constant CLK_PERIOD : time := 20 ns;

    component ffjk is
    port(
        j, k   : in  std_logic;
        clock  : in  std_logic;
        pr, cl : in  std_logic;
        q, nq  : out std_logic
    );
    end component;

    signal sj, sk, spr, scl, sq, snq : std_logic;
    signal sclk : std_logic := '1';

begin
    -- instancia de JK e port map
    u_ffjk : ffjk port map(sj, sk, sclk, spr, scl, sq, snq);
    -- process
    tbp : process
    begin
        -- passo 0
        spr <= '1';
        scl <= '0';
        sj  <= '0';
        sk  <= '0';
        wait for CLK_PERIOD;

        -- desativação de clear
        scl <= '1';
        -- alteração de J e K
        sj  <= '1';
        sk  <= '1';
        wait for CLK_PERIOD;

        -- passo 2
        sj  <= '0';
        sk  <= '1';
        wait for CLK_PERIOD;

        -- passo 3
        sj  <= '1';
        sk  <= '0';
        wait for CLK_PERIOD;

        wait;
    end process;

    -- process para Clock
    tbc : process
    begin
        sclk <= not(sclk);
        wait for CLK_PERIOD/2; 
    end process;

end architecture test;
