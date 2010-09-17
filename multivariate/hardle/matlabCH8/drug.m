%  example MFCA on burt table
%  A Three Way Contingency table: 
%      DRUG consumption in a sample from West London
%  Data from Everitt and Dunn CH.9, p. 175
%
%
Q=3; % number of variables
%
I=2; %  sex M - F
J=2; %  drug Yes - No
K=5; %  age category 16-29, 30-44, 45-64, 65-74, 75++
%
%  INCOMPLETE Z MATRIX WITH EFFECTIVE PER ROW
%
zi=[
   1 0 1 0 1 0 0 0 0  21
   1 0 1 0 0 1 0 0 0  32
   1 0 1 0 0 0 1 0 0  70
   1 0 1 0 0 0 0 1 0  43
   1 0 1 0 0 0 0 0 1  19
   1 0 0 1 1 0 0 0 0 683
   1 0 0 1 0 1 0 0 0 596
   1 0 0 1 0 0 1 0 0 705
   1 0 0 1 0 0 0 1 0 295
   1 0 0 1 0 0 0 0 1  99
   0 1 1 0 1 0 0 0 0  46
   0 1 1 0 0 1 0 0 0  89
   0 1 1 0 0 0 1 0 0 169
   0 1 1 0 0 0 0 1 0  98
   0 1 1 0 0 0 0 0 1  51
	0 1 0 1 1 0 0 0 0 738
   0 1 0 1 0 1 0 0 0 700
   0 1 0 1 0 0 1 0 0 847
   0 1 0 1 0 0 0 1 0 336
   0 1 0 1 0 0 0 0 1 196
];
%  namind
%
namind=[
   'MY1'
   'MY2'
   'MY3'
   'MY4'
   'MY5'
   'MN1'
   'MN2'
   'MN3'
   'MN4'
   'MN5'
   'FY1'
   'FY2'
   'FY3'
   'FY4'
   'FY5'
   'FN1'
   'FN2'
   'FN3'
   'FN4'
   'FN5'
];
namind=[
   'my1'
   'my2'
   'my3'
   'my4'
   'my5'
   'mn1'
   'mn2'
   'mn3'
   'mn4'
   'mn5'
   'fy1'
   'fy2'
   'fy3'
   'fy4'
   'fy5'
   'fn1'
   'fn2'
   'fn3'
   'fn4'
   'fn5'
];
%
%  name of columns
%
namvar=[
   'M '
   'F '
   'DY'
   'DN'
   'A1'
   'A2'
   'A3'
   'A4'
   'A5'
   ];
% Burt table
%  
BURT=[
   2563	0	   185 	2378	704	628	775	338	118
   0	  3270	453	2817	784	789	1016	434	247
   185  453 	638	0	   67 	121   239	141	70
   2378 2817   0     5195  1421  1296  1552  631  295
   704  784    67    1421   1488   0     0     0     0
   628  789    121   1296   0     1417  0     0     0
   775  1016   239   1552   0     0    1791   0     0
   338  434    141   631    0     0     0     772   0
   118  247    70    295    0     0     0     0    365
];
%
% Matrix Z unavailable but # rows Z=rz
