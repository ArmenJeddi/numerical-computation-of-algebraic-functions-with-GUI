function varargout = ch2menu(varargin)
% CH2MENU MATLAB code for ch2menu.fig
%      CH2MENU, by itself, creates a new CH2MENU or raises the existing
%      singleton*.
%
%      H = CH2MENU returns the handle to a new CH2MENU or the handle to
%      the existing singleton*.
%
%      CH2MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CH2MENU.M with the given input arguments.
%
%      CH2MENU('Property','Value',...) creates a new CH2MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ch2menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ch2menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ch2menu

% Last Modified by GUIDE v2.5 08-Dec-2016 19:41:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ch2menu_OpeningFcn, ...
                   'gui_OutputFcn',  @ch2menu_OutputFcn, ...
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


% --- Executes just before ch2menu is made visible.
function ch2menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ch2menu (see VARARGIN)

% Choose default command line output for ch2menu
handles.output = hObject;

handles.FPD = varargin{1}.newVar1;
handles.parent = varargin{1}.thisWin ;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ch2menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ch2menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ch2menu1stPB.
function ch2menu1stPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2menu1stPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
firstOptionPanel(handles);

% --- Executes on button press in ch2menu2ndPB.
function ch2menu2ndPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2menu2ndPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
secondOptionPanel(handles);

% --- Executes on button press in ch2menuBackPB.
function ch2menuBackPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2menuBackPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf) ;
set(handles.parent , 'Visible' , 'on');
