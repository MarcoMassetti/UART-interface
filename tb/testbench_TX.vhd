LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_TX IS
END testbench_TX;

ARCHITECTURE Behavior OF testbench_TX IS

    COMPONENT TX IS
        PORT (
            Clock, Reset, Te : IN STD_LOGIC;
            Din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            Tx : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL Din_t : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Reset_t, Te_t, Tx_t : STD_LOGIC;
    SIGNAL Clock_t : STD_LOGIC := '0';

BEGIN

    Clock_t <= NOT Clock_t AFTER 50 ns;

    test : PROCESS
    BEGIN
        Reset_t <= '0';
        Te_t <= '0';
        WAIT FOR 100 ns;

        Reset_t <= '1';

        WAIT FOR 400 ns;

        Din_t <= "10101010";
        Te_t <= '1';
        WAIT FOR 100 ns;

        Din_t <= "XXXXXXXX";
        Te_t <= '0';
        WAIT FOR 2 ms;

        WAIT;
    END PROCESS;

    DUT : TX PORT MAP(
        Clock => Clock_t, Reset => Reset_t, Te => Te_t, Din => Din_t, Tx => Tx_t);

END ARCHITECTURE;