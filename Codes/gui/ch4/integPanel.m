function varargout = integPanel(varargin)
% INTEGPANEL MATLAB code for integPanel.fig
%      INTEGPANEL, by itself, creates a new INTEGPANEL or raises the existing
%      singleton*.
%
%      H = INTEGPANEL returns the handle to a new INTEGPANEL or the handle to
%      the existing singleton*.
%
%      INTEGPANEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTEGPANEL.M with the given input arguments.
%
%      INTEGPANEL('Property','Value',...) creates a new INTEGPANEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before integPanel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to integPanel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help integPanel

% Last Modified by GUIDE v2.5 08-Jan-2017 11:47:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @integPanel_OpeningFcn, ...
                   'gui_OutputFcn',  @integPanel_OutputFcn, ...
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


% --- Executes just before integPanel is made visible.
function integPanel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to integPanel (see VARARGIN)

% Choose default command line output for integPanel
handles.output = hObject;

handles.FPD = varargin{1}.FPD;
handles.parent = varargin{1}.thisWin ;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes integPanel wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = integPanel_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ch4IntegIntvlStart_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegIntvlStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4IntegIntvlStart as text
%        str2double(get(hObject,'String')) returns contents of ch4IntegIntvlStart as a double


% --- Executes during object creation, after setting all properties.
function ch4IntegIntvlStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4IntegIntvlStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4IntegIntvlEnd_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegIntvlEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4IntegIntvlEnd as text
%        str2double(get(hObject,'String')) returns contents of ch4IntegIntvlEnd as a double


% --- Executes during object creation, after setting all properties.
function ch4IntegIntvlEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4IntegIntvlEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4IntegFn_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4IntegFn as text
%        str2double(get(hObject,'String')) returns contents of ch4IntegFn as a double


% --- Executes during object creation, after setting all properties.
function ch4IntegFn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4IntegFn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4IntegH_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4IntegH as text
%        str2double(get(hObject,'String')) returns contents of ch4IntegH as a double


% --- Executes during object creation, after setting all properties.
function ch4IntegH_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4IntegH (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch4IntegHideStepsCB.
function ch4IntegHideStepsCB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegHideStepsCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch4IntegHideStepsCB

if get(hObject, 'Value') == 0,
    set(handles.ch4IntegStepsLB, 'Visible', 'on');
else
    set(handles.ch4IntegStepsLB, 'Visible', 'off');
end


% --- Executes on selection change in ch4IntegStepsLB.
function ch4IntegStepsLB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ch4IntegStepsLB contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ch4IntegStepsLB


% --- Executes during object creation, after setting all properties.
function ch4IntegStepsLB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4IntegStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4IntegFRes_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegFRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4IntegFRes as text
%        str2double(get(hObject,'String')) returns contents of ch4IntegFRes as a double


% --- Executes during object creation, after setting all properties.
function ch4IntegFRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4IntegFRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch4IntegN_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch4IntegN as text
%        str2double(get(hObject,'String')) returns contents of ch4IntegN as a double


% --- Executes during object creation, after setting all properties.
function ch4IntegN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch4IntegN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch4IntegCalcPB.
function ch4IntegCalcPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegCalcPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

F_str = get(handles.ch4IntegFn, 'String');
a = str2double(get(handles.ch4IntegIntvlStart, 'String'));
b = str2double(get(handles.ch4IntegIntvlEnd, 'String'));

if strcmp(F_str, '')
    errordlg('You should enter the function!');
    return
end

if isnan(a) || isnan(b) || ~isreal(a) || ~isreal(b)
    errordlg('Unvalid Endpoints! The endpoints of the interval should be real numbers!');
    return
end

intvl = [a, b];

if get(handles.ch4IntegRombRB, 'Value') == 1
    [steps, res] = romberg(F_str, intvl, handles.FPD);
    
elseif get(handles.ch4IntegGLRB, 'Value') == 1
    n = str2double(get(handles.ch4IntegN, 'String'));
    if isnan(n) || ~isreal(n) || n < 0 || (floor(n) ~= n)
        errordlg('n should be a non-negative integer!');
    return
    end
    [steps, res] = gauss_legendre(F_str, intvl, n, handles.FPD);
    
else
    h = str2double(get(handles.ch4IntegH, 'String'));
    if isnan(h) || ~isreal(h) || h <= 0
        errordlg('h should be a positive real number!');
    return
    end
    
    errdlg = 'none';
    
    if get(handles.ch4IntegTrpzRB, 'Value') == 1
        [steps, res] = trapezoidal(F_str, intvl, h, handles.FPD);
        
    elseif get(handles.ch4IntegSimp13RB, 'Value') == 1
        [steps, res, errdlg] = ...
            simpson('one third', F_str, intvl, h, handles.FPD);
        
    elseif get(handles.ch4IntegSimp38RB, 'Value') == 1
        [steps, res, errdlg] = ...
            simpson('three eighths', F_str, intvl, h, handles.FPD);
        
    else
        [steps, res, errdlg] = ...
            customized_simpson(F_str, intvl, h, handles.FPD);
        
    end
    
    if ~strcmp(errdlg, 'none')
        errordlg(errdlg);
        return
    end
end

set(handles.ch4IntegStepsLB, 'String', steps);
set(handles.ch4IntegFRes, 'String', char(res));

% --- Executes on button press in ch4IntegBackPB.
function ch4IntegBackPB_Callback(hObject, eventdata, handles)
% hObject    handle to ch4IntegBackPB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close(gcf) ;
set(handles.parent , 'Visible' , 'on');
