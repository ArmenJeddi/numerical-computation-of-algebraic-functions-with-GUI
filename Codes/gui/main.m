

function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 12-Jan-2017 14:20:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

global global_struct; 
global_struct.FPD = 5 ;

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input_Area_Callback(hObject, eventdata, handles)
% hObject    handle to input_Area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_Area as text
%        str2double(get(hObject,'String')) returns contents of input_Area as a double
global global_struct; 
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    set(handles.Chapter1,'Enable','off');
    set(handles.Chapter2,'Enable','off');
    set(handles.Chapter3,'Enable','off');
    set(handles.Chapter4,'Enable','off');
    set(handles.Chapter5,'Enable','off');
    set(handles.Chapter6,'Enable','off');
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
else
    if(floor(input) ~= input || (input < 1))
        set(handles.Chapter1,'Enable','off');
        set(handles.Chapter2,'Enable','off');
        set(handles.Chapter3,'Enable','off');
        set(handles.Chapter4,'Enable','off');
        set(handles.Chapter5,'Enable','off');
        set(handles.Chapter6,'Enable','off');
        errordlg('You must enter a positive integer','Invalid Input','modal')
        uicontrol(hObject)
        return
    else
        set(handles.Chapter1,'Enable','on');
        set(handles.Chapter2,'Enable','on');
        set(handles.Chapter3,'Enable','on'); 
        set(handles.Chapter4,'Enable','on');
        set(handles.Chapter5,'Enable','on');
        set(handles.Chapter6,'Enable','on');
        global FPD
        FPD = input;
        global_struct.FPD = input ; 
        
    end

end



% --- Executes on button press in Chapter1.
function Chapter1_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 
global global_struct;
get(handles.input_Area,'String');
handles.newVar1 = global_struct.FPD ;
handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
untitled(handles)


% --- Executes on button press in Chapter3.
function Chapter3_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_struct;
get(handles.input_Area,'String');
handles.newVar1 = global_struct.FPD ;
handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
ch3(handles)


% --- Executes on button press in Chapter2.
function Chapter2_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_struct;
get(handles.input_Area,'String');
handles.newVar1 = global_struct.FPD ;
handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
ch2menu(handles)


% --- Executes on button press in Chapter6.
function Chapter6_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_struct;
get(handles.input_Area,'String');
handles.newVar1 = global_struct.FPD ;
handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
ch6(handles)


% --- Executes on button press in Chapter5.
function Chapter5_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_struct;
get(handles.input_Area,'String');
handles.newVar1 = global_struct.FPD ;
handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
ch5GUI(handles)



% --- Executes on button press in Chapter4.
function Chapter4_Callback(hObject, eventdata, handles)
% hObject    handle to Chapter4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global global_struct;
get(handles.input_Area,'String');
handles.newVar1 = global_struct.FPD ;
handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
ch4menu(handles)




% --- Executes during object creation, after setting all properties.
function input_Area_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_Area (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Quit_Button.
function Quit_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Quit_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_response = modaldlg('Title','Confirm Close');
switch user_response
    case 'No'
        %are you sure
    case 'Yes'
        close(gcf) ;
end
%axes(hObject) 
%imshow('simpson1.png') 



% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axes(hObject) 
imshow('simpson1.png') 
% Hint: place code in OpeningFcn to populate axes3
