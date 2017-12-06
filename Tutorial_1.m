%Clear command line
clc;
%Closing all open windows
close all;
clear all;


%Excercise 1.1 
%Arithmetic coding. Consider the DNA alphabet {A,C,T,G} with the respective
%probabilities {0.5,0.3,0.15,0.05}. Encode using the aritmetic_encoding
%function and output the binary sequence
arithmetic_encoding([1,2,3,4], [0.5,0.3,0.15,0.05], [1,2,3,1,4,2]) % {A,C,T,A,G,C};

%Generate the arithmetic coding for "BE_A_BE"
arithmetic_encoding([1,2,3,4], [0.375,0.25,0.25,0.125], [2,1,3,4,3,2,1,1])

%Check the solutions using the arithmetic_decoding function, using the
%last entry in the binary code sequence
arithmetic_decoding([1,2,3,4], [0.5,0.3,0.15,0.05], 0.6188625000000, 6) % {A,C,T,G}
arithmetic_decoding([1,2,3,4], [0.375,0.25,0.25,0.125], 0.543766975402832, 8) % {E,B,_,A}

%Excercise 3 JPEG Encoder
array = rgb2gray(imresize(imread('DSC_0004.JPG'),0.25));
ready_for_huffman = simplified_jpeg_encoder(array);