% in order for the program to work, a JPEG must be imported using
% imread('filename.jpg') and set equal to I. Then, a pixel multiplicity must
% be choosen, p, to determine the number of subpixels evaluate in between
% existing pixels

%this program is meant to demonstrate the concept of BiLinear Interpolation
%when expanding an images pixel data to attempt to increase the amount of
%information the image contains

% after the program is complete it can be seen that the image has grid lines
% crossing through all sides, and this is because the algorithm attempts to
% increase resolution through pixel quanity, but doesnt take into account
% the changes in pixel values in relation to image content

function Z = ImageBI(I,p)
% convert the image to double values
I2 = im2double(I);

% establishing the color pixel matricies
red = I2(:,:,1); % Red channel
green = I2(:,:,2); % Green channel
blue = I2(:,:,3); % Blue channel

% define the new vector space using image size
Size = size(red);
Rows = Size(1); % number of rows in the image matrix
Columns = Size(2); % number of columns in the image matrix

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
% convert the matricies back into uint8 values
BIred = R.*255;
Bred = uint8(BIred);
BIgreen = G.*255;
Bgreen = uint8(BIgreen);
BIblue = B.*255;
Bblue = uint8(BIblue);

% compile into RBG file type
RBG = cat(3,Bred,Bgreen,Bblue);

% write the new image file 
imwrite(RBG,'interpolatedImage.jpg');

%display the old image
imshow('Doheny.jpg');

%display the new image
imshow('interpolatedImage.jpg');
 
 
 