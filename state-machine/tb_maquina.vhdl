library ieee;
use ieee.std_logic_1164.all;

entity tb_maquina is
end entity;

architecture chocolate of tb_maquina is
	constant cicloClock : time := 20 ns;

component maquina is
    port(
	entradas : in std_logic_vector(1 downto 0);
        rst, clk : in std_logic;
	saidas : out std_logic_vector(3 downto 0)
    );
end component;

signal entradas : std_logic_vector(1 downto 0);
signal srst : std_logic := '1';
signal sclk : std_logic := '1';
signal saidas : std_logic_vector(3 downto 0);

begin
sclk <= not(sclk) after cicloClock / 2;
u_maquina : maquina port map(entradas, srst, sclk, saidas);
	tb_rst : process
	begin
        srst <= '0';
        wait for cicloClock;
        srst <= '1';
        wait;
	end process;

tb_maquinaa : process
	begin

	srst <= '0'; 
        wait for cicloClock;

        entradas <= "11"; 
        srst <= '1';
        wait for cicloClock;

        entradas <= "10";
        wait for cicloClock;

        entradas <= "01";
        wait for cicloClock;

        entradas <= "01";
        wait for cicloClock;

        entradas <= "10"; 
        wait for cicloClock*2;
        
        entradas <= "10";
        wait for cicloClock*4;
	wait;
    end process;
end architecture;
