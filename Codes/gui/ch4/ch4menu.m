function varargout = ch4menu(varargin)
% CH4MENU MATLAB code for ch4menu.fig
%      CH4MENU, by itself, creates a new CH4MENU or raises the existing
%      singleton*.
%
%      H = CH4MENU returns the handle to a new CH4MENU or the handle to
%      the existing singleton*.
%
%      CH4MENU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CH4MENU.M with the given input arguments.
%
%      CH4MENU('Property','Value',...) creates a new CH4MENU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ch4menu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ch4menu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ch4menu

% Last Modified by GUIDE v2.5 08-Jan-2017 07:57:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ch4menu_OpeningFcn, ...
                   'gui_OutputFcn',  @ch4menu_OutputFcn, ...
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


% --- Executes just before ch4menu is made visible.
function ch4menu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ch4menu (see VARARGIN)

% Choose default command line output for ch4menu
handles.output = hObject;

handles.FPD = varargin{1}.newVar1;
handles.parent = varargin{1}.thisWin ;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ch4menu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ch4menu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ch4MIntegPB.
function ch4MIntegPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4MIntegPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
integPanel(handles);

% --- Executes on button press in ch4MDiffPB.
function ch4MDiffPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4MDiffPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.thisWin = gcf ;
set(gcf , 'Visible' , 'off') ;
diffPanel(handles);


% --- Executes on button press in ch4MBackPB.
function ch4MBackPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4MBackPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf);
set(handles.parent , 'Visible' , 'on');
