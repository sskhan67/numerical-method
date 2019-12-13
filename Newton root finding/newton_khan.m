function [root] = newton_khan(fcn_name,guess,nmax)
% Newton root finding tech, eng 219
% function returns function roots 
% Parameters: atol= absoluate tolerance, rtol=relative tolerance, root= resutl,


% display 
disp ('    Iter      Value     Fcn       Delta')
% parameter initilaiation 
atol=1e-8;
rtol=1e-4;
root=0;
%%% root_array=[];
%%% f_array=[];
xnew=guess;
fnew=fcn_name(xnew); % call interest cal. function 
deltax=guess*rtol+atol; % act as derivative

for i=1:nmax
    
    xold=xnew;
    fold=fnew;
    
    xnew=xold+deltax;
    fnew=fcn_name(xnew);
    fprime=(fnew-fold)/(xnew-xold);
    deltax=-fnew/fprime;
    %%% root_array=[root_array xnew];% plot purpose 
    %%% f_array=[f_array fnew];% plot purpose 
    if abs(deltax)/(xnew+atol)<rtol
        root=xnew+deltax;
        
        disp( [i xnew fnew deltax ])
        break
    else
        disp( [i xnew fnew deltax ])
    end
end
if root==0
    %%% single quote for string
    disp(' warning: if root=0, plz check your function ');
end
%%% plot(root_array,f_array)

end
        
    
    
   
            
    
 
