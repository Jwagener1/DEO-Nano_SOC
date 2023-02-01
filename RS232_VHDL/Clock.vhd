library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;



entity Clock is
	
	
	-- Genric is used in VHDL to allow this program to be reused by modules later and thus does not need to 
	-- be reprogramed rather called apon and its varibles and ports reallocated and mapped respectfully
	
	
	Generic( 
	
		Div_max : integer := 16;  -- Max divide value is an integer and is set to the defult value of 16
		Div_pos : integer := 1    -- Divide postion is where the trigger is set based on this variable
	
	
	);
	
	Port(
	
		CLK 				: in 	std_logic; -- 50 MHz system clock
		RST				: in 	std_logic; -- System reset active low
	
	--
		CLR				: in 	std_logic; -- Clear to value in the counter 
		EN					: in 	std_logic; -- counter enable
		Trig				: out std_logic  -- Trigger for when the counter is triggered and the desired clock rate is achieved
											     -- Pin is set high which will be used to enable when the system should progress
	);
	
end entity;


architecture Clock_logic of Clock is

		constant Div_Width : integer := integer(ceil(log2(real(Div_max)))); -- This is the legnth of the divider required to divide the clock by 
																								  -- the divide max value. eg for the value 16 its 4 bits
																								 
		signal Div_cnt     : unsigned(Div_Width-1 downto 0);					  -- Converting the divide length to a signal since 0 is counted as number																					 
																								  -- the Divide lenth needs to be one less.
																								 
		signal Cnt_flag    : std_logic;												  -- This flag is used to trigger the output when the the Div_Cnt matches
																								  -- the disred value of the Div_pos
																								  
																								  
																								  
																								  
begin

	divide_process : process(CLK)
	
	begin
	
		if (rising_edge(CLK)) then  				 -- check for rising edge of main system clock
			if (CLR = '1') then 						 -- check for the CLR pin. If pressed then set counter to 0
				Div_cnt <= (others => '0');		 -- using the 'others' is a convention used to set a signal to a set value without assigning every port a particular value	
			elsif (EN = '1') then 					 -- check if the enable pin is set
				if (Div_cnt = Div_max - 1) then   -- when the counter = divide value - 1 *because zero is a number.  
					Div_cnt <= (others => '0');	 -- the counter is reset.
				else										 -- when the values are not = 
					Div_cnt <= Div_cnt + 1;			 -- the Divide counter is incremented by 1
					
				end if;
			end if;
		end if;
	end process;
	
	
	-- The following code is used to implemnt the sampling for when the over sampling is used in uart protocall
	
	-- Since it is dificult to sample at the correct time with and sync the baud rates and clocks up it is often 
	-- easier to over sample the date ie instead of trying to sync one corret cloack pulse rather have 16 pulses 
	-- in the same frame and select a middle sample thus one is all most garinteed to sample at the correct data point
	
	
	

	Cnt_flag <= '1' when (Div_cnt = Div_pos) else '0'; -- Sets the count flag high when the count matches the divide position 
																		-- the Div_pos basically sets which of the samples we would like to use
																		-- ie if the Div_pos was set to 2 it would set the flag on the second pulse.
																		
																		
	trig_enable : process(CLK)
	begin 
		if (rising_edge(CLK)) then  				 -- check for rising edge of main system clock
			Trig <= EN and Cnt_flag;				 -- Performs the and operation with the count flag and the enable pin.
		end if;
	
	end process;

end architecture;
	