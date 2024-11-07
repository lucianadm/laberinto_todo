library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity contador_180_grados is

	generic
	(
		bits : natural := 13
	);

	port
	(
		clk		  : in std_logic;
		reset	  : in std_logic;
		enable	  : in std_logic;
		max_reached: out std_logic;
		q		  : out std_logic_vector(bits-1 downto 0)
	);

end entity;

architecture rtl of contador_180_grados is
signal q_int: std_logic_vector(bits-1 downto 0);
begin

	process (clk,reset,enable)
		variable   cnt		   : integer range 0 to 8191;--4095;
	begin
		if reset = '1' or enable = '0' then
				-- Reset the counter to 0
				cnt := 0;

		elsif (rising_edge(clk)) and enable = '1' then
				-- Increment the counter if counting is enabled			   
				cnt := cnt + 1;

			end if;

		-- Output the current count
		q_int <= std_logic_vector(to_unsigned(cnt, bits));
		q<=q_int;
		max_reached<=q_int(0) and q_int(1) and q_int(2) and q_int(3) and q_int(4) and q_int(5) and q_int(6) and q_int(7) and q_int(8) and q_int(9) and q_int(10) and q_int(11)  and q_int(12);
	end process;

end rtl;
