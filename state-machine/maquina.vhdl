library ieee;
use ieee.std_logic_1164.all; 

entity maquina is
    port(
	entradas : in std_logic_vector(1 downto 0);
        rst, clk : in std_logic;
        saidas : out std_logic_vector(3 downto 0)
    );
end entity;

architecture machine of maquina is

component fcea is
    port(
	m : in std_logic_vector(1 downto 0);
        ea  : in std_logic_vector(2 downto 0);
        per  : out std_logic_vector(2 downto 0)
    );
end component;

component registrador is
    port(
        d     : in std_logic_vector(2 downto 0);
        cl, clk : in std_logic;
        s    : out std_logic_vector(2 downto 0)
    );
end component;

component fsea is
    port(
        pes  : in std_logic_vector(2 downto 0);
        saidas : out std_logic_vector(3 downto 0)
    );
end component;

signal sreset : std_logic;
signal sre, ser : std_logic_vector(2 downto 0);
signal ssaidas : std_logic_vector(3 downto 0) := "0001";
	

begin 
    sreset <= rst;
    u_fcea : fcea port map (entradas, sre, ser);
    u_reg : registrador port map(ser, sreset, clk, sre);
    u_fsea : fsea port map(sre, ssaidas);
    saidas <= ssaidas;
end architecture;








