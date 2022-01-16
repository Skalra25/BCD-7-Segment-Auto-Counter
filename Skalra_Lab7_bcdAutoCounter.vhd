-- ------------------------------------------------------------
-- TITLE       : LAB 7
-- PROJECT     : Skalra_Lab7_bcdAutoCounter	
-- AUTHOR      : Sagal Singh Kalra
-- DATE        : 20/07/2021
-- DESCRIPTION : BCD to Seven segment 
--               using 4-Bit synchronous
--               up counter 
-- ------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Skalra_Lab7_bcdAutoCounter is
port (CLK, RST, en : in std_logic;
		Q   : out std_logic_vector (3 downto 0);
		HEX : out std_logic_vector( 0 to 6));
end Skalra_Lab7_bcdAutoCounter;

architecture struct of Skalra_Lab7_bcdAutoCounter	 is

component D_Flip_Flop is
port (D, clk, rst : in std_logic;
		 Q_A : out std_logic);
end component;

component BCD_Seven	is
port ( INP : in std_logic_vector (3 downto 0);
		 HEX : out std_logic_vector (0 to 6));
end component;

signal dff_out : std_logic_vector (3 downto 0);
signal dff_in : std_logic_vector (3 downto 0);
signal A_gate  : std_logic_vector (2 downto 0);


begin

A_gate(0) <= en and dff_out(0);
A_gate(1) <= A_gate(0) and dff_out(1);
A_gate(2) <= A_gate(1) and dff_out(2);

dff_in(0) <= en xor dff_out(0);
dff_in(1) <= A_gate(0) xor dff_out(1);
dff_in(2) <= A_gate(1) xor dff_out(2);
dff_in(3) <= A_gate(2) xor dff_out(3);

Q <= dff_out;

DFF0 : D_Flip_Flop port map (dff_in(0), CLK, RST, dff_out(0));
DFF1 : D_Flip_Flop port map (dff_in(1), CLK, RST, dff_out(1));
DFF2 : D_Flip_Flop port map (dff_in(2), CLK, RST, dff_out(2));
DFF3 : D_Flip_Flop port map (dff_in(3), CLK, RST, dff_out(3));

SevenSegment : BCD_Seven port map (dff_out, HEX);
end struct;
			

			
			
			
				



