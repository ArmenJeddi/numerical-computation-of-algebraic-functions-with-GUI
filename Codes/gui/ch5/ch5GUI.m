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

% Last Modified by GUIDE v2.5 07-Jan-2017 20:41:57

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
    if(get(handles.checkbox1, 'Value')==1)
        set(handles.listbox, 'Visible', 'on');
    else
        set(handles.listbox, 'Visible', 'off');
    end
        
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)

    if (get(handles.popupmenu2, 'Value') == 1)
        set(handles.text15, 'Visible', 'off');
        set(handles.hText2, 'Visible', 'off');
    else
        set(handles.text15, 'Visible', 'on');
        set(handles.hText2, 'Visible', 'on');
        
    end
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
    
    if (get(handles.popupmenu1, 'Value') == 1)
        set(handles.text7, 'Visible', 'off');
        set(handles.text8, 'Visible', 'off');
        set(handles.hText, 'Visible', 'off');
    else
        set(handles.text7, 'Visible', 'on');
        set(handles.text8, 'Visible', 'on');
        set(handles.hText, 'Visible', 'on');
        
    end
    
    
    if (get(handles.popupmenu1, 'Value') == 2)
        set(handles.TaylorOrderText, 'Visible', 'on');
    else
        set(handles.TaylorOrderText, 'Visible', 'off');
    end
        
        
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
try
    f = get(handles.eq, 'String');
    y0 = str2double(get(handles.y0Text, 'String'));
    x0 = str2double(get(handles.x0Text, 'String'));
    xn = str2double(get(handles.xnText, 'String'));
    nForTaylor= 0;
    FPD = 8;
    digits(FPD);
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
    
    [steps, anss] = chapter5core1Order( f, y0, x0, h, xn, mode, nForTaylor, FPD);
    set(handles.listbox, 'String', steps);
    set(handles.ansText, 'String', ['y = ' char(vpa(anss))]);
    
catch
    msgbox('please check the inputs','Invalid Input');
end


function eq1_Callback(hObject, eventdata, handles)
% hObject    handle to eq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq1 as text
%        str2double(get(hObject,'String')) returns contents of eq1 as a double


% --- Executes during object creation, after setting all properties.
function eq1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eq2_Callback(hObject, eventdata, handles)
% hObject    handle to eq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eq2 as text
%        str2double(get(hObject,'String')) returns contents of eq2 as a double


% --- Executes during object creation, after setting all properties.
function eq2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eq2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in seccOrderButt.
function seccOrderButt_Callback(hObject, eventdata, handles)
try
    f = get(handles.eq1, 'String');
    g = get(handles.eq2, 'String');
    x0 = str2double(get(handles.x0Text2, 'String'));
    y0 = str2double(get(handles.y0Text2, 'String'));
    z0 = str2double(get(handles.z0Text2, 'String'));
    xn = str2double(get(handles.xnText2, 'String'));
    method = get(handles.popupmenu2, 'Value');
    FPD = 8;
    digits(FPD);
    if (method == 1)
        mode = 2;
        h = 0.01;
    else
        h = str2double(get(handles.hText2, 'String'));
        mode = method - 1;
    end
    [steps, anss] = chapter5core2Order( f, g ,x0, y0, z0, h, xn, mode, FPD);
    set(handles.listbox, 'String', steps);
    set(handles.ansText, 'String', ['y = ' char(vpa(anss{1})) '  ,z = ' char(vpa(anss{2}))]);
catch
     msgbox('please check the inputs','Invalid Input');
end

function z0Text2_Callback(hObject, eventdata, handles)
% hObject    handle to z0Text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z0Text2 as text
%        str2double(get(hObject,'String')) returns contents of z0Text2 as a double


% --- Executes during object creation, after setting all properties.
function z0Text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z0Text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y0Text2_Callback(hObject, eventdata, handles)
% hObject    handle to y0Text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0Text2 as text
%        str2double(get(hObject,'String')) returns contents of y0Text2 as a double


% --- Executes during object creation, after setting all properties.
function y0Text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0Text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xnText2_Callback(hObject, eventdata, handles)
% hObject    handle to xnText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xnText2 as text
%        str2double(get(hObject,'String')) returns contents of xnText2 as a double


% --- Executes during object creation, after setting all properties.
function xnText2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xnText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function hText2_Callback(hObject, eventdata, handles)
% hObject    handle to hText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of hText2 as text
%        str2double(get(hObject,'String')) returns contents of hText2 as a double


% --- Executes during object creation, after setting all properties.
function hText2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to hText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0Text2_Callback(hObject, eventdata, handles)
% hObject    handle to x0Text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0Text2 as text
%        str2double(get(hObject,'String')) returns contents of x0Text2 as a double


% --- Executes during object creation, after setting all properties.
function x0Text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0Text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
