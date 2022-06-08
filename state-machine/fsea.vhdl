library ieee;
use ieee.std_logic_1164.all; 

entity fsea is
    port(
        pes  : in std_logic_vector(2 downto 0);
        saidas : out std_logic_vector(3 downto 0)
    );
end entity;

architecture caixa of fsea is

begin
    -- funçao de saída feita em sala
	saidas(3) <= pes(2) and pes(1);
	saidas(2) <= pes(2) and not(pes(1));
	saidas(1) <= pes(2) and not(pes(1));
	saidas(0) <= not(pes(2));
end;
