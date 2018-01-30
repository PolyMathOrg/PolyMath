accessing
computePValues
"
#Compute P-values
	P = x2p(X, 1e-5, perplexity);
	P = P + Math.transpose(P);
	P = P / Math.sum(P);
	P = P * 4;									# early exaggeration
	P = Math.maximum(P, 1e-12);
"
| p n |
p := self x2p.
p := p + p transpose.
p := p / (p sum).
p := p *4.
p := p max: 1e-12.
^ p