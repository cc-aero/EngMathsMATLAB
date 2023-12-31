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


calcProbs(p,-0.35,-0.3,0.1,0.4,0,0.5);

function[prob, mean_val, one_std,two_std,area] = calcProbs(pdf,a,b, mu1,sigma1, mu2,sigma2)
    %{
Brief:      Ascertains probability of data lying in range of a PDF - AND
MORE

Syntax:     
    calcProbs(pdf,a,b, mu1,sigma1, mu2,sigma2)

Imports:    
    - pdf   |  function |   Given Probability Density Function
    - a |   float   |   Specified interval minimum
    - b |   float   |   Specified interval maximum
    - mu1       |   float   |   Mean Value for PDF1 
    - sigma1    |   float   |   Standard Deviation for PDF1
    - mu2       |   float   |   Mean Value for PDF2
    - sigma2    |   float   |   Standard Deviation for PDF2
    
 Exports:
    - prob      |   float   |   Probability of value being within interval
    - mean_val  |   float   |   Mean Value of PDF1
    - one_std   |   float   |   mean_val + one Standard Deviation
    - two_std   |   float   |   mean_val + two Standard Deviations
    - area      |   float   |   Overlap Area
        
    %}
    res = 1000;%1000 by default. x axis resolution. only relevant to plots.
    %PART 1
    prob=integral(pdf,a,b);
    
    %PART 2
    nDist = @(x) normpdf(x,mu1,sigma1);
    xvals = linspace(-5*sigma1,5*sigma1,res);    %Values for x axis
    
    figure(1)
    plot(xvals,nDist(xvals))
    
    xlabel("x")
    ylabel("Probability Density")
    grid
    mean_val = nDist(mu1);
    one_std = nDist(mu1 + sigma1);
    two_std = nDist(mu1 + 2*sigma1);


    
    %PART 3
    nDist2 = @(x) normpdf(x,mu2,sigma2);
    xvals2 = linspace(-5*sigma2,5*sigma2,res);    %Values for x axis
    
    figure(2)
    plot(xvals2, nDist2(xvals2))
    xlabel("x")
    ylabel("Probability Density")
    grid

    area = integral((@(x) min(nDist(x), nDist2(x))),-inf,inf);
    

    %to selfcheck: verify that integral((@(x) nDist(x)),-inf,inf) for
    %nDist1 and nDist2 are both ==1.   
end



