function varargout = Assignment2(varargin)
% ASSIGNMENT2 MATLAB code for Assignment2.fig
%      ASSIGNMENT2, by itself, creates a new ASSIGNMENT2 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT2 returns the handle to a new ASSIGNMENT2 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT2.M with the given input arguments.
%
%      ASSIGNMENT2('Property','Value',...) creates a new ASSIGNMENT2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Assignment2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Assignment2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment2

% Last Modified by GUIDE v2.5 08-Jan-2022 22:45:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment2_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment2_OutputFcn, ...
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


% --- Executes just before Assignment2 is made visible.
function Assignment2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Assignment2 (see VARARGIN)

% Choose default command line output for Assignment2
handles.output = hObject;
global xlimit;
xlimit=[-1 1];
global ylimit;
ylimit=[-1 1];
global scalarOperation;
scalarOperation = '-';
global vectorOperation;
vectorOperation = '-';
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function scalarInput1_Callback(hObject, eventdata, handles)
% hObject    handle to scalarInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scalarInput1 as text
%        str2double(get(hObject,'String')) returns contents of scalarInput1 as a double
global scalarInput1;
scalarInput1 = str2double(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function scalarInput1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scalarInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scalarInput2_Callback(hObject, eventdata, handles)
% hObject    handle to scalarInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scalarInput2 as text
%        str2double(get(hObject,'String')) returns contents of scalarInput2 as a double
global scalarInput2;
scalarInput2 = str2double(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function scalarInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scalarInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in scalarCalculate.
function scalarCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to scalarCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global scalarInput1;
global scalarInput2;
global scalarOperation;

switch scalarOperation
    case '-'
        result = scalarInput1-scalarInput2;
    case '+'
        result = scalarInput1+scalarInput2;
    case '/'
        result = scalarInput1./scalarInput2;
    case '*'
        result = scalarInput1.*scalarInput2;
end
if result == Inf 
    set(handles.scalarConsole,'String',"can't deivide by zero");
    set(handles.scalarOutput,'String',"");
elseif isnan(result)
    set(handles.scalarConsole,'String',"at least one of the operands isn't number");
    set(handles.scalarOutput,'String',"");
else
    set(handles.scalarConsole,'String',"");
    set(handles.scalarOutput,'String',result);
end

function equationInput_Callback(hObject, eventdata, handles)
% hObject    handle to equationInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equationInput as text
%        str2double(get(hObject,'String')) returns contents of equationInput as a double
global equation;
equation = get(hObject,'String');

% --- Executes during object creation, after setting all properties.
function equationInput_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equationInput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vectorInput1_Callback(hObject, eventdata, handles)
% hObject    handle to vectorInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vectorInput1 as text
%        str2double(get(hObject,'String')) returns contents of vectorInput1 as a double
global vectorInput1;
vectorInput1 = str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function vectorInput1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vectorInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vectorInput2_Callback(hObject, eventdata, handles)
% hObject    handle to vectorInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vectorInput2 as text
%        str2double(get(hObject,'String')) returns contents of vectorInput2 as a double
global vectorInput2;
vectorInput2 = str2num(get(hObject,'String'));


% --- Executes during object creation, after setting all properties.
function vectorInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vectorInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in vectorOperationList.
function vectorOperationList_Callback(hObject, eventdata, handles)
% hObject    handle to vectorOperationList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns vectorOperationList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from vectorOperationList
global vectorOperation;
contents = cellstr(get(hObject,'String'));
vectorOperation = contents{get(hObject,'Value')};
set(handles.vectorOperation,'String',vectorOperation);


% --- Executes during object creation, after setting all properties.
function vectorOperationList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vectorOperationList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in scalarOperationList.
function scalarOperationList_Callback(hObject, eventdata, handles)
% hObject    handle to scalarOperationList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns scalarOperationList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from scalarOperationList
global scalarOperation;
contents = cellstr(get(hObject,'String'));
scalarOperation = contents{get(hObject,'Value')};
set(handles.scalarOperation,'String',scalarOperation);

% --- Executes during object creation, after setting all properties.
function scalarOperationList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scalarOperationList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in xyRadio.
function xyRadio_Callback(hObject, eventdata, handles)
% hObject    handle to xyRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of xyRadio
global plottingOption;
plottingOption = 'xy';

% --- Executes on button press in resultRadio.
function resultRadio_Callback(hObject, eventdata, handles)
% hObject    handle to resultRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of resultRadio
global plottingOption;
plottingOption = 'result';

% --- Executes on button press in equationRadio.
function equationRadio_Callback(hObject, eventdata, handles)
% hObject    handle to equationRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of equationRadio
global plottingOption;
plottingOption = 'equation';

% --- Executes on button press in sineRadio.
function sineRadio_Callback(hObject, eventdata, handles)
% hObject    handle to sineRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sineRadio
global plottingOption;
plottingOption = 'sine';

% --- Executes on button press in cosineRadio.
function cosineRadio_Callback(hObject, eventdata, handles)
% hObject    handle to cosineRadio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cosineRadio
global plottingOption;
plottingOption = 'cosine';

% --- Executes on button press in plot.
function plot_Callback(hObject, eventdata, handles)
% hObject    handle to plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xlimit;
global ylimit;
global equation;
global plottingOption;
global vectorResult;
global vectorInput1;
global vectorInput2;
switch plottingOption
    case 'equation'
        ezplot(equation);
    case 'result'
        scatter(vectorResult,zeros(size(vectorResult)),'b','filled');
    case 'sine'
        x = linspace(xlimit(1),xlimit(2),100);
        plot(x,sin(x));
    case 'cosine'
        x = linspace(xlimit(1),xlimit(2),100);
        plot(x,cos(x));
    case 'xy'
        scatter(vectorInput1,vectorInput2,'b','filled');
end
axis([xlimit ylimit]);

% --- Executes on button press in clearPlot.
function clearPlot_Callback(hObject, eventdata, handles)
% hObject    handle to clearPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;

% --- Executes on button press in vectorCalculate.
function vectorCalculate_Callback(hObject, eventdata, handles)
% hObject    handle to vectorCalculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global vectorInput1;
global vectorInput2;
global vectorOperation;
global vectorResult;
try
    switch vectorOperation
        case '-'
            vectorResult = vectorInput1-vectorInput2;
        case '+'
            vectorResult = vectorInput1+vectorInput2;
        case '/'
            vectorResult = vectorInput1./vectorInput2;
        case '*'
            vectorResult = vectorInput1.*vectorInput2;
    end
    if  sum(ismember(vectorResult ,Inf)) > 0
        set(handles.vectorConsole,'String',"can't deivide by zero");
        set(handles.vectorOutput,'String',"");
    elseif isnan(vectorResult)
        set(handles.vectorConsole,'String',"at least one of the operands isn't number");
        set(handles.vectorOutput,'String',"");
    else
        set(handles.vectorConsole,'String',"");
        set(handles.vectorOutput,'String',num2str(vectorResult));
    end
catch ex
    set(handles.vectorConsole,'String',"at least one of the operands isn't number");
    set(handles.vectorOutput,'String',"");
end


function xlim_Callback(hObject, eventdata, handles)
% hObject    handle to xlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xlim as text
%        str2double(get(hObject,'String')) returns contents of xlim as a double
global xlimit;
xlimit = str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function xlim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ylim_Callback(hObject, eventdata, handles)
% hObject    handle to ylim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ylim as text
%        str2double(get(hObject,'String')) returns contents of ylim as a double
global ylimit;
ylimit = str2num(get(hObject,'String'));

% --- Executes during object creation, after setting all properties.
function ylim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ylim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
