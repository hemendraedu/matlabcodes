classdef NamedNode < dlnode
   properties
      Name = '';
   end 
   methods
      function n = NamedNode (name,data)
         if nargin == 0   % to handle the no argument case
            name = '';
            data = [];
         end
         n = n@dlnode(data); % Initialize a dlnode object
         n.Name = name;
      end 
      function disp(n) % Override the dlnode disp method
         disp(['Node Name: ' n.Name])
         disp(['Node Data: ' num2str(n.Data)])
      end
   end % methods
end % classdef
