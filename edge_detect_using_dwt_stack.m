%https://stackoverflow.com/questions/31923638/edge-detection-via-wavelet-transformdwt2
pkg load image
clc;
clear all,close all
img=imread('sam.png');
img=img(:,:,1);
imshow(img);
L = medfilt2(img,[3 3]);

L=im2double(L);
[A,H,V,D]=dwt(L,'haar');

A=zeros(size(A));
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2); 
imshow(Q1);


%enter code here
clc;
clear all,close all

img=imread('2.png');
img=rgb2gray(img);
L = medfilt2(img,[3 3]);
t=graythresh(L);
b=im2bw(L,t);
[A,H,V,D]=dwt2(b,'haar');
A1=zeros(size(A));
Q1 = idwt2(A1,H,V,D,'haar');
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(Q1);