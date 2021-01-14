function k = myPNorm(v,p)
% v \in \mathbb{C}, p is |v|_p.
% k is caluculation result.

if isnumeric(v) == false || isnumeric(p) == false
    error('myPNorm:InputargsMustBeNumeric','inputargs must be numeric');
end

if isvector(v) == false && ismatrix(v) == true
    error('myPNorm:VectorNormError','inputarg v must be vector');
end

if mod(p,1) ~= 0 || p < 1
    error('myPNorm:pError','inputarg p must be integer and greter than 0');
end

k = nthroot(sum(abs(v).^p),p);
end

