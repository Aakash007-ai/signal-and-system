pkg load symbolic
pkg load communications
clc;
clear all ;
close all; 
k = input('Enter the length of Msg word : '); 
n = input('Enter the length of Codeword : '); 
m = input('Enter the Msg . Word : '); 
G = cyclpoly (n ,k,'max'); 
qx = poly2sym (G); 
disp('Equation = ') 
disp ( qx ) 
C = encode (m ,n ,k,'cyclic ',G);
disp('C = ') 
disp (C); 
D = decode (C ,n ,k,'cyclic ',G); 
disp('D = ') 
disp (D);
