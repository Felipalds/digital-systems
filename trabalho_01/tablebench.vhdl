entity tablebench is

end;

architecture tb of tablebench is
    component e_or is
        port(
            A: in bit;
            B: in bit;
            S: out bit
        );
    end component;

    component e_and is
        port(
            A: in bit;
            B: in bit;
            S: out bit
        );
    end component;

    component e_nand is
        port(
            A: in bit;
            B: in bit;
            S: out bit
        );
    end component;

    signal sA, sB: bit;
    signal sOR, sAND, sNAND: bit;


    begin

        u_or : e_or port map(sA, sB, sOR);
        u_and: e_and port map(sA, sB, sAND);
        u_nand: e_nand port map(sA, sB, sNAND);

        u_tb : process
        begin

            -- 0 0
            sA <= '0';
            sB <= '0';
            wait for 10 ns;

            -- 0 1
            sA <= '0';
            sB <= '1';
            wait for 10 ns;

            -- 1 0
            sA <= '1';
            sB <= '0';
            wait for 10 ns;

            -- 1 1
            sA <= '1';
            sB <= '1';
            wait for 10 ns;
        end process;
end architecture;