library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity conv_module is
    Port (
        clk         : in  std_logic;                  -- Sinal de clock
        start       : in  std_logic;                  -- Iniciar a operação
        pixel_matrix: in  signed(8*3*3-1 downto 0);  -- Matriz de pixels 3x3
        mask_matrix : in  signed(8*3*3-1 downto 0);  -- Matriz de máscara 3x3
        result      : out signed(15 downto 0);       -- Resultado de 16 bits
        done        : out std_logic                  -- Sinal de operação concluída
    );
end conv_module;

architecture Behavioral of conv_module is
    component combinational_multiplier
        Port (
            A : in  signed(7 downto 0);
            B : in  signed(7 downto 0);
            P : out signed(15 downto 0)
        );
    end component;

    -- Definindo um tipo para o array de resultados
    type mult_result_array is array (0 to 8) of signed(15 downto 0);

    signal mult_results : mult_result_array;
    signal temp_result  : signed(15 downto 0) := (others => '0');
    signal mult_done    : std_logic := '0';

begin
    -- Restante do seu código...
end Behavioral;
