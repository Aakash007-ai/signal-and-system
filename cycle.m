pkg load communications

%Set the values of the codeword length and message length.
n = 15; % Codeword length
k = 5; % Message length
%Create a random binary message with length equal to the message length.
data = randi([0 1],k,1);
%Create a generator polynomial for a cyclic code. Create a parity-check matrix by using the generator polynomial.
genpoly = cyclpoly(n,k);
parmat = cyclgen(n,genpoly);
%Create a syndrome decoding table by using the parity-check matrix.
trt = syndtable(parmat);
%Single-error patterns loaded in decoding table.  1008 rows remaining.
%2-error patterns loaded.  918 rows remaining.
%3-error patterns loaded.  648 rows remaining.
%4-error patterns loaded.  243 rows remaining.
%5-error patterns loaded.  0 rows remaining.
%Encode the data by using the generator polynomial.
encData = encode(data,n,k,'cyclic/binary',genpoly);
%Corrupt the encoded message sequence by introducing errors in the first, second, fourth and seventh bits.
encData(1) = ~encData(1);
encData(2) = ~encData(2);
encData(4) = ~encData(4);
%Decode the corrupted sequence. Observe that the decoder has correctly recovered the message.
decData = decode(encData,n,k,'cyclic/binary',genpoly,trt);
numerr = biterr(data,decData)
%numerr = 0
numerr