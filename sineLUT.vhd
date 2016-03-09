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
 when to_unsigned(0, LTP) => sinef <= 0;
 when to_unsigned(1, LTP) => sinef <= 201;
 when to_unsigned(2, LTP) => sinef <= 402;
 when to_unsigned(3, LTP) => sinef <= 603;
 when to_unsigned(4, LTP) => sinef <= 803;
 when to_unsigned(5, LTP) => sinef <= 1003;
 when to_unsigned(6, LTP) => sinef <= 1202;
 when to_unsigned(7, LTP) => sinef <= 1400;
 when to_unsigned(8, LTP) => sinef <= 1598;
 when to_unsigned(9, LTP) => sinef <= 1795;
 when to_unsigned(10, LTP) => sinef <= 1990;
 when to_unsigned(11, LTP) => sinef <= 2185;
 when to_unsigned(12, LTP) => sinef <= 2378;
 when to_unsigned(13, LTP) => sinef <= 2569;
 when to_unsigned(14, LTP) => sinef <= 2759;
 when to_unsigned(15, LTP) => sinef <= 2948;
 when to_unsigned(16, LTP) => sinef <= 3135;
 when to_unsigned(17, LTP) => sinef <= 3319;
 when to_unsigned(18, LTP) => sinef <= 3502;
 when to_unsigned(19, LTP) => sinef <= 3683;
 when to_unsigned(20, LTP) => sinef <= 3861;
 when to_unsigned(21, LTP) => sinef <= 4037;
 when to_unsigned(22, LTP) => sinef <= 4211;
 when to_unsigned(23, LTP) => sinef <= 4382;
 when to_unsigned(24, LTP) => sinef <= 4551;
 when to_unsigned(25, LTP) => sinef <= 4716;
 when to_unsigned(26, LTP) => sinef <= 4879;
 when to_unsigned(27, LTP) => sinef <= 5039;
 when to_unsigned(28, LTP) => sinef <= 5196;
 when to_unsigned(29, LTP) => sinef <= 5350;
 when to_unsigned(30, LTP) => sinef <= 5501;
 when to_unsigned(31, LTP) => sinef <= 5648;
 when to_unsigned(32, LTP) => sinef <= 5792;
 when to_unsigned(33, LTP) => sinef <= 5932;
 when to_unsigned(34, LTP) => sinef <= 6069;
 when to_unsigned(35, LTP) => sinef <= 6202;
 when to_unsigned(36, LTP) => sinef <= 6332;
 when to_unsigned(37, LTP) => sinef <= 6457;
 when to_unsigned(38, LTP) => sinef <= 6579;
 when to_unsigned(39, LTP) => sinef <= 6697;
 when to_unsigned(40, LTP) => sinef <= 6811;
 when to_unsigned(41, LTP) => sinef <= 6920;
 when to_unsigned(42, LTP) => sinef <= 7026;
 when to_unsigned(43, LTP) => sinef <= 7127;
 when to_unsigned(44, LTP) => sinef <= 7224;
 when to_unsigned(45, LTP) => sinef <= 7316;
 when to_unsigned(46, LTP) => sinef <= 7405;
 when to_unsigned(47, LTP) => sinef <= 7488;
 when to_unsigned(48, LTP) => sinef <= 7567;
 when to_unsigned(49, LTP) => sinef <= 7642;
 when to_unsigned(50, LTP) => sinef <= 7712;
 when to_unsigned(51, LTP) => sinef <= 7778;
 when to_unsigned(52, LTP) => sinef <= 7838;
 when to_unsigned(53, LTP) => sinef <= 7894;
 when to_unsigned(54, LTP) => sinef <= 7946;
 when to_unsigned(55, LTP) => sinef <= 7992;
 when to_unsigned(56, LTP) => sinef <= 8034;
 when to_unsigned(57, LTP) => sinef <= 8070;
 when to_unsigned(58, LTP) => sinef <= 8102;
 when to_unsigned(59, LTP) => sinef <= 8129;
 when to_unsigned(60, LTP) => sinef <= 8152;
 when to_unsigned(61, LTP) => sinef <= 8169;
 when to_unsigned(62, LTP) => sinef <= 8181;
 when to_unsigned(63, LTP) => sinef <= 8189;
 when to_unsigned(64, LTP) => sinef <= 8191;
 when to_unsigned(65, LTP) => sinef <= 8189;
 when to_unsigned(66, LTP) => sinef <= 8181;
 when to_unsigned(67, LTP) => sinef <= 8169;
 when to_unsigned(68, LTP) => sinef <= 8152;
 when to_unsigned(69, LTP) => sinef <= 8129;
 when to_unsigned(70, LTP) => sinef <= 8102;
 when to_unsigned(71, LTP) => sinef <= 8070;
 when to_unsigned(72, LTP) => sinef <= 8034;
 when to_unsigned(73, LTP) => sinef <= 7992;
 when to_unsigned(74, LTP) => sinef <= 7946;
 when to_unsigned(75, LTP) => sinef <= 7894;
 when to_unsigned(76, LTP) => sinef <= 7838;
 when to_unsigned(77, LTP) => sinef <= 7778;
 when to_unsigned(78, LTP) => sinef <= 7712;
 when to_unsigned(79, LTP) => sinef <= 7642;
 when to_unsigned(80, LTP) => sinef <= 7567;
 when to_unsigned(81, LTP) => sinef <= 7488;
 when to_unsigned(82, LTP) => sinef <= 7405;
 when to_unsigned(83, LTP) => sinef <= 7316;
 when to_unsigned(84, LTP) => sinef <= 7224;
 when to_unsigned(85, LTP) => sinef <= 7127;
 when to_unsigned(86, LTP) => sinef <= 7026;
 when to_unsigned(87, LTP) => sinef <= 6920;
 when to_unsigned(88, LTP) => sinef <= 6811;
 when to_unsigned(89, LTP) => sinef <= 6697;
 when to_unsigned(90, LTP) => sinef <= 6579;
 when to_unsigned(91, LTP) => sinef <= 6457;
 when to_unsigned(92, LTP) => sinef <= 6332;
 when to_unsigned(93, LTP) => sinef <= 6202;
 when to_unsigned(94, LTP) => sinef <= 6069;
 when to_unsigned(95, LTP) => sinef <= 5932;
 when to_unsigned(96, LTP) => sinef <= 5792;
 when to_unsigned(97, LTP) => sinef <= 5648;
 when to_unsigned(98, LTP) => sinef <= 5501;
 when to_unsigned(99, LTP) => sinef <= 5350;
 when to_unsigned(100, LTP) => sinef <= 5196;
 when to_unsigned(101, LTP) => sinef <= 5039;
 when to_unsigned(102, LTP) => sinef <= 4879;
 when to_unsigned(103, LTP) => sinef <= 4716;
 when to_unsigned(104, LTP) => sinef <= 4551;
 when to_unsigned(105, LTP) => sinef <= 4382;
 when to_unsigned(106, LTP) => sinef <= 4211;
 when to_unsigned(107, LTP) => sinef <= 4037;
 when to_unsigned(108, LTP) => sinef <= 3861;
 when to_unsigned(109, LTP) => sinef <= 3683;
 when to_unsigned(110, LTP) => sinef <= 3502;
 when to_unsigned(111, LTP) => sinef <= 3319;
 when to_unsigned(112, LTP) => sinef <= 3135;
 when to_unsigned(113, LTP) => sinef <= 2948;
 when to_unsigned(114, LTP) => sinef <= 2759;
 when to_unsigned(115, LTP) => sinef <= 2569;
 when to_unsigned(116, LTP) => sinef <= 2378;
 when to_unsigned(117, LTP) => sinef <= 2185;
 when to_unsigned(118, LTP) => sinef <= 1990;
 when to_unsigned(119, LTP) => sinef <= 1795;
 when to_unsigned(120, LTP) => sinef <= 1598;
 when to_unsigned(121, LTP) => sinef <= 1400;
 when to_unsigned(122, LTP) => sinef <= 1202;
 when to_unsigned(123, LTP) => sinef <= 1003;
 when to_unsigned(124, LTP) => sinef <= 803;
 when to_unsigned(125, LTP) => sinef <= 603;
 when to_unsigned(126, LTP) => sinef <= 402;
 when to_unsigned(127, LTP) => sinef <= 201;
 when to_unsigned(128, LTP) => sinef <= 0;
 when to_unsigned(129, LTP) => sinef <= -201;
 when to_unsigned(130, LTP) => sinef <= -402;
 when to_unsigned(131, LTP) => sinef <= -603;
 when to_unsigned(132, LTP) => sinef <= -803;
 when to_unsigned(133, LTP) => sinef <= -1003;
 when to_unsigned(134, LTP) => sinef <= -1202;
 when to_unsigned(135, LTP) => sinef <= -1400;
 when to_unsigned(136, LTP) => sinef <= -1598;
 when to_unsigned(137, LTP) => sinef <= -1795;
 when to_unsigned(138, LTP) => sinef <= -1990;
 when to_unsigned(139, LTP) => sinef <= -2185;
 when to_unsigned(140, LTP) => sinef <= -2378;
 when to_unsigned(141, LTP) => sinef <= -2569;
 when to_unsigned(142, LTP) => sinef <= -2759;
 when to_unsigned(143, LTP) => sinef <= -2948;
 when to_unsigned(144, LTP) => sinef <= -3135;
 when to_unsigned(145, LTP) => sinef <= -3319;
 when to_unsigned(146, LTP) => sinef <= -3502;
 when to_unsigned(147, LTP) => sinef <= -3683;
 when to_unsigned(148, LTP) => sinef <= -3861;
 when to_unsigned(149, LTP) => sinef <= -4037;
 when to_unsigned(150, LTP) => sinef <= -4211;
 when to_unsigned(151, LTP) => sinef <= -4382;
 when to_unsigned(152, LTP) => sinef <= -4551;
 when to_unsigned(153, LTP) => sinef <= -4716;
 when to_unsigned(154, LTP) => sinef <= -4879;
 when to_unsigned(155, LTP) => sinef <= -5039;
 when to_unsigned(156, LTP) => sinef <= -5196;
 when to_unsigned(157, LTP) => sinef <= -5350;
 when to_unsigned(158, LTP) => sinef <= -5501;
 when to_unsigned(159, LTP) => sinef <= -5648;
 when to_unsigned(160, LTP) => sinef <= -5792;
 when to_unsigned(161, LTP) => sinef <= -5932;
 when to_unsigned(162, LTP) => sinef <= -6069;
 when to_unsigned(163, LTP) => sinef <= -6202;
 when to_unsigned(164, LTP) => sinef <= -6332;
 when to_unsigned(165, LTP) => sinef <= -6457;
 when to_unsigned(166, LTP) => sinef <= -6579;
 when to_unsigned(167, LTP) => sinef <= -6697;
 when to_unsigned(168, LTP) => sinef <= -6811;
 when to_unsigned(169, LTP) => sinef <= -6920;
 when to_unsigned(170, LTP) => sinef <= -7026;
 when to_unsigned(171, LTP) => sinef <= -7127;
 when to_unsigned(172, LTP) => sinef <= -7224;
 when to_unsigned(173, LTP) => sinef <= -7316;
 when to_unsigned(174, LTP) => sinef <= -7405;
 when to_unsigned(175, LTP) => sinef <= -7488;
 when to_unsigned(176, LTP) => sinef <= -7567;
 when to_unsigned(177, LTP) => sinef <= -7642;
 when to_unsigned(178, LTP) => sinef <= -7712;
 when to_unsigned(179, LTP) => sinef <= -7778;
 when to_unsigned(180, LTP) => sinef <= -7838;
 when to_unsigned(181, LTP) => sinef <= -7894;
 when to_unsigned(182, LTP) => sinef <= -7946;
 when to_unsigned(183, LTP) => sinef <= -7992;
 when to_unsigned(184, LTP) => sinef <= -8034;
 when to_unsigned(185, LTP) => sinef <= -8070;
 when to_unsigned(186, LTP) => sinef <= -8102;
 when to_unsigned(187, LTP) => sinef <= -8129;
 when to_unsigned(188, LTP) => sinef <= -8152;
 when to_unsigned(189, LTP) => sinef <= -8169;
 when to_unsigned(190, LTP) => sinef <= -8181;
 when to_unsigned(191, LTP) => sinef <= -8189;
 when to_unsigned(192, LTP) => sinef <= -8191;
 when to_unsigned(193, LTP) => sinef <= -8189;
 when to_unsigned(194, LTP) => sinef <= -8181;
 when to_unsigned(195, LTP) => sinef <= -8169;
 when to_unsigned(196, LTP) => sinef <= -8152;
 when to_unsigned(197, LTP) => sinef <= -8129;
 when to_unsigned(198, LTP) => sinef <= -8102;
 when to_unsigned(199, LTP) => sinef <= -8070;
 when to_unsigned(200, LTP) => sinef <= -8034;
 when to_unsigned(201, LTP) => sinef <= -7992;
 when to_unsigned(202, LTP) => sinef <= -7946;
 when to_unsigned(203, LTP) => sinef <= -7894;
 when to_unsigned(204, LTP) => sinef <= -7838;
 when to_unsigned(205, LTP) => sinef <= -7778;
 when to_unsigned(206, LTP) => sinef <= -7712;
 when to_unsigned(207, LTP) => sinef <= -7642;
 when to_unsigned(208, LTP) => sinef <= -7567;
 when to_unsigned(209, LTP) => sinef <= -7488;
 when to_unsigned(210, LTP) => sinef <= -7405;
 when to_unsigned(211, LTP) => sinef <= -7316;
 when to_unsigned(212, LTP) => sinef <= -7224;
 when to_unsigned(213, LTP) => sinef <= -7127;
 when to_unsigned(214, LTP) => sinef <= -7026;
 when to_unsigned(215, LTP) => sinef <= -6920;
 when to_unsigned(216, LTP) => sinef <= -6811;
 when to_unsigned(217, LTP) => sinef <= -6697;
 when to_unsigned(218, LTP) => sinef <= -6579;
 when to_unsigned(219, LTP) => sinef <= -6457;
 when to_unsigned(220, LTP) => sinef <= -6332;
 when to_unsigned(221, LTP) => sinef <= -6202;
 when to_unsigned(222, LTP) => sinef <= -6069;
 when to_unsigned(223, LTP) => sinef <= -5932;
 when to_unsigned(224, LTP) => sinef <= -5792;
 when to_unsigned(225, LTP) => sinef <= -5648;
 when to_unsigned(226, LTP) => sinef <= -5501;
 when to_unsigned(227, LTP) => sinef <= -5350;
 when to_unsigned(228, LTP) => sinef <= -5196;
 when to_unsigned(229, LTP) => sinef <= -5039;
 when to_unsigned(230, LTP) => sinef <= -4879;
 when to_unsigned(231, LTP) => sinef <= -4716;
 when to_unsigned(232, LTP) => sinef <= -4551;
 when to_unsigned(233, LTP) => sinef <= -4382;
 when to_unsigned(234, LTP) => sinef <= -4211;
 when to_unsigned(235, LTP) => sinef <= -4037;
 when to_unsigned(236, LTP) => sinef <= -3861;
 when to_unsigned(237, LTP) => sinef <= -3683;
 when to_unsigned(238, LTP) => sinef <= -3502;
 when to_unsigned(239, LTP) => sinef <= -3319;
 when to_unsigned(240, LTP) => sinef <= -3135;
 when to_unsigned(241, LTP) => sinef <= -2948;
 when to_unsigned(242, LTP) => sinef <= -2759;
 when to_unsigned(243, LTP) => sinef <= -2569;
 when to_unsigned(244, LTP) => sinef <= -2378;
 when to_unsigned(245, LTP) => sinef <= -2185;
 when to_unsigned(246, LTP) => sinef <= -1990;
 when to_unsigned(247, LTP) => sinef <= -1795;
 when to_unsigned(248, LTP) => sinef <= -1598;
 when to_unsigned(249, LTP) => sinef <= -1400;
 when to_unsigned(250, LTP) => sinef <= -1202;
 when to_unsigned(251, LTP) => sinef <= -1003;
 when to_unsigned(252, LTP) => sinef <= -803;
 when to_unsigned(253, LTP) => sinef <= -603;
 when to_unsigned(254, LTP) => sinef <= -402;
 when to_unsigned(255, LTP) => sinef <= -201;
 when others => sine <=0;
end case;
end if;
end process;
end rtl;
