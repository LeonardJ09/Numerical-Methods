%this function takes a number p, and turns it into an nxn matrix of random
%values between 0 and 1. This matrix is used as the basis for pixel values
%that will be expanded through BiLinear interpolation 

% the algorithm produces plots of the original values and then of the
% larger interpolated values.

% as a basis, a multiplicity value of 10 was used to expand the interpixel values




function Z = BilinearInterpolation(p)
% establishing the random pixel values
A = rand(p,p);

% define the vector space
G = ones(10*(p-1)+1);

% define vector space using indexing and inner functions
 for n = 1:(10*(p-1)+1)
     for m = 1:(10*(p-1)+1)
         % set the values for the corners that match with A
         if mod(n-1,10) == 0 && mod(m-1,10) == 0
             G(n,m) = A(((n-1)/10)+1,((m-1)/10)+1);
         end
         % linearize the unit lines along n-1 values divisible by 10
         if mod(n-1,10)==0 && mod(m-1,10) ~= 0
             G(n,m) = A(((n-1)/10)+1,ceil((m-1)/10))+(mod((m-1),10)/10)*(A(((n-1)/10)+1,ceil((m-1)/10)+1)-A(((n-1)/10)+1,ceil((m-1)/10)));
         end
         % linearize the unit lines along m-1 values divisible by 10
         if mod(m-1,10)==0 && mod(n-1,10)~=0
             G(n,m) = A((ceil((n-1)/10)),((m-1)/10)+1)+(mod((n-1),10)/10)*(A(ceil((n-1)/10)+1,((m-1)/10)+1)-A(ceil((n-1)/10),((m-1)/10)+1));
         end 
         if mod(n-1,10)~=0 && mod(m-1,10) ~= 0
         TL = (((mod(n-1,10)*mod(m-1,10)))/100);
         TR = ((((10-mod(n-1,10))*mod(m-1,10)))/100);
         LL = ((mod(n-1,10)*(10-mod(m-1,10)))/100);
         LR = (((10-mod(n-1,10))*(10-mod(m-1,10)))/100);
         % index the weighted function values for every point
         B = A(ceil((n-1)/10)+1,ceil((m-1)/10)+1);
         C = A(ceil((n-1)/10)+1,ceil((m-1)/10));
         D = A(ceil((n-1)/10),ceil((m-1)/10));
         E = A(ceil((n-1)/10),ceil((m-1)/10)+1);
         G(n,m) = B*TL+C*TR+D*LR+E*LL;
         end
     end
 end
 
 % create a contor plot for the two matricies
 contourf(A,50);
 savefig('contourA.fig');
 contourf(G,50);
 savefig('contourG.fig');
 surf(A);
 savefig('surfaceA.fig');
 surf(G);
 savefig('surfaceG.fig');
 surfc(A);
 savefig('surface_contourA.fig');
 surfc(G);
 savefig('surface_contourG.fig');
 
 
 