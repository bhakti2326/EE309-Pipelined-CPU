library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu is
	port (
	  opcode: in  std_logic_vector(3 downto 0);
	  op1: in  std_logic_vector(15 downto 0);
	  op2: in  std_logic_vector(15 downto 0);
	  result: out std_logic_vector(15 downto 0)
	);
end entity alu;

architecture beh of alu is
begin
	process(opcode, op1, op2)
   begin
      case opcode is
			when "0000" | "0001" =>
				result <= operand1;
			when "0010" | "0101" =>
				result <= std_logic_vector(unsigned(operand1) + unsigned(operand2));
			when "0011" =>
				result <= std_logic_vector(unsigned(operand1) - unsigned(operand2));
			when "0100" =>
				result <= std_logic_vector(resize(unsigned(operand1) * unsigned(operand2), 16));
			when "0110" =>
				result <= std_logic_vector(shift_left(unsigned(operand1), to_integer(unsigned(operand2(3 downto 0)))));
			when "0111" =>
				result <= operand1;
			when others =>
				 result <= (others => '0');
			end case;
    end process;
end architecture;