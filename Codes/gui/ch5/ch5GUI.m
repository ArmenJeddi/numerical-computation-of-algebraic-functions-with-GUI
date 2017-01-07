function varargout = ch5GUI(varargin)
% CH5GUI MATLAB code for ch5GUI.fig
%      CH5GUI, by itself, creates a new CH5GUI or raises the existing
%      singleton*.
%
%      H = CH5GUI returns the handle to a new CH5GUI or the handle to
%      the existing singleton*.
%
%      CH5GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CH5GUI.M with the given input arguments.
%
%      CH5GUI('Property','Value',...) creates a new CH5GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ch5GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ch5GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ch5GUI

% Last Modified by GUIDE v2.5 07-Jan-2017 15:57:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ch5GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ch5GUI_OutputFcn, ...
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


% --- Executes just before ch5GUI is made visible.
function ch5GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ch5GUI (see VARARGIN)

% Choose default command line output for ch5GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ch5GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ch5GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox.
function listbox_Callback(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox


% --- Executes during object creation, after setting all properties.
function listbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eq_Callback(hObject, eventdata, handles)
% hObject    handle to eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq as text
%        str2double(get(hObject,'String')) returns contents of eq as a double


% --- Executes during object creation, after setting all properties.
function eq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0Text_Callback(hObject, eventdata, handles)
% hObject    handle to y0Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0Text as text
%        str2double(get(hObject,'String')) returns contents of y0Text as a double


% --- Executes during object creation, after setting all properties.
function y0Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0Text_Callback(hObject, eventdata, handles)
% hObject    handle to x0Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0Text as text
%        str2double(get(hObject,'String')) returns contents of x0Text as a double


% --- Executes during object creation, after setting all properties.
function x0Text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0Text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xnText_Callback(hObject, eventdata, handles)
% hObject    handle to xnText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xnText as text
%        str2double(get(hObject,'String')) returns contents of xnText as a double


% --- Executes during object creation, after setting all properties.
function xnText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xnText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hText_Callback(hObject, eventdata, handles)
% hObject    handle to hText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hText as text
%        str2double(get(hObject,'String')) returns contents of hText as a double


% --- Executes during object creation, after setting all properties.
function hText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TaylorOrderText_Callback(hObject, eventdata, handles)
% hObject    handle to TaylorOrderText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TaylorOrderText as text
%        str2double(get(hObject,'String')) returns contents of TaylorOrderText as a double


% --- Executes during object creation, after setting all properties.
function TaylorOrderText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TaylorOrderText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in FirstOrderButt.
function FirstOrderButt_Callback(hObject, eventdata, handles)

    f = get(handles.eq, 'String');
    y0 = str2double(get(handles.y0Text, 'String'));
    x0 = str2double(get(handles.x0Text, 'String'));
    xn = str2double(get(handles.xnText, 'String'));
    nForTaylor= 0;
    FPD = 8;
    method = get(handles.popupmenu1, 'Value');
    if (method == 1)
        h = 0.01;
        mode = 6;
    else
        mode = method - 1;
        h = str2double(get(handles.hText, 'String'));
        if (method == 2)
            nForTaylor = str2double(get(handles.TaylorOrderText, 'String'));
        end
    end
%     switch method
%         case 'Default'
%             h = 0.01;
%             mode = 6;
%         case 'Taylor'
%             h = str2double(get(handles.hText, 'String'));
%             mode = 1;
%             nForTaylor = str2double(get(handles.TaylorOrderText, 'String'));
%         case 'Euler'
%             mode = 2;
%             h = str2double(get(handles.hText, 'String'));
%         case 'Modified Euler'
%             mode = 3;
%             h = str2double(get(handles.hText, 'String'));
%         case 'Runge-Kutta(Mid-Point)'
%             mode = 4;
%             h = str2double(get(handles.hText, 'String'));
%         case 'Runge-Kutta(3rd Order)'
%             mode = 5;
%             h = str2double(get(handles.hText, 'String'));
%         case 'Runge-Kutta(4th Order)'
%             mode = 6;
%             h = str2double(get(handles.hText, 'String'));
%         case 'Adams-Moulton'
%             mode = 7;
%             h = str2double(get(handles.hText, 'String'));
%     end
    
    [steps, anss] = chapter5core1Order( f, y0, x0, h, xn, mode, nForTaylor, FPD);
    set(handles.listbox, 'String', steps);
    
% hObject    handle to FirstOrderButt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
