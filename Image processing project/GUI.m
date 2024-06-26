function varargout = GUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end



function GUI_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%-------------------Basic options-----------------------
function upload_Callback(hObject, eventdata, handles)
    [filename, pathname] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp;*.gif;*.tif', 'Image Files (*.jpg,*.jpeg, *.png,*.tif, *.bmp, *.gif)'; '*.*', 'All Files (*.*)'}, 'Select Image');
    % Check if the user selected a file
    if isequal(filename, 0) || isequal(pathname, 0)
        disp('User canceled the operation');
    else
        % Load the selected image

        imagePath = fullfile(pathname, filename);
        % Read the image using imread
        img = imread(imagePath);

        axes(handles.axes1);
        imshow(img);

        axis(handles.axes1, 'image'); % Set the axis to display the image in its true aspect ratio
        axis(handles.axes1, 'off');   % Turn off axis labels and ticks
    end

function reset_Callback(hObject, eventdata, handles)
global A1
global A2
A2 = A1
cla(handles.axes2,'reset')

function exit_Callback(hObject, eventdata, handles)
msgbox('thanks for using image processing tool');
pause(1);
close();
close();


%-------------------Convert-----------------------
function gray2binary_Callback(hObject, eventdata, handles)
img_from_axes1 = getimage(handles.axes1);
new_img = GRAY2BINARY(img_from_axes1);
axes(handles.axes2);
imshow(new_img);

function rgp2gray_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);
new_img = RGB2GRAY(img_from_axes1, 2);
axes(handles.axes2);
imshow(new_img);

function rgp2binary_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img_from_axes1 = getimage(handles.axes1);
    new_image = RGB2BINARY(img_from_axes1);
    axes(handles.axes2);
    imshow(new_image);

    
%-------------------Bluring-----------------------
function mean_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    img_from_axes1 = getimage(handles.axes1);
    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end
    new_image = mean_filter(img_gray,3);
    axes(handles.axes2)
    imshow(new_image);

function weighted_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = Blureing(img_gray,'weighted filter');
    axes(handles.axes2);
    imshow(new_image);

    
%-------------------Noise-----------------------    
function s_p_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ps = str2double(get(handles.edit14, 'String'));
pp = str2double(get(handles.edit15, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end
    new_image = salt_pepper_noise(img_gray,ps,pp);
    axes(handles.axes2);
    imshow(new_image);

function Gussian_noise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = Gussian_noise(img_gray,1,20);
    axes(handles.axes2);
    imshow(new_image);
    
function rayleigh_noise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = addRayleighNoise(img_gray,200);
    axes(handles.axes2);
    imshow(new_image);
   
function uniform_noise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = uniform_noise(img_gray,50,100);
    axes(handles.axes2);
    imshow(new_image);

function exponential_noise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = exponential_noise(img_gray,0.04);
    axes(handles.axes2);
    imshow(new_image);


    
%-------------------Point processing-----------------------    
function negative_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = negative(img_gray);
    axes(handles.axes2);
    imshow(new_image);

function gamma_correction_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit16, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = gamma_correction(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);

function log_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
end
new_image = log_transformation(img_gray);
axes(handles.axes2);
imshow(new_image);

function inverse_log_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
end
new_image = inverse_log(img_gray);
axes(handles.axes2);
imshow(new_image);

    
%-------------------Order filters-----------------------    
function min_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit21, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = min_filter(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);
 
function max_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit21, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = max_filter(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);    
    
function median_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit21, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = median_filter(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);       
    
function midpoint_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit21, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = mid_filter(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);        
 
    
%-------------------Histogram-----------------------    
function hist_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);
axes(handles.axes2)
Histogram(img_from_axes1);       

function eqim_Callback(hObject, eventdata, handles)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = histeq(img_gray);
    axes(handles.axes2);
    imshow(new_image);  
 
function histeq_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);
axes(handles.axes2)
HistogramEqualization(img_from_axes1);       

function contrust_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
min = str2double(get(handles.edit3, 'String'));
max = str2double(get(handles.edit5, 'String'));
img_from_axes1 = getimage(handles.axes1);
new_image = ContrastStretching(img_from_axes1,min,max);
axes(handles.axes2)
imshow(new_image);


%-------------------Brightness-----------------------    
function add_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the value from the edit text
editTextValue = str2double(get(handles.edit1, 'String'));
img_from_axes1 = getimage(handles.axes1);

if size(img_from_axes1, 3) == 3 % Check RGB image
    img_gray = RGB2GRAY(img_from_axes1, 2);
else
    img_gray = img_from_axes1;
end

new_image = brightness(img_gray, 1, editTextValue);
axes(handles.axes2);
imshow(new_image);

function mul_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the value from the edit text
editTextValue = str2double(get(handles.edit1, 'String'));
img_from_axes1 = getimage(handles.axes1);

if size(img_from_axes1, 3) == 3 % Check RGB image
    img_gray = RGB2GRAY(img_from_axes1, 2);
else
    img_gray = img_from_axes1;
end

new_image = brightness(img_gray, 3, editTextValue);
axes(handles.axes2);
imshow(new_image);

function sub_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Get the value from the edit text
editTextValue = str2double(get(handles.edit1, 'String'));
img_from_axes1 = getimage(handles.axes1);

if size(img_from_axes1, 3) == 3 % Check RGB image
    img_gray = RGB2GRAY(img_from_axes1, 2);
else
    img_gray = img_from_axes1;
end

new_image = brightness(img_gray, 2, editTextValue);
axes(handles.axes2);
imshow(new_image);

function div_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the value from the edit text
editTextValue = str2double(get(handles.edit1, 'String'));
img_from_axes1 = getimage(handles.axes1);

if size(img_from_axes1, 3) == 3 % Check RGB image
    img_gray = RGB2GRAY(img_from_axes1, 2);
else
    img_gray = img_from_axes1;
end

new_image = brightness(img_gray, 4, editTextValue);
axes(handles.axes2);
imshow(new_image);


%-------------------Frequency domain filters-----------------------    
function ideal_low_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit18, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end
    
    new_image = ideal_low(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);

function gaussian_low_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit19, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = gaussian_low(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);

function butterworth_low_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit20, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = butterworth_low(img_gray,editTextValue,2);
    axes(handles.axes2);
    imshow(new_image);

function ideal_high_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit18, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = ideal_high(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);

function gaussian_high_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit19, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = gaussian_high(img_gray,editTextValue);
    axes(handles.axes2);
    imshow(new_image);

function butterworth_high_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
editTextValue = str2double(get(handles.edit20, 'String'));
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = butterworth_high(img_gray,editTextValue,2);
    axes(handles.axes2);
    imshow(new_image);
    
  
 %-------------------Fourier transform -----------------------    
function ff_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = Fourier(img_gray);
    axes(handles.axes2)
    imshow(new_image);

function iff_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);



    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end
    
    f1 = fft2(img_gray);
    
    new_image = Inverse_Fourier(f1);
    axes(handles.axes2)
    imshow(new_image);
    
    
    
%-------------------Edge detection -----------------------
function pointd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = EdgeDetection(img_gray,'laplacian mask',1);
    axes(handles.axes2);
    imshow(new_image);

function hd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = EdgeDetection(img_gray,'sobel mask',1);
    axes(handles.axes2);
    imshow(new_image);

function vd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = EdgeDetection(img_gray,'sobel mask',2);
    axes(handles.axes2);
    imshow(new_image);   
    
function dld_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = EdgeDetection(img_gray,'sobel mask',3);
    axes(handles.axes2);
    imshow(new_image);      
    
function drd_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = EdgeDetection(img_gray,'sobel mask',4);
    axes(handles.axes2);
    imshow(new_image);      
  
  
%-------------------Sharpening -----------------------
function pointsh_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = sharpening(img_gray,5);
    axes(handles.axes2);
    imshow(new_image);

function hsh_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = sharpening(img_gray,1);
    axes(handles.axes2);
    imshow(new_image);

function vsh_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = sharpening(img_gray,2);
    axes(handles.axes2);
    imshow(new_image);   
    
function dlsh_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = sharpening(img_gray,4);
    axes(handles.axes2);
    imshow(new_image);      
    
function drsh_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_from_axes1 = getimage(handles.axes1);

    if size(img_from_axes1, 3) == 3 % Check RGB image
        img_gray = RGB2GRAY(img_from_axes1,2);
    else
        img_gray = img_from_axes1;
    end

    new_image = sharpening(img_gray,3);
    axes(handles.axes2);
    imshow(new_image);        



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit5_Callback(hObject, eventdata, handles)

% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double
% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit18_Callback(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit18 as text
%        str2double(get(hObject,'String')) returns contents of edit18 as a double
% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit19_Callback(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit19 as text
%        str2double(get(hObject,'String')) returns contents of edit19 as a double
% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit20_Callback(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit20 as text
%        str2double(get(hObject,'String')) returns contents of edit20 as a double
% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double
% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double
% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double
% Get the entered value from edit1
enteredValue = str2double(get(hObject, 'String'));

% Store the value in the handles structure
handles.enteredValue = enteredValue;

% Update handles structure
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
