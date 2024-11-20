library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity glue_logic is
    Port ( SRESET : in  std_logic;
           BRESET : in  std_logic;
           DUART_DTACK : in  std_logic;
           ABUS : in  std_logic_vector (1 downto 0);
           AS : in  std_logic;
           CLK : in  std_logic;
           UDS : in  std_logic;
           LDS : in  std_logic;
           HALT : inout  std_logic;
           BERR : out  std_logic;
           LED : out  std_logic_vector (5 downto 0);
           ROMLOE : out  std_logic;
           ROMLCE : out  std_logic;
           ROMHOE : out  std_logic;
           ROMHCE : out  std_logic;
           RAMLCE : out  std_logic;
           RAMLCE2 : out  std_logic;
           RAMLOE : out  std_logic;
           RAMHCE : out  std_logic;
           RAMHCE2 : out  std_logic;
           RAMHOE : out  std_logic;
           RESET : out  std_logic;
           CPU_DTACK : out  std_logic;
           DUARTCS : out  std_logic);
end glue_logic;

architecture Behavioral of glue_logic is
begin

-------------------------------------------
-- reset logic and dtack

    RESET     <= '0' when (SRESET='0' or BRESET='0') else 'Z';
    HALT      <= '0' when (SRESET='0' or BRESET='0') else 'Z';
    BERR      <= 'Z';
    CPU_DTACK <= DUART_DTACK when (ABUS="10") else AS;

-------------------------------------------
-- chip enable signals

    ROMLCE  <= '0' when (ABUS="00" and AS='0' and LDS='0') else 'Z';
    ROMLOE  <= '0' when (ABUS="00" and AS='0' and LDS='0') else 'Z';

    ROMHCE  <= '0' when (ABUS="00" and AS='0' and UDS='0') else 'Z';
    ROMHOE  <= '0' when (ABUS="00" and AS='0' and UDS='0') else 'Z';

    RAMLOE  <= '0' when (ABUS="01" and AS='0' and LDS='0') else 'Z';
    RAMLCE  <= '0' when (ABUS="01" and AS='0' and LDS='0') else 'Z';
    RAMLCE2 <= 'Z' when (ABUS="01" and AS='0' and LDS='0') else '0';

    RAMHOE  <= '0' when (ABUS="01" and AS='0' and UDS='0') else 'Z';
    RAMHCE  <= '0' when (ABUS="01" and AS='0' and UDS='0') else 'Z';
    RAMHCE2 <= 'Z' when (ABUS="01" and AS='0' and UDS='0') else '0';

    DUARTCS <= 'Z' when (ABUS="10" and AS='0' and LDS='0') else '0';


-------------------------------------------
-- led's
    LED <= "Z0Z0Z0";    

end Behavioral;

