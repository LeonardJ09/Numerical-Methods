%this function works as an artisitic extension of the Bilinear
%Interpolation Algorithm, and constructs 3 arrays of random integers the
%are converted into RGB values

%the number of rows, t, and the number of columns, s, of the original
%matricies must be defined

% the multiplicity of the interpixel range, p, must be defined


function z = RandBI(t,s,p)
% establishing the color pixel matricies
red = rand(t,s); % Red channel
green = rand(t,s); % Green channel
blue = rand(t,s); % Blue channel

% define the new vector space using image size
Rows = t; % number of rows in the image matrix
Columns = s; % number of columns in the image matrix

% expand the row and column vectors to the size of the desired end matrix
N = ((Rows-1)*p)+1; % increases number of pixels between pixels by p
M = ((Columns-1)*p)+1; %increases numbr of pixels between pixels by p

% Generate output matricies based on new row and columns for each color
R = ones(N,M);
G = ones(N,M);
B = ones(N,M);

% create the expanded matrix of the interpolated red values
for n = 1:N
     for m = 1:M
         % set the values for the corners that match with red
         if mod(n-1,p) == 0 && mod(m-1,p) == 0
             R(n,m) = red(((n-1)/p)+1,((m-1)/p)+1);
         end
         % linearize the unit lines along n-1 values divisible by p
         if mod(n-1,p)== 0 && mod(m-1,p) ~= 0
             R(n,m) = red(((n-1)/p)+1,ceil((m-1)/p))+(mod((m-1),p)/p)*(red(((n-1)/p)+1,ceil((m-1)/p)+1)-red(((n-1)/p)+1,ceil((m-1)/p)));
         end
         % linearize the unit lines along m-1 values divisible by p
         if mod(m-1,p)==0 && mod(n-1,p)~=0
             R(n,m) = red((ceil((n-1)/p)),((m-1)/p)+1)+(mod((n-1),p)/p)*(red(ceil((n-1)/p)+1,((m-1)/p)+1)-red(ceil((n-1)/p),((m-1)/p)+1));
         end 
         if mod(n-1,p)~=0 && mod(m-1,p) ~= 0
         TL = (((mod(n-1,p)*mod(m-1,p)))/(p*p));
         TR = ((((p-mod(n-1,p))*mod(m-1,p)))/(p*p));
         LL = ((mod(n-1,p)*(p-mod(m-1,10)))/(p*p));
         LR = (((p-mod(n-1,p))*(p-mod(m-1,p)))/(p*p));
         % index the weighted function values for every point
         b = red(ceil((n-1)/p)+1,ceil((m-1)/p)+1);
         C = red(ceil((n-1)/p)+1,ceil((m-1)/p));
         D = red(ceil((n-1)/p),ceil((m-1)/p));
         E = red(ceil((n-1)/p),ceil((m-1)/p)+1);
         R(n,m) = b*TL+C*TR+D*LR+E*LL;
         end
     end
 end
% create the expanded matrix of the interpolated green values
for n = 1:N
     for m = 1:M
         % set the values for the corners that match with green
         if mod(n-1,p) == 0 && mod(m-1,p) == 0
             G(n,m) = green(((n-1)/p)+1,((m-1)/p)+1);
         end
         % linearize the unit lines along n-1 values divisible by p
         if mod(n-1,p)== 0 && mod(m-1,p) ~= 0
             G(n,m) = green(((n-1)/p)+1,ceil((m-1)/10))+(mod((m-1),p)/p)*(green(((n-1)/p)+1,ceil((m-1)/p)+1)-green(((n-1)/p)+1,ceil((m-1)/p)));
         end
         % linearize the unit lines along m-1 values divisible by p
         if mod(m-1,p)==0 && mod(n-1,p)~=0
             G(n,m) = green((ceil((n-1)/p)),((m-1)/p)+1)+(mod((n-1),p)/p)*(green(ceil((n-1)/p)+1,((m-1)/p)+1)-green(ceil((n-1)/p),((m-1)/p)+1));
         end 
         if mod(n-1,p)~=0 && mod(m-1,p) ~= 0
         TL = (((mod(n-1,p)*mod(m-1,p)))/(p*p));
         TR = ((((p-mod(n-1,p))*mod(m-1,p)))/(p*p));
         LL = ((mod(n-1,p)*(p-mod(m-1,10)))/(p*p));
         LR = (((p-mod(n-1,p))*(p-mod(m-1,p)))/(p*p));
         % index the weighted function values for every point
         b = green(ceil((n-1)/p)+1,ceil((m-1)/p)+1);
         C = green(ceil((n-1)/p)+1,ceil((m-1)/p));
         D = green(ceil((n-1)/p),ceil((m-1)/p));
         E = green(ceil((n-1)/p),ceil((m-1)/p)+1);
         G(n,m) = b*TL+C*TR+D*LR+E*LL;
         end
     end
 end
% create the expanded matrixof the interpolated blue values
for n = 1:N
     for m = 1:M
         % set the values for the corners that match with blue
         if mod(n-1,p) == 0 && mod(m-1,p) == 0
             B(n,m) = blue(((n-1)/p)+1,((m-1)/p)+1);
         end
         % linearize the unit lines along n-1 values divisible by p
         if mod(n-1,p)== 0 && mod(m-1,p) ~= 0
             B(n,m) = blue(((n-1)/p)+1,ceil((m-1)/10))+(mod((m-1),p)/p)*(blue(((n-1)/p)+1,ceil((m-1)/p)+1)-blue(((n-1)/p)+1,ceil((m-1)/p)));
         end
         % linearize the unit lines along m-1 values divisible by p
         if mod(m-1,p)==0 && mod(n-1,p)~=0
            B(n,m) = blue((ceil((n-1)/p)),((m-1)/p)+1)+(mod((n-1),p)/p)*(blue(ceil((n-1)/p)+1,((m-1)/p)+1)-blue(ceil((n-1)/p),((m-1)/p)+1));
         end 
         if mod(n-1,p)~=0 && mod(m-1,p) ~= 0
         TL = (((mod(n-1,p)*mod(m-1,p)))/(p*p));
         TR = ((((p-mod(n-1,p))*mod(m-1,p)))/(p*p));
         LL = ((mod(n-1,p)*(p-mod(m-1,10)))/(p*p));
         LR = (((p-mod(n-1,p))*(p-mod(m-1,p)))/(p*p));
         % index the weighted function values for every point
         b = blue(ceil((n-1)/p)+1,ceil((m-1)/p)+1);
         C = blue(ceil((n-1)/p)+1,ceil((m-1)/p));
         D = blue(ceil((n-1)/p),ceil((m-1)/p));
         E = blue(ceil((n-1)/p),ceil((m-1)/p)+1);
         B(n,m) = b*TL+C*TR+D*LR+E*LL;
         end
     end
end

%convert the old matricies into uint8
Bred = uint8(red.*255);
Bgreen = uint8(green.*255);
Bblue = uint8(blue.*255);

% convert the new matricies into uint8 values
BIred = uint8(R.*255);
BIgreen = uint8(G.*255);
BIblue = uint8(B.*255);

% compile into RBG file type
RGB1 = cat(3,Bred,Bgreen,Bblue);
RBG2 = cat(3,BIred,BIgreen,BIblue);

% write the image files 
imwrite(RGB1, 'RandomImage.jpg')
imwrite(RBG2,'RandomInterpolatedImage.jpg');


