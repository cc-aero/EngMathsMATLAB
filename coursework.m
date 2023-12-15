%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*
%                                                             %
%                    _    ___  ___          _                 %*
%                   | |   |  \/  |         | |                %
%    _ __  _ __ ___ | |__ | .  . | __ _ ___| |_ ___ _ __      %*
%   | '_ \| '__/ _ \| '_ \| |\/| |/ _` / __| __/ _ \ '__|     %
%   | |_) | | | (_) | |_) | |  | | (_| \__ \ ||  __/ |        %*
%   | .__/|_|  \___/|_.__/\_|  |_/\__,_|___/\__\___|_|        %
%   | |                                                       %*
%   |_|                                                       %
%                                                             %*
%           AUTHOR  |   Cameron Connor                        %
%           COURSE  |   bEng(H) Aerospace Engineering         %*
%           CONTEXT |   Engineering Maths 2 MATLAB Coursework %
%           EPOCH   |   1702659404                            %*
%           MATLAB  |   23.2.0.2428915                        %
%                                                             %*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


res=100;
x_rng = linspace(-1,1,res);
%p = pdf('Normal',x_rng,0,0.5); %This is NOT the proper way to do it;
                                %this creates a discrete function, which 
                                %we cannot integrate. We need continuous.

p = @(x) normpdf(x,0,0.4);  %Here is a continuous PDF for testing purposes


calcProbs(p,-0.35,-0.3)

function[prob] = calcProbs(pd_func,range_min,range_max)    %function[outs]=name(inps)
    %{
Brief:      Ascertains probabilities.
Details:    //!TODO long details
        
Syntax:     
    calcProbs(pdf,range_min,range_max)

    Example:
    
    mypdf = pdf('Normal',x_range,mean,standard_deviation);
    calcProbs(myPdf,0.2,0.35)

Imports:    
    - pdf       |  function |   Given Probability Density Function
    - range_min |   float   |   Specified interval minimum
    - range_max |   float   |   Specified interval maximum
    
 Exports:
    - prob      |   float   |   Probability of value being within interval
        
    %}
prob=integral(pd_func,range_min,range_max);
    
end

