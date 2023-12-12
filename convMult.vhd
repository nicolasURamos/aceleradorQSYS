library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity conv_module is
    Port (
        pixel_matrix : in  signed(8*3*3-1 downto 0); -- Matriz de pixels 3x3
        mask_matrix  : in  signed(8*3*3-1 downto 0); -- Matriz de máscara 3x3
        result       : out signed(15 downto 0)       -- Resultado de 16 bits
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

    -- Instâncias de multiplicadores
    signal mult_results : array(0 to 8) of signed(15 downto 0);
    signal temp_result  : signed(15 downto 0) := (others => '0');

begin
    -- Instanciando os multiplicadores e realizando as multiplicações
    gen_mult: for i in 0 to 8 generate
    begin
        mult_inst : combinational_multiplier 
            port map (
                A => pixel_matrix(8*(i+1)-1 downto 8*i),
                B => mask_matrix(8*(i+1)-1 downto 8*i),
                P => mult_results(i)
            );
    end generate gen_mult;

    -- Somando os resultados das multiplicações
    process(mult_results)
    begin
        temp_result <= (others => '0'); -- Resetar o resultado temporário
        for i in 0 to 8 loop
            temp_result <= temp_result + mult_results(i);
        end loop;
    end process;

    result <= temp_result;

end Behavioral;
