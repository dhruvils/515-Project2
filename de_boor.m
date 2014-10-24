function [CS] = de_boor(D, N)
%D is a matrix of points of order N+1x2
%N is the number of de-Boor control points
 C=zeros(4,N+1,N-2);
 for k=1:N-2
%Special case for N=5 and N=6 because the N-4, N-3 and N-2 cases coincide with k=1,2,3 and produce an incomplete curve
 if N==5 || N==6
  if k==1
   C(1,1,k)=1;
   C(2,2,k)=1;
   C(3,2,k)=1/2;
   C(3,3,k)=1/2;
   C(4,2,k)=1/4;
   C(4,3,k)=7/12;
   C(4,4,k)=1/6;
  elseif k==2 && N==6
   C(1,2,k)=1/4;
   C(1,3,k)=7/12;
   C(1,4,k)=1/6;
   C(2,3,k)=2/3;
   C(2,4,k)=1/3;
   C(3,3,k)=1/3;
   C(3,4,k)=2/3;
   C(4,3,k)=1/6;
   C(4,4,k)=4/6;
   C(4,5,k)=1/6;
  elseif k==N-3 && N==5
   C(1,2,k)=1/4;
   C(1,3,k)=7/12;
   C(1,4,k)=1/6;
   C(2,N-2,k)=2/3;
   C(2,N-1,k)=1/3;
   C(3,N-2,k)=1/3;
   C(3,N-1,k)=2/3;
   C(4,N-2,k)=1/6;
   C(4,N-1,k)=7/12;
   C(4,N,k)=1/4;
  elseif k==N-3 && N==6
   C(1,3,k)=1/6;
   C(1,4,k)=4/6;
   C(1,5,k)=1/6;
   C(2,N-2,k)=2/3;
   C(2,N-1,k)=1/3;
   C(3,N-2,k)=1/3;
   C(3,N-1,k)=2/3;
   C(4,N-2,k)=1/6;
   C(4,N-1,k)=7/12;
   C(4,N,k)=1/4;
  elseif k==N-2
   C(1,N-2,k)=1/6;
   C(1,N-1,k)=7/12;
   C(1,N,k)=1/4;
   C(2,N-1,k)=1/2;
   C(2,N,k)=1/2;
   C(3,N,k)=1;
   C(4,N+1,k)=1;
  else
   C(1,k,k)=1/6;
   C(1,k+1,k)=4/6;
   C(1,k+2,k)=1/6;
   C(2,k+1,k)=2/3;
   C(2,k+2,k)=1/3;
   C(3,k+1,k)=1/3;
   C(3,k+2,k)=2/3;
   C(4,k+1,k)=1/6;
   C(4,k+2,k)=4/6;
   C(4,k+3,k)=1/6;
  end
%General case for all N>=7
 else
  if k==1
   C(1,1,k)=1;
   C(2,2,k)=1;
   C(3,2,k)=1/2;
   C(3,3,k)=1/2;
   C(4,2,k)=1/4;
   C(4,3,k)=7/12;
   C(4,4,k)=1/6;
  elseif k==2
   C(1,2,k)=1/4;
   C(1,3,k)=7/12;
   C(1,4,k)=1/6;
   C(2,3,k)=2/3;
   C(2,4,k)=1/3;
   C(3,3,k)=1/3;
   C(3,4,k)=2/3;
   C(4,3,k)=1/6;
   C(4,4,k)=4/6;
   C(4,5,k)=1/6;
  elseif k==N-2
   C(1,N-2,k)=1/6;
   C(1,N-1,k)=7/12;
   C(1,N,k)=1/4;
   C(2,N-1,k)=1/2;
   C(2,N,k)=1/2;
   C(3,N,k)=1;
   C(4,N+1,k)=1;
  elseif k==N-3
   C(1,N-3,k)=1/6;
   C(1,N-2,k)=4/6;
   C(1,N-1,k)=1/6;
   C(2,N-2,k)=2/3;
   C(2,N-1,k)=1/3;
   C(3,N-2,k)=1/3;
   C(3,N-1,k)=2/3;
   C(4,N-2,k)=1/6;
   C(4,N-1,k)=7/12;
   C(4,N,k)=1/4;
  else
   C(1,k,k)=1/6;
   C(1,k+1,k)=4/6;
   C(1,k+2,k)=1/6;
   C(2,k+1,k)=2/3;
   C(2,k+2,k)=1/3;
   C(3,k+1,k)=1/3;
   C(3,k+2,k)=2/3;
   C(4,k+1,k)=1/6;
   C(4,k+2,k)=4/6;
   C(4,k+3,k)=1/6;
  end
 end
end
%CS 3D matrix for the curve segments
CS=zeros(4,2,N-2);
%Plotting the de-Boor points
plot(D(:,1),D(:,2),'r')
hold on
for k=1:N-2
 CS(:,:,k)=C(:,:,k)*D;
 %Plotting the different curve segments
 plot(CS(:,1,k),CS(:,2,k))
 hold on
end
legend('de Boor Points','Bezier Curve')
end


