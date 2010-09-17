% ---------------------------------------------------------------------
% Book:         MVA
% ---------------------------------------------------------------------
% Quantlet:     MVAbankruptcydis
% ---------------------------------------------------------------------
% Description:  Successful classification ratio dynamic over the number
%               of terminal nodes: cross-validation.
% ---------------------------------------------------------------------
% Usage:        MVAbankruptcydis
% ---------------------------------------------------------------------
% Inputs:       none
% ---------------------------------------------------------------------
% Output:       Successful classification ratio dynamic over the number
%               of terminal nodes: cross-validation.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Wolfgang Haerdle, Song Song, Vladimir Georgescu
% ---------------------------------------------------------------------

plot(p,'LineWidth',1.5)
title('Classification ratio by minsize parameter');
xlabel('MinSize parameter');
ylabel('Classification Ratio')
xlim([0 41])
ylim([0.4 1])