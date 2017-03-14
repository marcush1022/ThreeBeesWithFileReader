%   Training Artificial Neural Network.
%   Input Layer: 5, Hidden Layer: 10, Output Layer: 3 neurons. 
%	Returns mean square error between desired and actual outputs.

% function [output] = name(input)
function ObjVal = nntrainxor221b(Chrom)
[Nind Nvar]=size(Chrom);
%fprintf('Nind=%d Nvar=%d\n',Nind, Nvar);

%read input values file
dataIn=load('LR.txt');
%read output values file
dataOu=load('LR2.txt');

%get 15*4 rows of data
for n=1:4:60 
    trin=dataIn([n,n+1,n+2,n+3],:);
    trout=dataOu([n,n+1,n+2,n+3],:);
    
    %trin=[11 15 13 9 7; 5 12 3 7 2; 4 11 6 8 6; 7 11 6 6 3];
    %trout = [0 1 1; 1 1 0; 1 0 1; 0 1 0];
    inpRow=size(trin,1);%input rows number
    inp=size(trin,2);%input colums number

    %fprintf('trin 1=%d\n',trin(3,2));
    %fprintf('trout 1=%d\n',trout(3));
    %fprintf('inpC=%d\n',inp);

    %inp1=size(trin,1);
    outD=size(trout,1);%output rows number
    out=size(trout,2);%output cols number
    %fprintf('out size=%d\n',out);

    hidden=10;

    for i=1:Nind


    x=Chrom(i,:);

        ObjVal(i)=0;
    
        iw = reshape(x(1:hidden*inp),hidden,inp);
        %w1=x(1:hidden*inp);
        b1 = reshape(x(hidden*inp+1:hidden*inp+hidden),hidden,1);
        lw = reshape(x(hidden*inp+hidden+1:hidden*inp+hidden+hidden*out),out,hidden);
        %w2=x(hidden*inp+hidden+1:hidden*inp+hidden+hidden*out);
        b2 = reshape(x(hidden*inp+hidden+hidden*out+1:hidden*inp+hidden+hidden*out+out),out,1);
    
    
        %logsig: activaton function
        %use matrix
        y = logsig(logsig(trin*iw'+repmat(b1',size(trin,1),1))*lw'+repmat(b2',size(trin,1),1));
    
    
        %fprintf('b1 size=%d\n',size());
        output=reshape(y,12,1);
        desire=reshape(trout,12,1);
    
        %fprintf('iw=%d lw=%d\n',iw,lw);
        
        %get the mse of the inputs and targets 
        ObjVal(i)=ObjVal(i)+mse(output-desire)*1/60;
    end;%for i=1:Nind

end;%for n=1:60



