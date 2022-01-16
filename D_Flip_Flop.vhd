-- ------------------------------------------------------------
-- TITLE       : LAB 7
-- PROJECT     : Skalra_Lab7_bcdAutoCounter
-- FILE        : D_Flip_Flop	
-- AUTHOR      : Sagal Singh Kalra
-- DATE        : 20/07/2021
-- DESCRIPTION : Implementation of  
--               D Flip-Flop
-- ------------------------------------------------------------

--Library Declarations
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--Entity and I/O declarations
entity D_Flip_Flop is
port (D, clk, rst : in std_logic;
		 Q_A : out std_logic);
end D_Flip_Flop;

--Behavioural Construct
architecture behavioral of D_Flip_Flop	is
begin
	process(clk, rst)
		begin
		if(rst = '0') then
			Q_A <= '0';
				elsif(clk = '1' and clk'EVENT) then 
					Q_A <= D;
		end if;
	end process;
end behavioral;
--End of code
			
