function varargout = Assignment1(varargin)
% ASSIGNMENT1 MATLAB code for Assignment1.fig
%      ASSIGNMENT1, by itself, creates a new ASSIGNMENT1 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT1 returns the handle to a new ASSIGNMENT1 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT1.M with the given input arguments.
%
%      ASSIGNMENT1('Property','Value',...) creates a new ASSIGNMENT1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment1

% Last Modified by GUIDE v2.5 05-Jan-2022 21:11:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment1_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment1_OutputFcn, ...
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


% --- Executes just before Assignment1 is made visible.
function Assignment1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment1 (see VARARGIN)

% Choose default command line output for Assignment1
handles.output = hObject;
global value;
global happy;
global sad;
value = 0;
happy = imread('Happy.png');
sad = imread('Sad.png');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment1 wait for user response (see UIRESUME)
% uiwait(handles.Image);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function inputField_Callback(hObject, eventdata, handles)
% hObject    handle to inputField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inputField as text
%        str2double(get(hObject,'String')) returns contents of inputField as a double

% --- Executes during object creation, after setting all properties.
function inputField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Submit.
function Submit_Callback(hObject, eventdata, handles)
% hObject    handle to Submit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global value;
global happy;
global sad;
value = str2num(char(get(handles.inputField,'String')));
if(value < 60)
    imshow(happy);
else
    imshow(sad);
end
