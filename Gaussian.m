clc;
function [gret,mret] = Gaussian(nmat,rec)
  mret=horzcat(nmat,rec);
  [m,n]=size(mret); % m = rows , n= column
  for j=1:m-1 
      for z=2:m
          if mret(j,j)==0
              t=mret(j,:);mret(j,:)=mret(z,:);
              mret(z,:)=t;
          end
      end
      for i=j+1:m
          mret(i,:)=mret(i,:)-mret(j,:)*(mret(i,j)/mret(j,j));
      end
  end
  x=zeros(1,m);
  for s=m:-1:1
      c=0;
      for k=2:m
          c=c+mret(s,k)*x(k);
      end
      x(s)=(mret(s,n)-c)/mret(s,s);
   
  end
  gret=x'
endfunction
% Main function
t= [3 4 -2 2
      4 9 -3 2
      -2 -3 7 6 
      1 4 6 7 ];

rec = [2;8;10;2];
output = Gaussian(t,rec);