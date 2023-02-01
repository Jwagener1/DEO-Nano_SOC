library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.ALL;


entity Prac is

	Generic (
	
		clock_frequency : integer := 50e6;   --System clock frequency (50MHz)
		
		Baud_rate		 : integer := 115200; -- Disred baud rate for uart communication
		
		sample 			 : integer := 16 -- Oversample rate 
		
		
	
	
	);
	
	Port(
	
		CLK 						: in 	std_logic; -- 50 MHz system clock
		RST						: in 	std_logic; -- System reset active low
		
		Tx							: out	std_logic; -- Uart Transmit Pin
		Rx							: in  std_logic; -- Uart Recieve Pin
		STE                  : out std_logic_vector(2 downto 0); -- LED on FPGA to display data
		
		Sample_clk				: out std_logic; -- Sample clock output
	
		LED						: out std_logic_vector(7 downto 0); -- LED on FPGA to display data
		
		Tx_Flag        		: out std_logic -- UART Tx ready flag (Set high when system is ready to transmitt)	
	
	);

end entity;




architecture Prac1 of Prac is

	constant sys_clock_div  : integer := integer(real(clock_frequency)/real(sample*Baud_rate)); 			-- System clock divide value
	constant uart_div			: integer := integer(real(clock_frequency)/real(sys_clock_div*Baud_rate)); -- uart clock divide value
	
	
	
	signal   Main_clk_Trigger :std_logic; -- Downsample trigger for clock for system

		
	signal	Rx_clk_Trigger   :std_logic; -- Uart reciver clock trigger pin
	signal 	Tx_clk_Trigger   :std_logic; -- Uart transmitter clock trigger pin
	
	signal  	DIN_VLD			  :std_logic; -- Data in valid indicator
	
	signal 	rx_bit_count     : unsigned(2 downto 0); -- reciever bit count 8-bits 
	signal 	rx_temp          : std_logic_vector(7 downto 0); -- stores the recieved data
	signal   rx_idle          : std_logic; --Rx idle signal set high when in idele state
	signal   rx_rec           : std_logic; --Rx rec signal set high when in recieving data state
	signal   rx_stop          : std_logic; --Rx stop signal set high when recption is complete and transmission stops
	
	
	signal   tx_ready         : std_logic; -- Tx ready pin set high when system is ready to transmit
	signal   tx_clk_clear     : std_logic; -- Controlls the count to set it to a knowen value of 0
	signal   tx_cnt_en        : std_logic; -- Enables the counter when bits are being sent
	signal   tx_mode 			  : std_logic_vector(1 downto 0); -- COntrolls which mode the transmitter is in 
	signal 	tx_bit_count     : unsigned(2 downto 0); -- transmitter bit count 8-bits
	signal 	tx_data          : std_logic_vector(7 downto 0);  --singal to hold the data that is to be transmitted
	
	
	type tx_state is (t_idle , t_start , t_send,t_sync, t_stop); --states for the transmssion finite sate machine
	
	signal   tx_PS				  :tx_state;  -- Tx previous state
	signal   tx_NS				  :tx_state;  -- Tx next state
	
	type rx_state is (r_idle , r_start , r_rec, r_stop);    --states for the reception finite sate machine
	
	signal   rx_PS				  :rx_state;  -- Rx previous state
	signal   rx_NS				  :rx_state;  -- Rx next state
	
	signal 	input			     :std_logic_vector(7 downto 0);	
	signal 	output			  :std_logic_vector(7 downto 0);	 
	signal   count            :STD_LOGIC_VECTOR (1 downto 0) := X"00";
	
	

begin 


-- Main Clock Divider Program---------------------------

	main_clock : entity work.Clock -- Calling the clock program from the sepearte Clock.vhd file
	
	generic map(
		Div_max => sys_clock_div, 		-- Setting the divide value to that calculated with the sample rate desired 
		Div_pos => sys_clock_div -1  	-- Setting the trigger postion for the clock trigger
		
	)
	
	
	port map (
	
		CLK 	  => CLK, 					-- mapping the system clock to that of the clock in the clock.vhd file 
		RST 	  => RST, 					-- mapping the reset pin to that of the rest pin in the clock.vhd file 
		CLR	  => '0',
		EN 	  => '1',  					-- Setting enable always high thus the main clock for the system always runs.
		
		Trig => Main_clk_Trigger	-- Trigger when sample and clock are corrected mapped to the main system clk trigger
		
	);	
-----------------------------------------------------	


	
-- Uart Reciver Clock Program------------------------

	rx_clock : entity work.Clock  -- Calling the clock program from the sepearte Clock.vhd file
	
	generic map(
		Div_max => uart_div,		-- Setting the divide value to that calculated with the sample rate desired 
		Div_pos => 8  				-- Setting the trigger postion for the clock trigger ie 8th pulse

 		
	)
	port map(
	
		CLK 	  => 	CLK,					-- mapping the system clock to that of the clock in the clock.vhd file 
		RST 	  => 	RST, 					-- mapping the reset pin to that of the rest pin in the clock.vhd file 
		CLR	  => 	rx_idle ,				-- mapping the clear count value to Rx_idle state
		EN 	  => 	Main_clk_Trigger,  -- mapping the enable pin to main system clock trigger 
		
		Trig =>  Rx_clk_Trigger    -- mapping the recive sample trigger to Rx_clk_trigger
		);
		
------------------------------------------------------



-- Uart Transmitter Clock Program------------------------

	tx_clock : entity work.Clock  -- Calling the clock program from the sepearte Clock.vhd file
	
	generic map(
		Div_max => uart_div,		-- Setting the divide value to that calculated with the sample rate desired 
		Div_pos => 1  				-- Setting the trigger postion for the clock trigger ie 8th pulse

 		
	)
	port map(
	
		CLK 	  => 	CLK,					 -- mapping the system clock to that of the clock in the clock.vhd file 
		RST 	  => 	RST, 					 -- mapping the reset pin to that of the rest pin in the clock.vhd file 
		CLR	  => 	tx_clk_clear,		 -- mapping the clear count value to clock clear pin the transmitter 
		EN 	  => 	Main_clk_Trigger,  -- mapping the enable pin to main system clock trigger 
		
		Trig =>  Tx_clk_Trigger     -- mapping the recive sample trigger to Rx_clk_trigger
		);
		
------------------------------------------------------------


-- Uart Bit Counters----------------------------------------


	uart_bit_counter:process(CLK)
	begin
	
		if (rising_edge(CLK)) then  		-- check for rising edge of clock 
			if (RST = '0') then 		 										-- check for reset pin 
				tx_bit_count <= (others => '0'); 						-- set the counter for transmitted bits to 0
				rx_bit_count <= (others => '0');    					-- set the counter for recieved  bits to 0
				
			elsif (Rx_clk_Trigger = '1' AND Rx_rec = '1') then 	-- Check if the clock trigger and the reciving data bits are set 
				
				if (rx_bit_count = "111") then 							-- check if 8 bits have been recived 
					rx_bit_count <= (others => '0'); 					-- if 8 bits were counted the counter is set back to 0
				else 
					rx_bit_count <= rx_bit_count + 1; 					-- if less than 8 bits increment counter
				end if;
				
			elsif (Tx_clk_Trigger = '1' AND tx_cnt_en = '1') then -- check for the transmitt clock trigger and transmitter counter is enabled 
				if (tx_bit_count = "111") then 							--check if 8 bits have been transmitted 
					tx_bit_count <= (others => '0'); 					-- if 8 bits were counted the counter is set back to 0
				else 
					tx_bit_count <= tx_bit_count + 1; 					-- if less than 8 bits increment counter
				end if;
			end if;
		end if;
	
	end process; 



------------------------------------------------------------

-- RX Data Input Register-----------------------------------

	uart_recieve :process(CLK)
	begin
		if (rising_edge(CLK)) then  									-- check for rising edge of clock 
			if (Rx_clk_Trigger = '1' AND rx_rec = '1') then 	-- Check if the clock trigger and the reciving data bits are set
				rx_temp(to_integer(rx_bit_count)) <= RX;			-- Accepts the input from rx and places in the register at the position of the counter
			end if;
		end if;
	end process;






-- Uart Transmitter ----------------------------------------

	uart_transmitt :process(CLK)
	begin
		if (rising_edge(CLK)) then  									-- check for rising edge of clock
			if (RST = '0') then 											-- check the reset pin
				Tx <= '1';													-- keep the transmit line high 
			else
				case tx_mode is 											-- switch case to select which operation should be performed 
				
					when "01" =>        -- Mode to trigger the start bit
						Tx <= '0';		  -- When the Tx line is sent low this indicates the start of a transmission 
			
					when "10" =>		  -- Bit transmission mode 
						Tx <= tx_data(to_integer(tx_bit_count)); -- selects which bit to assign Tx pin based on the tx_bit_count
						
					when others => 
                  Tx <= '1';			--Catch all statemnt that sets the line into a non active state 
				end case;
			end if;
		end if;
	end process;



------------------------------------------------------------

--State Shifter----------------------------------------------
	state_shifter :process (CLK)
	begin
		if (rising_edge(CLK)) then  					-- check for rising edge of clock
			if (RST = '0') then 							-- check the reset pin
				tx_PS <= t_idle;							-- If the rest pin is pressed then sets staes to idle
				rx_PS <= r_idle;
	
			else 
				tx_PS <= tx_NS;							-- Avances the states for both the recieve and transmission 
				rx_PS <= rx_NS;							-- finite state machines
	
			end if;
		end if;
	
	end process;
------------------------------------------------------------


-- Reciever Finite State Machine----------------------------

	rec_fsm  :process (rx_PS, RX, Rx_clk_Trigger, rx_bit_count)
	begin
		case rx_PS is
			-----------------  IDLE
			when r_idle =>           
				rx_idle  <= '1';      -- set the idle bit indicator high and the rest low
				rx_stop  <= '0';
				rx_rec   <= '0';
				
				
				
				if (RX = '0') then    -- check if the RX line has been driven low indicating that start of a data transmission 
					rx_NS <= r_start;  -- move to start state on next clock cycle
				else
					rx_NS <= r_idle;   -- loop back into idle for another clock cycle
				end if;
				
			----------------- START
			when r_start =>
				rx_idle  <= '0';      -- set all the indicators low
				rx_stop  <= '0';
				rx_rec   <= '0';
				
				
				
				if (Rx_clk_Trigger = '1') then -- Check for the next RX_clock pulse
					rx_NS <= r_rec;			    -- Move to recieve data state
				else
					rx_NS <= r_start;			    -- If no clock hold in current state for one more main cycle
				
				end if;
				
				
			----------------- Recieve
			when r_rec =>
				rx_idle  <= '0';      -- set the recieve indicator high and the rest low 
				rx_stop  <= '0';
				rx_rec   <= '1';
				
				
				
				if (Rx_clk_Trigger = '1' and rx_bit_count = "111" ) then -- check RX_clock trigger and counter
					rx_NS <= r_stop;  -- Move to stop state on next trigger and the counter = 8 bits
				else
					rx_NS <= r_rec;	-- Loop in current state
				end if;
				
				
			----------------- Stop
			when r_stop =>
				rx_idle  <= '0';      -- set the stop indicator high and the rest low 
				rx_stop  <= '1';
				rx_rec   <= '0';
				
				
				if (Rx_clk_Trigger = '1' AND RX ='1') then -- check for next trigger
					rx_NS <= r_idle;		-- Move to idle sate
				else
					rx_NS <= r_stop; --loop in current state 
				end if;
			----------------- Catch All state
			when others =>
				rx_idle  <= '0';      -- set all the indicators low
				rx_stop  <= '0';
				rx_rec   <= '0';
				
				rx_NS <= r_idle;		-- Move to idle sate
				
		end case;		
	
	end process;
-------------------------------------------------------------

-- Transmitter Finite State Machine--------------------------

	transmission_fsm  :process (tx_PS, Tx_clk_Trigger, tx_bit_count)
	begin
	
		case tx_PS is 
			-----------------  IDLE
			when t_idle =>
		
				tx_ready 	 <= '1';  	--	Sets the transmitter ready flag high 
				tx_mode  	 <= "00"; 	-- Sets the mode to keep the TX line high
				tx_cnt_en 	 <= '0';		--	Keeps the enable of the counter off
				tx_clk_clear <= '1';    -- Keeps the count value at 0 of the transmitter clock
			
				if (DIN_VLD = '1') then -- Check to see if the data valid flag has been set 
					tx_NS <= t_sync;		-- If flag is set progress to Sync state
				else
					tx_Ns <= t_idle;		-- If check fails loop back into idle state
				end if;	
			-----------------  SYNC
			when t_sync =>
				
				tx_ready 	 <= '0';   -- Sets the transmitter ready flag low
				tx_mode  	 <= "00";  -- Set the mode to keep the TX line high while the transmitter syncs with clock
				tx_cnt_en 	 <= '0';	  -- Keeps the transmitter bit counter set at 0
				tx_clk_clear <= '0';	  -- Starts the Transmitter clock by not resetting the counter value
				
				if (Tx_clk_Trigger = '1') then --Check for transmitter clock pulse 
					tx_NS <= t_start;				 --If there is a pulse progress to start state 
				else
					tx_NS <= t_sync;				 --If no pulse loop in t_sync till there is a pulse
				end if;	
			-----------------  START
			when t_start =>
			
				tx_ready 	 <= '0';   -- Sets the transmitter ready flag low
				tx_mode  	 <= "01";  -- Set the mode to send the TX line low which indates the start of a transmission
				tx_cnt_en 	 <= '0';	  -- Keeps the transmitter bit counter set at 0
				tx_clk_clear <= '0';	  -- Starts the Transmitter clock by not resetting the counter value
			
				if (Tx_clk_Trigger = '1') then --Check for transmitter clock pulse 
					tx_NS <= t_send;				 --If there is a pulse progress to data send state 
				else
					tx_NS <= t_start;				 --If no pulse loop in t_start till there is a pulse
				end if; 
			-----------------  DATA SEND
			when t_send =>
		
				tx_ready 	 <= '0';   -- Sets the transmitter ready flag low
				tx_mode  	 <= "10";  -- Set the mode to send the data on the TX line
				tx_cnt_en 	 <= '1';	  -- Enables the bit counter for the transmitter
				tx_clk_clear <= '0';	  -- Starts the Transmitter clock by not resetting the counter value
			
				if (Tx_clk_Trigger = '1' and tx_bit_count = "111" ) then -- check TX_clock trigger and counter
					tx_NS <= t_stop;  -- Move to stop state on next trigger and the counter = 8 bits
				else
					tx_NS <= t_send;	-- Loop in current state if not triggered
				end if;
			-----------------  STOP
			when t_stop =>
		
				tx_ready 	 <= '1';   -- Sets the transmitter ready flag High
				tx_mode  	 <= "00";  -- Set the mode to pull TX line high indicating the end of a transmission 
				tx_cnt_en 	 <= '0';	  -- Enables the bit counter for the transmitter
				tx_clk_clear <= '0';	  -- Starts the Transmitter clock by not resetting the counter value
				
				if (DIN_VLD = '1') then -- Check if the data valid pin is set high 
					tx_NS <= t_sync;		-- If high go to sync state to start sending the next bit
				elsif (Tx_clk_Trigger = '1') then -- Check for clock pulse 
				   tx_NS <= t_idle;		--If pulse is high go to idle state
				else
					tx_NS <= t_stop;		-- Loop in current state untill clock pulse or data valid flags are high 
            end if;
			-----------------  CATCH ALL
			when others =>
		
				tx_ready 	 <= '0';   -- Sets the transmitter ready flag High
				tx_mode  	 <= "00";  -- Set the mode to pull TX line high indicating the end of a transmission 
				tx_cnt_en 	 <= '0';	  -- Enables the bit counter for the transmitter
				tx_clk_clear <= '0';	  -- Starts the Transmitter clock by not resetting the counter value
				
				tx_NS <= t_idle;		  --Go to idle state
	
			end case;
	end process;

-------------------------------------------------------------
--Indicator Program

	led_indic :process(CLK)
	begin
		if (rx_bit_count(0) = '1') then 
			STE(0) <= '1';
		else
			STE(0) <= '0';
		end if;
		
		
		if (rx_bit_count(1) = '1') then 
			STE(1) <= '1';
		else
			STE(1) <= '0';
		end if;
		
		if (rx_bit_count(2) = '1') then 
			STE(2) <= '1';
		else
			STE(2) <= '0';
		end if;
		
		if (Rx_clk_Trigger = '1') then 
			Sample_clk <= '1';
		else
			Sample_clk <= '0';
		end if;
	end process;


---------------------------------------------------------



-- Math Progeam Implementation------------------------

	Math_Program : entity work.Bessel  -- Calling the clock program from the sepearte Clock.vhd file
	
	port map(
	
		Math_input	  => 	input,					 -- mapping the system clock to that of the clock in the clock.vhd file 
		Math_output   =>  output
		);

------------------------------------------------------------
--Send Result  Program--------------------------------------------
 repeat :process(CLK,rx_stop)
 begin
	if (rx_stop = '1' and Rx_clk_Trigger = '1') then 
		input <= rx_temp;
		tx_data <= output;
		DIN_VLD       <= '1';
	else
		DIN_VLD 		  <= '0';
	end if;
 end process;
------------------------------------------------------------

--Output Controlls------------------------------------------
	LED <= rx_temp;
	Tx_Flag <= tx_ready;
------------------------------------------------------------
end Prac1;