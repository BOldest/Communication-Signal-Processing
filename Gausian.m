clc;
function rect = augment(mat,rec)
  rect=horzcat(mat,rec)
endfunction
function ret = Gausian(fmat)
  [m,n]=size(fmat); % m = rows , n= column
  for j=1:m-1 
      for z=2:m
          if fmat(j,j)==0
              t=fmat(j,:);fmat(j,:)=fmat(z,:);
              fmat(z,:)=t;
          end
      end
      for i=j+1:m
          fmat(i,:)=fmat(i,:)-fmat(j,:)*(fmat(i,j)/fmat(j,j));
      end
  end
  x=zeros(1,m);
  for s=m:-1:1
      c=0;
      for k=2:m
          c=c+fmat(s,k)*x(k);
      end
      x(s)=(fmat(s,n)-c)/fmat(s,s);
   
  end
  ret=x'
endfunction
% Main function
mat= [3 4 -2 2
      4 9 -3 2
      -2 -3 7 6 
      1 4 6 7 ];

rec = [2;8;10;2];
a = augment(mat,rec)
output = Gausian(a);