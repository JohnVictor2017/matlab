function varargout = revisao(varargin)
% REVISAO MATLAB code for revisao.fig
%      REVISAO, by itself, creates a new REVISAO or raises the existing
%      singleton*.
%
%      H = REVISAO returns the handle to a new REVISAO or the handle to
%      the existing singleton*.
%
%      REVISAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REVISAO.M with the given input arguments.
%
%      REVISAO('Property','Value',...) creates a new REVISAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before revisao_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to revisao_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help revisao

% Last Modified by GUIDE v2.5 28-Mar-2019 10:16:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @revisao_OpeningFcn, ...
                   'gui_OutputFcn',  @revisao_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before revisao is made visible.
function revisao_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to revisao (see VARARGIN)

% Choose default command line output for revisao
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes revisao wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = revisao_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_a.
function button_a_Callback(hObject, eventdata, handles)

global n;

[nome diretorio] = uigetfile('*.*','Abrir');
local = fullfile(diretorio, nome);
n = imread(local);

axes(handles.axes1);
imshow(n); title('imagem original');


% --- Executes on button press in button_b.
function button_b_Callback(hObject, eventdata, handles)

global n;
redimensionar = imresize(n,[128,128]);
axes(handles.axes2);
imshow(redimensionar); title('redimensionada 128x128');

% --- Executes on button press in button_c.
function button_c_Callback(hObject, eventdata, handles)
global n;

rotacionar = imrotate(n, 60);
axes(handles.axes3);
imshow(rotacionar); title('rotacionada 60�');

% --- Executes on button press in button_d.
function button_d_Callback(hObject, eventdata, handles)
global n;

figure();
recorte = imcrop(n);
axes(handles.axes4);
imshow(recorte); title('recorte realizado');


% --- Executes on button press in button_e.
function button_e_Callback(hObject, eventdata, handles)
global n;

I = rgb2gray(n)
canny = edge(I, 'canny');
axes(handles.axes5);
imshow(canny); title('filtro canny');


% --- Executes on button press in button_f.
function button_f_Callback(hObject, eventdata, handles)
global n;

% imagens uint8 do tamanho da imagem n inicializadas com 0
img_R=uint8(zeros(size(n)));
img_G=uint8(zeros(size(n)));
img_B=uint8(zeros(size(n)));

img_R(:,:,1) = n(:,:,1);
img_G(:,:,2) = n(:,:,2);
img_B(:,:,3) = n(:,:,3);

figure();
subplot(2,3,2); imshow(n); title('imagem original');
subplot(2,3,4); imshow(img_R); title('canal vermelho');
subplot(2,3,5); imshow(img_G); title('canal verde');
subplot(2,3,6); imshow(img_B); title('canal azul');



% --- Executes on button press in button_g.
function button_g_Callback(hObject, eventdata, handles)
close all;