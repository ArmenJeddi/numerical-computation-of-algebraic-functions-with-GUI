function varargout = secondOptionPanel(varargin)
% SECONDOPTIONPANEL MATLAB code for secondOptionPanel.fig
%      SECONDOPTIONPANEL, by itself, creates a new SECONDOPTIONPANEL or raises the existing
%      singleton*.
%
%      H = SECONDOPTIONPANEL returns the handle to a new SECONDOPTIONPANEL or the handle to
%      the existing singleton*.
%
%      SECONDOPTIONPANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECONDOPTIONPANEL.M with the given input arguments.
%
%      SECONDOPTIONPANEL('Property','Value',...) creates a new SECONDOPTIONPANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before secondOptionPanel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to secondOptionPanel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help secondOptionPanel

% Last Modified by GUIDE v2.5 08-Dec-2016 20:10:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @secondOptionPanel_OpeningFcn, ...
                   'gui_OutputFcn',  @secondOptionPanel_OutputFcn, ...
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


% --- Executes just before secondOptionPanel is made visible.
function secondOptionPanel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to secondOptionPanel (see VARARGIN)

% Choose default command line output for secondOptionPanel
handles.output = hObject;

handles.parent = varargin{1}.thisWin;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes secondOptionPanel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = secondOptionPanel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ch2secondBackPB.
function ch2secondBackPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondBackPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf) ;
set(handles.parent , 'Visible' , 'on');
