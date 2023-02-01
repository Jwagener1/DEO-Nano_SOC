-- Library Declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity
entity Bessel is
	port(
		Math_input 	: in 	std_logic_vector(7 downto 0);
		Math_output : out std_logic_vector(7 downto 0)
	);
end Bessel;
	
-- Architecture
architecture math_function of Bessel is
	signal 	math_in				  	:unsigned(7 downto 0);	
	signal 	math_out					:unsigned(7 downto 0);	 	
	
begin

	process (math_in) is
	begin
		math_in 		<= unsigned(Math_input);
		math_out		<= math_in;	--	shift received 8 bit value to right (divide by 2)
		Math_output <= std_logic_vector(math_out);
	end process;
end math_function;	