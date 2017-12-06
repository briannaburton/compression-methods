
%The arithmetic_encoding function's inputs are the DNA alphabet, respective
%symbols probabilities, and sequence to code, respectively. The function
%outputs a binary stream of the sequence.

function [binary_stream, binary] = arithmetic_encoding(list_of_symbols, probabilities, sequence_to_code)

    %Sort the probabilities and list of symbols in ascending order in case they are not
    list_prob_together = [probabilities;list_of_symbols];
    num_symbols = length(list_of_symbols);
    [mat inx]=sort(list_prob_together(1,:));
    sortedmatrix = zeros(2,num_symbols);
    for i =1:num_symbols
        sortedmatrix(:,i) = list_prob_together(:,inx(num_symbols + 1 - i));
    end
    probabilities = sortedmatrix(1,:);
    list_of_symbols = sortedmatrix(2,:);
    
    %Create a list of all high ranges and a list of all low ranges for
    %symbols.
    highrange(list_of_symbols(1)) = 1.;
    lowrange(list_of_symbols(1)) = 1 - probabilities(1);
    for i = 2 : length(list_of_symbols)
        highrange(list_of_symbols(i)) = lowrange(list_of_symbols(i-1));
        lowrange(list_of_symbols(i)) = highrange(list_of_symbols(i)) - probabilities(i);
    end
    
    %Initialize the oldlow to 0 and oldhigh to 1
    oldlow = 0.;
    oldhigh = 1.;
    
    %Fill the binary_stream by calculating with the given formulas
    binary_stream = (length(sequence_to_code));
    for i = 1 : length(sequence_to_code)
        range = oldhigh - oldlow;
        newhigh = oldlow + range * highrange(sequence_to_code(i));
        newlow = oldlow + range * lowrange(sequence_to_code(i));
        binary_stream(i) = newlow;
        oldhigh = newhigh;
        oldlow = newlow;
    end
    
    %Binary encode the output
    decimal = binary_stream(length(sequence_to_code));
    dstr = num2str(decimal);
    darray = zeros(1,numel(dstr-2));
    for i=3:numel(dstr)
        darray(i-2)=str2num(dstr(i));
    end
    
    binary = de2bi (darray);
end
