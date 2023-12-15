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



%p = pdf('Normal',x_rng,0,0.5); %This is NOT the proper way to do it;
                                %this creates a discrete function, which 
                                %we cannot integrate. We need continuous.

p = @(x) normpdf(x,0,0.4);  %Here is a continuous PDF for testing purposes


calcProbs(p,-0.35,-0.3,0.1,0.4,0.1,0.3);

function[prob, mean_val, one_std,two_std,area] = calcProbs(pd_func,range_min,range_max, mu1,sigma1, mu2,sigma2)
    %{
Brief:      Ascertains probability of data lying in range of a PDF
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
res = 1000;     %1000 by default. x axis resolution
%PART 1
prob=integral(pd_func,range_min,range_max);

%PART 2
    nDist = @(x) normpdf(x,mu1,sigma1);
    xvals = linspace(-5*sigma1,5*sigma1,res);    %Values for x axis
    dvals = nDist(xvals);    %Normal distribution values
    %plot(xvals,dvals)

    %xlabel("x")
    %ylabel("Probability Density")

    mean_val = nDist(mu1);
    one_std = nDist(mu1 + sigma1);
    two_std = nDist(mu1 + 2*sigma1);

%PART 3
    nDist2 = @(x) normpdf(x,mu2,sigma2);
    xvals2 = linspace(-5*sigma2,5*sigma2,res);    %Values for x axis
    dvals2 = nDist(xvals2);    %Normal distribution values
    
    
    area = integral((@(x) min(nDist(x), nDist2(x))),-inf,inf);
    
    area
end



