library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sineLUT is
port
(
clk : in   std_logic;
phaseInc : integer range 0 to 255;
sine : out  integer range -8192 to 8191 
);
end entity;
architecture rtl of sineLUT is 
begin
process(clk)
begin
if rising_edge(clk) then
case phaseInc is
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
 when 65 => sine <= 8189;
 when 66 => sine <= 8181;
 when 67 => sine <= 8169;
 when 68 => sine <= 8152;
 when 69 => sine <= 8129;
 when 70 => sine <= 8102;
 when 71 => sine <= 8070;
 when 72 => sine <= 8034;
 when 73 => sine <= 7992;
 when 74 => sine <= 7946;
 when 75 => sine <= 7894;
 when 76 => sine <= 7838;
 when 77 => sine <= 7778;
 when 78 => sine <= 7712;
 when 79 => sine <= 7642;
 when 80 => sine <= 7567;
 when 81 => sine <= 7488;
 when 82 => sine <= 7405;
 when 83 => sine <= 7316;
 when 84 => sine <= 7224;
 when 85 => sine <= 7127;
 when 86 => sine <= 7026;
 when 87 => sine <= 6920;
 when 88 => sine <= 6811;
 when 89 => sine <= 6697;
 when 90 => sine <= 6579;
 when 91 => sine <= 6457;
 when 92 => sine <= 6332;
 when 93 => sine <= 6202;
 when 94 => sine <= 6069;
 when 95 => sine <= 5932;
 when 96 => sine <= 5792;
 when 97 => sine <= 5648;
 when 98 => sine <= 5501;
 when 99 => sine <= 5350;
 when 100 => sine <= 5196;
 when 101 => sine <= 5039;
 when 102 => sine <= 4879;
 when 103 => sine <= 4716;
 when 104 => sine <= 4551;
 when 105 => sine <= 4382;
 when 106 => sine <= 4211;
 when 107 => sine <= 4037;
 when 108 => sine <= 3861;
 when 109 => sine <= 3683;
 when 110 => sine <= 3502;
 when 111 => sine <= 3319;
 when 112 => sine <= 3135;
 when 113 => sine <= 2948;
 when 114 => sine <= 2759;
 when 115 => sine <= 2569;
 when 116 => sine <= 2378;
 when 117 => sine <= 2185;
 when 118 => sine <= 1990;
 when 119 => sine <= 1795;
 when 120 => sine <= 1598;
 when 121 => sine <= 1400;
 when 122 => sine <= 1202;
 when 123 => sine <= 1003;
 when 124 => sine <= 803;
 when 125 => sine <= 603;
 when 126 => sine <= 402;
 when 127 => sine <= 201;
 when 128 => sine <= 0;
 when 129 => sine <= -201;
 when 130 => sine <= -402;
 when 131 => sine <= -603;
 when 132 => sine <= -803;
 when 133 => sine <= -1003;
 when 134 => sine <= -1202;
 when 135 => sine <= -1400;
 when 136 => sine <= -1598;
 when 137 => sine <= -1795;
 when 138 => sine <= -1990;
 when 139 => sine <= -2185;
 when 140 => sine <= -2378;
 when 141 => sine <= -2569;
 when 142 => sine <= -2759;
 when 143 => sine <= -2948;
 when 144 => sine <= -3135;
 when 145 => sine <= -3319;
 when 146 => sine <= -3502;
 when 147 => sine <= -3683;
 when 148 => sine <= -3861;
 when 149 => sine <= -4037;
 when 150 => sine <= -4211;
 when 151 => sine <= -4382;
 when 152 => sine <= -4551;
 when 153 => sine <= -4716;
 when 154 => sine <= -4879;
 when 155 => sine <= -5039;
 when 156 => sine <= -5196;
 when 157 => sine <= -5350;
 when 158 => sine <= -5501;
 when 159 => sine <= -5648;
 when 160 => sine <= -5792;
 when 161 => sine <= -5932;
 when 162 => sine <= -6069;
 when 163 => sine <= -6202;
 when 164 => sine <= -6332;
 when 165 => sine <= -6457;
 when 166 => sine <= -6579;
 when 167 => sine <= -6697;
 when 168 => sine <= -6811;
 when 169 => sine <= -6920;
 when 170 => sine <= -7026;
 when 171 => sine <= -7127;
 when 172 => sine <= -7224;
 when 173 => sine <= -7316;
 when 174 => sine <= -7405;
 when 175 => sine <= -7488;
 when 176 => sine <= -7567;
 when 177 => sine <= -7642;
 when 178 => sine <= -7712;
 when 179 => sine <= -7778;
 when 180 => sine <= -7838;
 when 181 => sine <= -7894;
 when 182 => sine <= -7946;
 when 183 => sine <= -7992;
 when 184 => sine <= -8034;
 when 185 => sine <= -8070;
 when 186 => sine <= -8102;
 when 187 => sine <= -8129;
 when 188 => sine <= -8152;
 when 189 => sine <= -8169;
 when 190 => sine <= -8181;
 when 191 => sine <= -8189;
 when 192 => sine <= -8191;
 when 193 => sine <= -8189;
 when 194 => sine <= -8181;
 when 195 => sine <= -8169;
 when 196 => sine <= -8152;
 when 197 => sine <= -8129;
 when 198 => sine <= -8102;
 when 199 => sine <= -8070;
 when 200 => sine <= -8034;
 when 201 => sine <= -7992;
 when 202 => sine <= -7946;
 when 203 => sine <= -7894;
 when 204 => sine <= -7838;
 when 205 => sine <= -7778;
 when 206 => sine <= -7712;
 when 207 => sine <= -7642;
 when 208 => sine <= -7567;
 when 209 => sine <= -7488;
 when 210 => sine <= -7405;
 when 211 => sine <= -7316;
 when 212 => sine <= -7224;
 when 213 => sine <= -7127;
 when 214 => sine <= -7026;
 when 215 => sine <= -6920;
 when 216 => sine <= -6811;
 when 217 => sine <= -6697;
 when 218 => sine <= -6579;
 when 219 => sine <= -6457;
 when 220 => sine <= -6332;
 when 221 => sine <= -6202;
 when 222 => sine <= -6069;
 when 223 => sine <= -5932;
 when 224 => sine <= -5792;
 when 225 => sine <= -5648;
 when 226 => sine <= -5501;
 when 227 => sine <= -5350;
 when 228 => sine <= -5196;
 when 229 => sine <= -5039;
 when 230 => sine <= -4879;
 when 231 => sine <= -4716;
 when 232 => sine <= -4551;
 when 233 => sine <= -4382;
 when 234 => sine <= -4211;
 when 235 => sine <= -4037;
 when 236 => sine <= -3861;
 when 237 => sine <= -3683;
 when 238 => sine <= -3502;
 when 239 => sine <= -3319;
 when 240 => sine <= -3135;
 when 241 => sine <= -2948;
 when 242 => sine <= -2759;
 when 243 => sine <= -2569;
 when 244 => sine <= -2378;
 when 245 => sine <= -2185;
 when 246 => sine <= -1990;
 when 247 => sine <= -1795;
 when 248 => sine <= -1598;
 when 249 => sine <= -1400;
 when 250 => sine <= -1202;
 when 251 => sine <= -1003;
 when 252 => sine <= -803;
 when 253 => sine <= -603;
 when 254 => sine <= -402;
 when 255 => sine <= -201;
 when others => sine <=0;
end case;
end if;
end process;
end rtl;
