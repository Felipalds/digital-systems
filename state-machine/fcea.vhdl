library ieee;
use ieee.std_logic_1164.all; 

entity fcea is
    port(
	m : in std_logic_vector(1 downto 0);
        ea  : in std_logic_vector(2 downto 0);
        per  : out std_logic_vector(2 downto 0)
    );
end entity;

architecture caixa of fcea is
begin
    per(0) <= (not(ea(2)) and not(ea(0)) and m(1)) or (not(ea(2)) and ea(0) and m(0)) or (not(ea(2)) and ea(0) and not(m(1))); 
    per(1) <= (not(ea(1)) and ea(0) and m(1)) or (not(ea(2)) and not(ea(1)) and m(0)) or (not (ea(2)) and ea(0) and m(0)) or (ea(1) and not(ea(0)) and m(1)) or (not(ea(2)) and ea(1) and not(m(1)) and not(m(0))); 
    per(2) <= (not(ea(2)) and ea(1) and m(0)) or (not(ea(2)) and m(1) and m(0)) or (not(ea(2)) and ea(1) and ea(0) and m(1));
end;
