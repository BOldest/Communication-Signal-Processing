a = [3 4 -2 2 2
    4 9 -3 5 8
    -2 -3 7 6 10
    1 4 6 7 2];

[m,n]=size(a); % m = rows , n= column
for j=1:m-1 
    for z=2:m
        if a(j,j)==0
            t=a(j,:);a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
x=zeros(1,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c=c+a(s,k)*x(k);
    end
    x(s)=(a(s,n)-c)/a(s,s);
end

x'