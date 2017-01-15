function varargout = diffPanel(varargin)
% DIFFPANEL MATLAB code for diffPanel.fig
%      DIFFPANEL, by itself, creates a new DIFFPANEL or raises the existing
%      singleton*.
%
%      H = DIFFPANEL returns the handle to a new DIFFPANEL or the handle to
%      the existing singleton*.
%
%      DIFFPANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIFFPANEL.M with the given input arguments.
%
%      DIFFPANEL('Property','Value',...) creates a new DIFFPANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before diffPanel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to diffPanel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help diffPanel

% Last Modified by GUIDE v2.5 12-Jan-2017 14:20:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @diffPanel_OpeningFcn, ...
                   'gui_OutputFcn',  @diffPanel_OutputFcn, ...
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


% --- Executes just before diffPanel is made visible.
function diffPanel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to diffPanel (see VARARGIN)

% Choose default command line output for diffPanel
handles.output = hObject;

handles.FPD = varargin{1}.FPD;
handles.parent = varargin{1}.thisWin ;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes diffPanel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = diffPanel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ch4DiffHideStepsCB.
function ch4DiffHideStepsCB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffHideStepsCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch4DiffHideStepsCB

if get(hObject, 'Value') == 0,
    set(handles.ch4DiffStepsLB, 'Visible', 'on');
else
    set(handles.ch4DiffStepsLB, 'Visible', 'off');
end

% --- Executes on selection change in ch4DiffStepsLB.
function ch4DiffStepsLB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ch4DiffStepsLB contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ch4DiffStepsLB


% --- Executes during object creation, after setting all properties.
function ch4DiffStepsLB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4DiffStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4DiffFRes_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffFRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4DiffFRes as text
%        str2double(get(hObject,'String')) returns contents of ch4DiffFRes as a double


% --- Executes during object creation, after setting all properties.
function ch4DiffFRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4DiffFRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch4DiffBackPB.
function ch4DiffBackPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffBackPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf) ;
set(handles.parent , 'Visible' , 'on');


% --- Executes on button press in ch4DiffCalcPB.
function ch4DiffCalcPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffCalcPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

F_str = get(handles.ch4DiffFn, 'String');
pt = str2double(get(handles.ch4DiffPt, 'String'));
deg = get(handles.ch4DiffDegPopUp, 'Value');

if get(handles.ch4DiffOh2, 'Value') == 1
    err_or = 2;
else
    err_or = 4;
end

h = str2double(get(handles.ch4DiffH, 'String'));

[steps, res, resR] = diff_main(F_str, pt, deg, err_or, h, handles.FPD);

set(handles.ch4DiffStepsLB, 'String', steps);
set(handles.ch4DiffFRes, 'String', char(res));
set(handles.ch4DiffFResRichExtrpl, 'String', char(resR));


function ch4DiffPt_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffPt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4DiffPt as text
%        str2double(get(hObject,'String')) returns contents of ch4DiffPt as a double


% --- Executes during object creation, after setting all properties.
function ch4DiffPt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4DiffPt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4DiffFn_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4DiffFn as text
%        str2double(get(hObject,'String')) returns contents of ch4DiffFn as a double


% --- Executes during object creation, after setting all properties.
function ch4DiffFn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4DiffFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4DiffH_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4DiffH as text
%        str2double(get(hObject,'String')) returns contents of ch4DiffH as a double


% --- Executes during object creation, after setting all properties.
function ch4DiffH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4DiffH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ch4DiffDegPopUp.
function ch4DiffDegPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffDegPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ch4DiffDegPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ch4DiffDegPopUp


% --- Executes during object creation, after setting all properties.
function ch4DiffDegPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4DiffDegPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4DiffFResRichExtrpl_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffFResRichExtrpl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4DiffFResRichExtrpl as text
%        str2double(get(hObject,'String')) returns contents of ch4DiffFResRichExtrpl as a double


% --- Executes during object creation, after setting all properties.
function ch4DiffFResRichExtrpl_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4DiffFResRichExtrpl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch4DiffResetPB.
function ch4DiffResetPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4DiffResetPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
