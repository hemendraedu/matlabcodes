GaussPlotScript;                     % call a script (no input and output arguments) in GaussPlotScript.m
GaussFunc(2,1,4);                    % call GaussFunc in GaussFunc.m. First line is function definition line, defining function name and order of input and output argument
lookfor GaussFunc;                   % print 'help 1' line
mu = input('enter mean value');      % get user input and store in double variable 
title = input('enter title ', 's');  % get user input and store in string variable 
pause(5)                             % pause 5 seconds 




