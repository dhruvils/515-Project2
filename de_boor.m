%D is a matrix of points of order N+1x2
%N is the number of de-Boor control points
C=zeros(4,N+1,N-2);
for k=1:N-2
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
    C(1,k-1,k)=1/6;
    C(1,k,k)=4/6;
    C(1,k+1,k)=1/6;
    C(2,k,k)=2/3;
    C(2,k+1,k)=1/3;
    C(3,k,k)=1/3;
    C(3,k+1,k)=2/3;
    C(4,k,k)=1/6;
    C(4,k+1,k)=4/6;
    C(4,k+2,k)=1/6;
 end
end
CS=zeros(4,2,N-2);
plot(D(:,1),D(:,2))
hold on
for k=1:N-2
    CS(:,:,k)=C(:,:,k)*D;
    plot(CS(:,1,k),CS(:,2,k))
    hold on
end


