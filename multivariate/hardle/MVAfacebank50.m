% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAfacebank50
% ---------------------------------------------------------------------
% Description:  MVAfacebank50 computes Flury faces for the Swiss bank 
%               notes data ("bank2.dat").
% ---------------------------------------------------------------------
% Usage:        MVAfacebank50
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Computes Flury faces for the Swiss bank notes data 
%               ("bank2.dat").
% ---------------------------------------------------------------------
% Example:      
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Michal Benko, Vladimir Georgescu, 
%               Jorge Patron, Song Song
% ---------------------------------------------------------------------

h=load('bank2.dat');    
title('Flury Faces for Bank Data');
glyphplot(h, 'Glyph','face','Grid',[5 10],'Page','all')
     
   