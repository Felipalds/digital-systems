entity tablebench is
end entity;

architecture tb of tablebench is 
    -- compoenents
    component e_and is
        port (
            A: in bit;
            B: in bit;
            C: in bit;
            S: out bit
        );
    end component;

    component e_or is
        port(
            A: in bit;
            B: in bit;
            C: in bit;
            S: out bit
        );
    end component;
    -- signals

    signal sA, sB, sC: bit;
    signal sAND, sOR : bit;

    begin
        -- unities
        u_and: e_and port map(sA, sB, sC, sAND);
        u_or: e_or port map(sA, sB, sC, sOR);

        u_tb: process
        begin
            -- 0 0 0
            sA <= '0';
            sB <= '0';
            sC <= '0';
            wait for 10 ns;

            -- 0 0 1
            sA <= '0';
            sB <= '0';
            sC <= '1';
            wait for 10 ns;

            -- 0 1 0
            sA <= '0';
            sB <= '1';
            sC <= '0';
            wait for 10 ns;

            -- 0 1 1
            sA <= '0';
            sB <= '1';
            sC <= '1';
            wait for 10 ns;

            -- 1 0 0
            sA <= '1';
            sB <= '0';
            sC <= '0';
            wait for 10 ns;

            -- 1 0 1
            sA <= '1';
            sB <= '0';
            sC <= '1';
            wait for 10 ns;

            -- 1 1 0
            sA <= '1';
            sB <= '1';
            sC <= '0';
            wait for 10 ns;

            -- 1 1 1
            sA <= '1';
            sB <= '1';
            sC <= '1';
            wait for 10 ns;


        end process;

end architecture;