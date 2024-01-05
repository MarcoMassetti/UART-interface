LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench_RX IS
END testbench_RX;

ARCHITECTURE arch OF testbench_RX IS

    COMPONENT RX IS
        PORT (
            Clock, Reset, Rx : IN STD_LOGIC;
            Dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            Dr : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL Dout_t : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL Clock_t, Reset_t : STD_LOGIC := '0';
    SIGNAL Dr_t, Rx_t : STD_LOGIC;

BEGIN

    Clock_t <= NOT Clock_t AFTER 50 ns;

    test : PROCESS
    BEGIN
        Reset_t <= '0';

        WAIT FOR 1 us;
        Reset_t <= '1';
        RX_t <= '1';

        WAIT FOR 104.17 us; --0 start bit
        RX_t <= '0';

        WAIT FOR 104.17 us; --1
        RX_t <= '0';

        WAIT FOR 104.17 us; --2
        RX_t <= '1';

        WAIT FOR 104.17 us; --3
        RX_t <= '0';

        WAIT FOR 104.17 us; --4
        RX_t <= '1';

        WAIT FOR 104.17 us; --5
        RX_t <= '0';

        WAIT FOR 104.17 us; --6
        RX_t <= '1';

        WAIT FOR 104.17 us; --7
        RX_t <= '0';

        WAIT FOR 104.17 us; --8
        RX_t <= '1';

        WAIT FOR 104.17 us; --9 stop bit
        RX_t <= '1';

        WAIT FOR 1 ms;

        WAIT;
    END PROCESS;

    DUT : RX PORT MAP(
        Clock => Clock_t, Reset => Reset_t, Rx => Rx_t, Dout => Dout_t, Dr => Dr_t);

END ARCHITECTURE;