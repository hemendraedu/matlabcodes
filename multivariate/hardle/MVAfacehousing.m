% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAfacehousing
% ---------------------------------------------------------------------
% Description:  MVAfacehousing plots Flury faces for subset of the 
%               Boston housing data.
% ---------------------------------------------------------------------
% Usage:        MVAfacehousing
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Plots Flury faces for subset of the Boston housing 
%               data.
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

x1=load('bostonh.dat');
x2=[x1(:,1) x1(:,5) x1(:,8) x1(:,11) x1(:,13) x1(:,14)];
x3=log(x2);
x=x3(351:380,:);
glyphplot(x, 'Glyph','face')
title('Flury faces for Boston Housing');

