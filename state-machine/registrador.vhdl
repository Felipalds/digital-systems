library ieee;
use ieee.std_logic_1164.all; 

entity registrador is
    port(
        d     : in std_logic_vector(2 downto 0);
        cl, clk : in std_logic;
        s    : out std_logic_vector(2 downto 0)
    );
end entity;

architecture storage of registrador is
    component ffd is
        port(
            d      : in std_logic;
            clk    : in std_logic;
            pr, cl : in std_logic;
            q, nq  : out std_logic
        );
    end component;

begin
       u0: ffd port map(d(0),clk, '1', cl, s(0));
       u1: ffd port map(d(1),clk, '1', cl, s(1));
       u2: ffd port map(d(2),clk, '1', cl, s(2));
end architecture;
