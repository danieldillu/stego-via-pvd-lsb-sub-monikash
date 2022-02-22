function [ tp4str,tp5str ] = fixOverFlowUnderflows( p4str,p5str )
%fixOverFlowUnderflows Summary of this function goes here
%   Detailed explanation goes here.
tp4str = 99999;
tp5str = 99999;
if max([p4str p5str]) > 255
    dOverflow = max([p4str p5str]) - 255;
    tp4str = p4str - dOverflow;
    tp5str = p5str - dOverflow;
end
% Underflow
if min([p4str p5str]) < 0
    dUnderflow = min([p4str p5str]) - 0;
    tp4str = p4str - dUnderflow;
    tp5str = p5str - dUnderflow;
end

end

