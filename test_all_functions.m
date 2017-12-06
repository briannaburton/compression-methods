% Image Compression Lab
% Brianna BURTON, Doiriel VANEGAS

%Clear command line
clc;
%Closing all open windows
close all;
clear all;


%Exercise 1.1 
%Arithmetic coding. Consider the DNA alphabet {A,C,T,G} with the respective
%probabilities {0.5,0.3,0.15,0.05}. Encode using the aritmetic_encoding
%function and output the binary sequence
DNA_encoding = arithmetic_encoding([1,2,3,4], [0.5,0.3,0.15,0.05], [1,2,3,1,4,2]) % {A,C,T,A,G,C};

%Generate the arithmetic coding for "BE_A_BE"
BE_A_BE_encoding = arithmetic_encoding([1,2,3,4], [0.375,0.25,0.25,0.125], [2,1,3,4,3,2,1,1])

%Check the solutions using the arithmetic_decoding function, using the
%last entry in the binary code sequence
DNA_decoding = arithmetic_decoding([1,2,3,4], [0.5,0.3,0.15,0.05], 0.6188625000000, 6) % {A,C,T,G}
BE_A_BE_decoding = arithmetic_decoding([1,2,3,4], [0.375,0.25,0.25,0.125], 0.543766975402832, 8) % {E,B,_,A}

%Exercise 2
%1. Huffman encoding of a probability vector
alphabet = ['A', 'C', 'T', 'G'];
prob_vector = [0.5, 0.3, 0.15, 0.05];
codeBook_vector = huffman_encoding(prob_vector,alphabet)

%2. Huffman encoding of a gray image
image = imread('cameraman.tif');
codeBook_image = huffman_image(image)

%Exercise 3 JPEG Encoder
array = rgb2gray(imresize(imread('DSC_0004.JPG'),0.25));
simplified_jpeg_encoder(array);