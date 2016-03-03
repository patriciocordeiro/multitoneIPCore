library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith;
use ieee.numeric_std.all;
use ieee.math_real.all;
entity moduloCounter is
	generic
	(
		--M:natural:= 2;
		fo: integer:= 1000000;
		fc: integer:= 100000000;
		N: integer:= 10; -- acumulator precision
		LTP:integer:= 8  --Look up table precision

	);
	port
	(
		clk: in std_logic;
		cnt: out std_logic_vector(N-1 downto 0);
		cntTrunc: out std_logic_vector(LTP-2 downto 0);
		MM: out unsigned(0 to N-1);
		mflag: out  std_logic;
		output : out  integer range -8192 to 8191;
		sinef : out  integer range -8192 to 8191;

		--sign_cnt: out integer range 0 to 2**N-1;
		firstIteration : out std_logic
	
	);
	end entity;
	architecture rtl of moduloCounter is
	
	constant temp:	integer range 0 to fc:= fc/fo;
	constant M: integer range 0 to (2**N)-1:= 2**N/temp+1;
	--constant Mtrunc: integer range 0 to 300:=(M*(2**LTP))/2**N;
	constant Mtrunc: integer range 0 to 300:=1;
	constant hN: unsigned(0 to N-1):= to_unsigned(2**(N-1), N);
	constant oneQtSize: unsigned (0 to LTP-1 ):= to_unsigned(2**(LTP-2),LTP); --one quater sine wave size
	constant acummToLutStep: integer range 0 to 2**(N-LTP+1):=2**(N-LTP+1); -- accumulator to lut step
	constant limit: unsigned(0 to N-1):=(to_unsigned(2**(N-1) ,N) + to_unsigned(2*acummToLutStep,N))/Mtrunc -1;
		
	
	signal cnt_temp: unsigned(0 to N-1):=to_unsigned(0,N);
	signal lutAddr: integer range 0 to 2**LTP-1;
	signal sine :integer range -8192 to 8191;
	signal sign_cnt_temp: integer range 0 to 2**N-1:=0;
	signal lutAddrM: integer range 0 to  2**LTP-1;
	signal fullLutAddr: integer range 0 to  2**N-1;
	--signal	sign_cnt: integer range 0 to 2**N-1:=0; 
	--signal c2tmp: unsigned (0 to LTP):=to_unsigned(0,N);

	
	begin
		process(clk, cnt_temp)
	 
	   variable flag: std_logic:='0';
	   variable firstIter: std_logic:='1'; -- signaling  the first iteration 
	   variable lutAddrPrev: integer range 0 to 2**LTP-1;
	  
		begin
		
		if rising_edge(clk) then
			----------------------------------------------------------------
			if (cnt_temp=0) then
			
				flag := '0'; --counter will increment 
					if (sign_cnt_temp < 2) then
					  sign_cnt_temp <= sign_cnt_temp + 1; --increment till first two positive sine quadrant
					else 
					  sign_cnt_temp <= 1;--restart the counter to one
					end if ;
			end if;
		 ----------------------------------------------------------------
		 ----$$$$$$$------------------------------------------------------------	
			if (cnt_temp>=0 AND (cnt_temp < limit) AND flag='0') then
			  --count while counter is greater than zero, limit not reached and counter increment
				--@@@@-------------------------------------------------
				if (firstIter = '0') then 
					--prevent the repetition of zero value
					cnt_temp<= cnt_temp + to_unsigned(acummToLutStep, N);
						--fullLutAddr<= to_integer(cnt_temp);
					firstIter :='1';
				else
					cnt_temp <= cnt_temp + 1;
					--fullLutAddr<= to_integer(cnt_temp);
				
					lutAddr <= to_integer(cnt_temp(0 to LTP-2));
				end if;
			   --@@@@--------------------------------------------------
			else
				flag:='1'; --  counter will decrement
					if (firstIter = '1') then 
					--prevent the repetition of zero value by jumping one step
						cnt_temp<= cnt_temp - to_unsigned(acummToLutStep, N);
						firstIter := '0'; 
							--fullLutAddr<= to_integer(cnt_temp);
					else
						cnt_temp <= cnt_temp - 1;
						lutAddr <= to_integer(cnt_temp(0 to LTP-2)); -- lookup table truncated counter
							--fullLutAddr<= to_integer(cnt_temp);
					end if;
			end if;
		----$$$$$$$------------------------------------------------------------	
				------------------------------
				if(lutAddrPrev/=lutAddr OR lutAddr=0) then
					lutAddrM <= lutAddr*Mtrunc;
					
				else
					lutAddrPrev := lutAddr;
				end if;
				------------------------------
				
				--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
				--full counter
				if (fullLutAddr<(2**LTP-1)-M) then 
					fullLutAddr <= fullLutAddr + M;
				else 
					fullLutAddr <= 0;
				end if;
				--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
				
		end if; --end rising_edge
		cnt <= std_logic_vector(cnt_temp);
		--cntTrunc <= std_logic_vector(cnt_temp(to_unsigned(N-LTP)));
		cntTrunc <= std_logic_vector(cnt_temp(0 to LTP-2));
		MM <= to_unsigned(M, N);
		mflag <= flag;
		--sign_cnt<= sign_cnt_temp;
		firstIteration <=firstIter;
  	end process;
  	
  	process(clk, lutAddrM)
		begin
	   if rising_edge(clk) then
			case lutAddrM is
when 0 => sine <= 0;
 when 1 => sine <= 201;
 when 2 => sine <= 402;
 when 3 => sine <= 603;
 when 4 => sine <= 803;
 when 5 => sine <= 1003;
 when 6 => sine <= 1202;
 when 7 => sine <= 1400;
 when 8 => sine <= 1598;
 when 9 => sine <= 1795;
 when 10 => sine <= 1990;
 when 11 => sine <= 2185;
 when 12 => sine <= 2378;
 when 13 => sine <= 2569;
 when 14 => sine <= 2759;
 when 15 => sine <= 2948;
 when 16 => sine <= 3135;
 when 17 => sine <= 3319;
 when 18 => sine <= 3502;
 when 19 => sine <= 3683;
 when 20 => sine <= 3861;
 when 21 => sine <= 4037;
 when 22 => sine <= 4211;
 when 23 => sine <= 4382;
 when 24 => sine <= 4551;
 when 25 => sine <= 4716;
 when 26 => sine <= 4879;
 when 27 => sine <= 5039;
 when 28 => sine <= 5196;
 when 29 => sine <= 5350;
 when 30 => sine <= 5501;
 when 31 => sine <= 5648;
 when 32 => sine <= 5792;
 when 33 => sine <= 5932;
 when 34 => sine <= 6069;
 when 35 => sine <= 6202;
 when 36 => sine <= 6332;
 when 37 => sine <= 6457;
 when 38 => sine <= 6579;
 when 39 => sine <= 6697;
 when 40 => sine <= 6811;
 when 41 => sine <= 6920;
 when 42 => sine <= 7026;
 when 43 => sine <= 7127;
 when 44 => sine <= 7224;
 when 45 => sine <= 7316;
 when 46 => sine <= 7405;
 when 47 => sine <= 7488;
 when 48 => sine <= 7567;
 when 49 => sine <= 7642;
 when 50 => sine <= 7712;
 when 51 => sine <= 7778;
 when 52 => sine <= 7838;
 when 53 => sine <= 7894;
 when 54 => sine <= 7946;
 when 55 => sine <= 7992;
 when 56 => sine <= 8034;
 when 57 => sine <= 8070;
 when 58 => sine <= 8102;
 when 59 => sine <= 8129;
 when 60 => sine <= 8152;
 when 61 => sine <= 8169;
 when 62 => sine <= 8181;
 when 63 => sine <= 8189;
 when 64 => sine <= 8191;
 when others => sine <=0;
			end case;
		if (sign_cnt_temp < 2) then
        output <= sine;
    else
        output <= -sine;
    end if;
  
    end if;
	end process;

process(clk, fullLutAddr)
begin
	if rising_edge(clk) then
	 case fullLutAddr is
	 when 0 => sinef <= 0;
	 when 1 => sinef <= 201;
	 when 2 => sinef <= 402;
	 when 3 => sinef <= 603;
	 when 4 => sinef <= 803;
	 when 5 => sinef <= 1003;
	 when 6 => sinef <= 1202;
	 when 7 => sinef <= 1400;
	 when 8 => sinef <= 1598;
	 when 9 => sinef <= 1795;
	 when 10 => sinef <= 1990;
	 when 11 => sinef <= 2185;
	 when 12 => sinef <= 2378;
	 when 13 => sinef <= 2569;
	 when 14 => sinef <= 2759;
	 when 15 => sinef <= 2948;
	 when 16 => sinef <= 3135;
	 when 17 => sinef <= 3319;
	 when 18 => sinef <= 3502;
	 when 19 => sinef <= 3683;
	 when 20 => sinef <= 3861;
	 when 21 => sinef <= 4037;
	 when 22 => sinef <= 4211;
	 when 23 => sinef <= 4382;
	 when 24 => sinef <= 4551;
	 when 25 => sinef <= 4716;
	 when 26 => sinef <= 4879;
	 when 27 => sinef <= 5039;
	 when 28 => sinef <= 5196;
	 when 29 => sinef <= 5350;
	 when 30 => sinef <= 5501;
	 when 31 => sinef <= 5648;
	 when 32 => sinef <= 5792;
	 when 33 => sinef <= 5932;
	 when 34 => sinef <= 6069;
	 when 35 => sinef <= 6202;
	 when 36 => sinef <= 6332;
	 when 37 => sinef <= 6457;
	 when 38 => sinef <= 6579;
	 when 39 => sinef <= 6697;
	 when 40 => sinef <= 6811;
	 when 41 => sinef <= 6920;
	 when 42 => sinef <= 7026;
	 when 43 => sinef <= 7127;
	 when 44 => sinef <= 7224;
	 when 45 => sinef <= 7316;
	 when 46 => sinef <= 7405;
	 when 47 => sinef <= 7488;
	 when 48 => sinef <= 7567;
	 when 49 => sinef <= 7642;
	 when 50 => sinef <= 7712;
	 when 51 => sinef <= 7778;
	 when 52 => sinef <= 7838;
	 when 53 => sinef <= 7894;
	 when 54 => sinef <= 7946;
	 when 55 => sinef <= 7992;
	 when 56 => sinef <= 8034;
	 when 57 => sinef <= 8070;
	 when 58 => sinef <= 8102;
	 when 59 => sinef <= 8129;
	 when 60 => sinef <= 8152;
	 when 61 => sinef <= 8169;
	 when 62 => sinef <= 8181;
	 when 63 => sinef <= 8189;
	 when 64 => sinef <= 8191;
	 when 65 => sinef <= 8189;
	 when 66 => sinef <= 8181;
	 when 67 => sinef <= 8169;
	 when 68 => sinef <= 8152;
	 when 69 => sinef <= 8129;
	 when 70 => sinef <= 8102;
	 when 71 => sinef <= 8070;
	 when 72 => sinef <= 8034;
	 when 73 => sinef <= 7992;
	 when 74 => sinef <= 7946;
	 when 75 => sinef <= 7894;
	 when 76 => sinef <= 7838;
	 when 77 => sinef <= 7778;
	 when 78 => sinef <= 7712;
	 when 79 => sinef <= 7642;
	 when 80 => sinef <= 7567;
	 when 81 => sinef <= 7488;
	 when 82 => sinef <= 7405;
	 when 83 => sinef <= 7316;
	 when 84 => sinef <= 7224;
	 when 85 => sinef <= 7127;
	 when 86 => sinef <= 7026;
	 when 87 => sinef <= 6920;
	 when 88 => sinef <= 6811;
	 when 89 => sinef <= 6697;
	 when 90 => sinef <= 6579;
	 when 91 => sinef <= 6457;
	 when 92 => sinef <= 6332;
	 when 93 => sinef <= 6202;
	 when 94 => sinef <= 6069;
	 when 95 => sinef <= 5932;
	 when 96 => sinef <= 5792;
	 when 97 => sinef <= 5648;
	 when 98 => sinef <= 5501;
	 when 99 => sinef <= 5350;
	 when 100 => sinef <= 5196;
	 when 101 => sinef <= 5039;
	 when 102 => sinef <= 4879;
	 when 103 => sinef <= 4716;
	 when 104 => sinef <= 4551;
	 when 105 => sinef <= 4382;
	 when 106 => sinef <= 4211;
	 when 107 => sinef <= 4037;
	 when 108 => sinef <= 3861;
	 when 109 => sinef <= 3683;
	 when 110 => sinef <= 3502;
	 when 111 => sinef <= 3319;
	 when 112 => sinef <= 3135;
	 when 113 => sinef <= 2948;
	 when 114 => sinef <= 2759;
	 when 115 => sinef <= 2569;
	 when 116 => sinef <= 2378;
	 when 117 => sinef <= 2185;
	 when 118 => sinef <= 1990;
	 when 119 => sinef <= 1795;
	 when 120 => sinef <= 1598;
	 when 121 => sinef <= 1400;
	 when 122 => sinef <= 1202;
	 when 123 => sinef <= 1003;
	 when 124 => sinef <= 803;
	 when 125 => sinef <= 603;
	 when 126 => sinef <= 402;
	 when 127 => sinef <= 201;
	 when 128 => sinef <= 0;
	 when 129 => sinef <= -201;
	 when 130 => sinef <= -402;
	 when 131 => sinef <= -603;
	 when 132 => sinef <= -803;
	 when 133 => sinef <= -1003;
	 when 134 => sinef <= -1202;
	 when 135 => sinef <= -1400;
	 when 136 => sinef <= -1598;
	 when 137 => sinef <= -1795;
	 when 138 => sinef <= -1990;
	 when 139 => sinef <= -2185;
	 when 140 => sinef <= -2378;
	 when 141 => sinef <= -2569;
	 when 142 => sinef <= -2759;
	 when 143 => sinef <= -2948;
	 when 144 => sinef <= -3135;
	 when 145 => sinef <= -3319;
	 when 146 => sinef <= -3502;
	 when 147 => sinef <= -3683;
	 when 148 => sinef <= -3861;
	 when 149 => sinef <= -4037;
	 when 150 => sinef <= -4211;
	 when 151 => sinef <= -4382;
	 when 152 => sinef <= -4551;
	 when 153 => sinef <= -4716;
	 when 154 => sinef <= -4879;
	 when 155 => sinef <= -5039;
	 when 156 => sinef <= -5196;
	 when 157 => sinef <= -5350;
	 when 158 => sinef <= -5501;
	 when 159 => sinef <= -5648;
	 when 160 => sinef <= -5792;
	 when 161 => sinef <= -5932;
	 when 162 => sinef <= -6069;
	 when 163 => sinef <= -6202;
	 when 164 => sinef <= -6332;
	 when 165 => sinef <= -6457;
	 when 166 => sinef <= -6579;
	 when 167 => sinef <= -6697;
	 when 168 => sinef <= -6811;
	 when 169 => sinef <= -6920;
	 when 170 => sinef <= -7026;
	 when 171 => sinef <= -7127;
	 when 172 => sinef <= -7224;
	 when 173 => sinef <= -7316;
	 when 174 => sinef <= -7405;
	 when 175 => sinef <= -7488;
	 when 176 => sinef <= -7567;
	 when 177 => sinef <= -7642;
	 when 178 => sinef <= -7712;
	 when 179 => sinef <= -7778;
	 when 180 => sinef <= -7838;
	 when 181 => sinef <= -7894;
	 when 182 => sinef <= -7946;
	 when 183 => sinef <= -7992;
	 when 184 => sinef <= -8034;
	 when 185 => sinef <= -8070;
	 when 186 => sinef <= -8102;
	 when 187 => sinef <= -8129;
	 when 188 => sinef <= -8152;
	 when 189 => sinef <= -8169;
	 when 190 => sinef <= -8181;
	 when 191 => sinef <= -8189;
	 when 192 => sinef <= -8191;
	 when 193 => sinef <= -8189;
	 when 194 => sinef <= -8181;
	 when 195 => sinef <= -8169;
	 when 196 => sinef <= -8152;
	 when 197 => sinef <= -8129;
	 when 198 => sinef <= -8102;
	 when 199 => sinef <= -8070;
	 when 200 => sinef <= -8034;
	 when 201 => sinef <= -7992;
	 when 202 => sinef <= -7946;
	 when 203 => sinef <= -7894;
	 when 204 => sinef <= -7838;
	 when 205 => sinef <= -7778;
	 when 206 => sinef <= -7712;
	 when 207 => sinef <= -7642;
	 when 208 => sinef <= -7567;
	 when 209 => sinef <= -7488;
	 when 210 => sinef <= -7405;
	 when 211 => sinef <= -7316;
	 when 212 => sinef <= -7224;
	 when 213 => sinef <= -7127;
	 when 214 => sinef <= -7026;
	 when 215 => sinef <= -6920;
	 when 216 => sinef <= -6811;
	 when 217 => sinef <= -6697;
	 when 218 => sinef <= -6579;
	 when 219 => sinef <= -6457;
	 when 220 => sinef <= -6332;
	 when 221 => sinef <= -6202;
	 when 222 => sinef <= -6069;
	 when 223 => sinef <= -5932;
	 when 224 => sinef <= -5792;
	 when 225 => sinef <= -5648;
	 when 226 => sinef <= -5501;
	 when 227 => sinef <= -5350;
	 when 228 => sinef <= -5196;
	 when 229 => sinef <= -5039;
	 when 230 => sinef <= -4879;
	 when 231 => sinef <= -4716;
	 when 232 => sinef <= -4551;
	 when 233 => sinef <= -4382;
	 when 234 => sinef <= -4211;
	 when 235 => sinef <= -4037;
	 when 236 => sinef <= -3861;
	 when 237 => sinef <= -3683;
	 when 238 => sinef <= -3502;
	 when 239 => sinef <= -3319;
	 when 240 => sinef <= -3135;
	 when 241 => sinef <= -2948;
	 when 242 => sinef <= -2759;
	 when 243 => sinef <= -2569;
	 when 244 => sinef <= -2378;
	 when 245 => sinef <= -2185;
	 when 246 => sinef <= -1990;
	 when 247 => sinef <= -1795;
	 when 248 => sinef <= -1598;
	 when 249 => sinef <= -1400;
	 when 250 => sinef <= -1202;
	 when 251 => sinef <= -1003;
	 when 252 => sinef <= -803;
	 when 253 => sinef <= -603;
	 when 254 => sinef <= -402;
	 when 255 => sinef <= -201;
	 when others => sinef <=0;
	end case;
	end if;
end process;
	
	
end rtl;

