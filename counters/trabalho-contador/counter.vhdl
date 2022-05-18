library ieee;
use ieee.std_logic_1164.all;

entity contador is
    port(
        clk: in bit;
        reset: in bit;
        q: out std_logic_vector(3 downto 0)
        );
end entity;

architecture cont of contador is
    component ffjk is
	port(
		j, k   : in  std_logic;
		clock  : in  std_logic;
		pr, cl : in  std_logic;
		q, nq  : out std_logic
	);
    end component;

    signal spr: std_logic := '1';
    signal sj, sk : std_logic_vector (3 downto 0);
    signal sq : std_logic_vector (3 downto 0);
    signal snq : std_logic_vector (3 downto 0);

begin 

    u0: ffjk port map(sj(0), sk(0), clk, spr, reset, sq(0), snq(0));
    u1: ffjk port map(sj(1), sk(1), clk, spr, reset, sq(1), snq(1));
    u2: ffjk port map(sj(2), sk(2), clk, reset, spr, sq(2), snq(2));
    u3: ffjk port map(sj(3), sk(3), clk, spr, reset, sq(3), snq(3));

    sj0 <= snq(3) or sq(2);
    sj1 <= ( snq(3) and sq(0) ) or ( sq(3) and sq(2) and snq(0) );
    sj2 <= ( sq(3) and snq(0) ) or ( snq(3) and sq(1) and sq(0) );
    sj3 <= ( sq(3) and sq(2) and snq(0) ) or ( snq(2) and sq(1) and sq(0) );

    sk0 <= snq(3) or sq(2) and snq(1);
    sk1 <= ( snq(3) and sq(0) ) or ( sq(3) and snq(2) ) or ( sq(3) and sq(0) );
    sk2 <= sq(3) and snq(1);
    sk3 <= ( sq(2) and snq(1) and sq(0) ) or ( snq(2) and snq(0) );

    q <= sq;

end architecture;
