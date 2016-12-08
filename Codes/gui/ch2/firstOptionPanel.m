function varargout = firstOptionPanel(varargin)
% FIRSTOPTIONPANEL MATLAB code for firstOptionPanel.fig
%      FIRSTOPTIONPANEL, by itself, creates a new FIRSTOPTIONPANEL or raises the existing
%      singleton*.
%
%      H = FIRSTOPTIONPANEL returns the handle to a new FIRSTOPTIONPANEL or the handle to
%      the existing singleton*.
%
%      FIRSTOPTIONPANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTOPTIONPANEL.M with the given input arguments.
%
%      FIRSTOPTIONPANEL('Property','Value',...) creates a new FIRSTOPTIONPANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before firstOptionPanel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to firstOptionPanel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help firstOptionPanel

% Last Modified by GUIDE v2.5 08-Dec-2016 17:17:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @firstOptionPanel_OpeningFcn, ...
                   'gui_OutputFcn',  @firstOptionPanel_OutputFcn, ...
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


% --- Executes just before firstOptionPanel is made visible.
function firstOptionPanel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to firstOptionPanel (see VARARGIN)

% Choose default command line output for firstOptionPanel
handles.output = hObject;

handles.parent = varargin{1}.thisWin ;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes firstOptionPanel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = firstOptionPanel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ch2firstBackPB.
function ch2firstBackPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2firstBackPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf) ;
set(handles.parent , 'Visible' , 'on');

% --- Executes on button press in ch2firstSolvePB.
function ch2firstSolvePB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2firstSolvePB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

inp_eq = get(handles.ch2firstEq, 'String');
inp_iter = str2num(get(handles.ch2firstIter, 'String'));
inp_intvl = [str2num(get(handles.m1to3intvlStart, 'String')), ...
    str2num(get(handles.m1to3intvlEnd, 'String'))];
inp_initpoint = str2num(get(handles.m4and5initialPoint, 'String'));

disp(inp_eq);% test
disp(inp_iter); %test

if get(handles.bisectionRadio, 'Value') == 1,
    [out_steps, out_res] = bisection(inp_eq, inp_intvl, inp_iter);
elseif get(handles.secantRadio, 'Value') == 1,
    [out_steps, out_res] = secant(inp_eq, inp_intvl, inp_iter);
elseif get(handles.falsePosRadio, 'Value') == 1,
    [out_steps, out_res] = falsePosition(inp_eq, inp_intvl, inp_iter);
elseif get(handles.nrRadio, 'Value') == 1,
    [out_steps, out_res] = newtonRaphson(inp_eq, inp_initpoint, inp_iter);
else
    [out_steps, out_res] = fixedPoint(inp_eq, inp_initpoint, inp_iter);
end

set(handles.ch2firstStepsLB, 'String', out_steps);
set(handles.ch2firstFinalRes, 'String', num2str(out_res));

axes(handles.ch2firstAxes);
ezplot(subs(inp_eq));

% --- Executes on selection change in ch2firstStepsLB.
function ch2firstStepsLB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2firstStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ch2firstStepsLB contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ch2firstStepsLB


% --- Executes during object creation, after setting all properties.
function ch2firstStepsLB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2firstStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch2firstFinalRes_Callback(hObject, eventdata, handles)
% hObject    handle to ch2firstFinalRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch2firstFinalRes as text
%        str2double(get(hObject,'String')) returns contents of ch2firstFinalRes as a double


% --- Executes during object creation, after setting all properties.
function ch2firstFinalRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2firstFinalRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch2firstIter_Callback(hObject, eventdata, handles)
% hObject    handle to ch2firstIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch2firstIter as text
%        str2double(get(hObject,'String')) returns contents of ch2firstIter as a double


% --- Executes during object creation, after setting all properties.
function ch2firstIter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2firstIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch2firstEq_Callback(hObject, eventdata, handles)
% hObject    handle to ch2firstEq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch2firstEq as text
%        str2double(get(hObject,'String')) returns contents of ch2firstEq as a double


% --- Executes during object creation, after setting all properties.
function ch2firstEq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2firstEq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m1to3intvlStart_Callback(hObject, eventdata, handles)
% hObject    handle to m1to3intvlStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m1to3intvlStart as text
%        str2double(get(hObject,'String')) returns contents of m1to3intvlStart as a double


% --- Executes during object creation, after setting all properties.
function m1to3intvlStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m1to3intvlStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m1to3intvlEnd_Callback(hObject, eventdata, handles)
% hObject    handle to m1to3intvlEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m1to3intvlEnd as text
%        str2double(get(hObject,'String')) returns contents of m1to3intvlEnd as a double


% --- Executes during object creation, after setting all properties.
function m1to3intvlEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m1to3intvlEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m4and5initialPoint_Callback(hObject, eventdata, handles)
% hObject    handle to m4and5initialPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of m4and5initialPoint as text
%        str2double(get(hObject,'String')) returns contents of m4and5initialPoint as a double


% --- Executes during object creation, after setting all properties.
function m4and5initialPoint_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m4and5initialPoint (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch2hideGraphCB.
function ch2hideGraphCB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2hideGraphCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch2hideGraphCB
if get(handles.ch2hideGraphCB, 'Value') == 0,
    set(handles.ch2firstAxes, 'Visible', 'on');
    ch2axes1 = get(handles.ch2firstAxes, 'children');
    set(ch2axes1, 'Visible', 'on');
    
else
    ch2axes1 = get(handles.ch2firstAxes, 'children');
    set(ch2axes1, 'Visible', 'off');
    set(handles.ch2firstAxes, 'Visible', 'off');
end

% --- Executes on button press in ch2hideStepsCB.
function ch2hideStepsCB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2hideStepsCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch2hideStepsCB
if get(handles.ch2hideStepsCB, 'Value') == 0,
    set(handles.ch2firstStepsLB, 'Visible', 'on');
else
    set(handles.ch2firstStepsLB, 'Visible', 'off');
end
