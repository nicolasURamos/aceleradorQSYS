library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity combinational_multiplier is
    Port (
        A : in  STD_LOGIC_VECTOR(7 downto 0);
        B : in  STD_LOGIC_VECTOR(7 downto 0);
        P : out STD_LOGIC_VECTOR(15 downto 0)
    );
end combinational_multiplier;

architecture Behavioral of combinational_multiplier is
begin
    P <= std_logic_vector(signed(A) * signed(B));
end Behavioral;


--multiplicador combinacional que multiplica dois números de 8 bits, resultando em um número de 16 bits.
