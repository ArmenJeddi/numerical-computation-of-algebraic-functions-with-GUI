function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 17-Dec-2016 06:51:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function funcText_Callback(hObject, eventdata, handles)
% hObject    handle to funcText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of funcText as text
%        str2double(get(hObject,'String')) returns contents of funcText as a double


% --- Executes during object creation, after setting all properties.
function funcText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

  f = get(handles.funcText, 'String');
  vars = [];
  varsValues = ones(0, 1);
  absuluteIn = ones(0, 1);
  parametricVars = ['b'];
  try
    vars = [vars;'a'];
    varsValues = [varsValues;str2num(get(handles.aValText, 'String'))];
%     varsValues(1) = str2num(get(handles.aValText, 'String'));
    absuluteIn = [absuluteIn;str2num(get(handles.aErrText, 'String'))];
%     absuluteIn(1) = str2num(get(handles.aErrText, 'String'));
  catch
      
  end
  
  try
      vars = [vars;'b'];
      varsValues = [varsValues;str2num(get(handles.bValText, 'String'))];
      absuluteIn = [absuluteIn;str2num(get(handles.bErrText, 'String'))];
  catch
  end
  
  try
      vars = [vars;'c'];
      varsValues = [varsValues;str2num(get(handles.cValText, 'String'))];
      absuluteIn = [absuluteIn;str2num(get(handles.cErrText, 'String'))];
  catch
  end
  
  try
      vars = [vars;'d'];
      varsValues = [varsValues;str2num(get(handles.dValText, 'String'))];
      absuluteIn = [absuluteIn;str2num(get(handles.dErrText, 'String'))];
  catch
  end
  
  try
      vars = [vars;'e'];
      varsValues = [varsValues;str2num(get(handles.eValText, 'String'))];
      absuluteIn = [absuluteIn;str2num(get(handles.eErrText, 'String'))];
  catch
  end
  
  try
      vars = [vars;'f'];
      varsValues = [varsValues;str2num(get(handles.fValText, 'String'))];
      absuluteIn = [absuluteIn;str2num(get(handles.fErrText, 'String'))];
  catch
  end
  [steps, relError, AbsError, val] = calcErrorsInStep(f, vars, varsValues,absuluteIn, parametricVars);
  
%  class(num(val(size(val, 1))))
 set(handles.Answer, 'String', char((val(size(val, 1)))));
  
h = uimulticollist (gcf);
set(h, 'Position', [100 200 500 100]);
% rowItems = {'step', 'Abs Error', 'Rel Error', 'val'};
uimulticollist(h, 'addCol', {'step'}, 1, 'GREEN');
uimulticollist(h, 'addCol', {'Abs Error'}, 2, 'RED');
uimulticollist(h, 'addCol', {'Rel Error'}, 2, 'BLUE');
uimulticollist(h, 'changeRow', {'step', 'Rel Error', 'Abs Error', 'val'}, 1 );
% num2str(double(relError(1)))
% num2str(AbsError{1})
% num2str(val{1})
for i = 1:size(steps, 1)
    if(isa(AbsError(i), 'double'))
        uimulticollist(h, 'addRow', {steps{i}, num2str(double(relError(i))), num2str(double(AbsError(i))), num2str(double(val(i)))}, 2, 'RED');
    else
        uimulticollist(h, 'addRow', {steps{i}, char(relError(i)), char(AbsError(i)), char(val(i))}, 2, 'RED');
    end
end

% uimulticollist(h, 'addRow', {'1', 'qq', 'rrr'}, 2);


function dErrText_Callback(hObject, eventdata, handles)
% hObject    handle to dErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dErrText as text
%        str2double(get(hObject,'String')) returns contents of dErrText as a double


% --- Executes during object creation, after setting all properties.
function dErrText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dValText_Callback(hObject, eventdata, handles)
% hObject    handle to dValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dValText as text
%        str2double(get(hObject,'String')) returns contents of dValText as a double


% --- Executes during object creation, after setting all properties.
function dValText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in d_par_button.
function d_par_button_Callback(hObject, eventdata, handles)
% hObject    handle to d_par_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of d_par_button



function bErrText_Callback(hObject, eventdata, handles)
% hObject    handle to bErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bErrText as text
%        str2double(get(hObject,'String')) returns contents of bErrText as a double


% --- Executes during object creation, after setting all properties.
function bErrText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function bValText_Callback(hObject, eventdata, handles)
% hObject    handle to bValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of bValText as text
%        str2double(get(hObject,'String')) returns contents of bValText as a double


% --- Executes during object creation, after setting all properties.
function bValText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in b_par_button.
function b_par_button_Callback(hObject, eventdata, handles)
% hObject    handle to b_par_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of b_par_button



function fErrText_Callback(hObject, eventdata, handles)
% hObject    handle to fErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fErrText as text
%        str2double(get(hObject,'String')) returns contents of fErrText as a double


% --- Executes during object creation, after setting all properties.
function fErrText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fValText_Callback(hObject, eventdata, handles)
% hObject    handle to fValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fValText as text
%        str2double(get(hObject,'String')) returns contents of fValText as a double



% --- Executes during object creation, after setting all properties.
function fValText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in f_par_button.
function f_par_button_Callback(hObject, eventdata, handles)
% hObject    handle to f_par_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of f_par_button



function eErrText_Callback(hObject, eventdata, handles)
% hObject    handle to eErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eErrText as text
%        str2double(get(hObject,'String')) returns contents of eErrText as a double


% --- Executes during object creation, after setting all properties.
function eErrText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eValText_Callback(hObject, eventdata, handles)
% hObject    handle to eValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eValText as text
%        str2double(get(hObject,'String')) returns contents of eValText as a double


% --- Executes during object creation, after setting all properties.
function eValText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in e_par_button.
function e_par_button_Callback(hObject, eventdata, handles)
% hObject    handle to e_par_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of e_par_button



function cErrText_Callback(hObject, eventdata, handles)
% hObject    handle to cErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cErrText as text
%        str2double(get(hObject,'String')) returns contents of cErrText as a double


% --- Executes during object creation, after setting all properties.
function cErrText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cValText_Callback(hObject, eventdata, handles)
% hObject    handle to cValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cValText as text
%        str2double(get(hObject,'String')) returns contents of cValText as a double


% --- Executes during object creation, after setting all properties.
function cValText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in c_par_button.
function c_par_button_Callback(hObject, eventdata, handles)
% hObject    handle to c_par_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of c_par_button


% --- Executes on button press in a_par_button.
function a_par_button_Callback(hObject, eventdata, handles)
% hObject    handle to a_par_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of a_par_button



function aValText_Callback(hObject, eventdata, handles)
% set(handles.aValText, 'String', '');
% hObject    handle to aValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aValText as text
%        str2double(get(hObject,'String')) returns contents of aValText as a double


% --- Executes during object creation, after setting all properties.
function aValText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function aErrText_Callback(hObject, eventdata, handles)
% hObject    handle to aErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of aErrText as text
%        str2double(get(hObject,'String')) returns contents of aErrText as a double


% --- Executes during object creation, after setting all properties.
function aErrText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to aErrText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over aValText.
function aValText_ButtonDownFcn(hObject, eventdata, handles)
% set(hObject, 'String', '');
% set(handles.aValText, 'String', '');
% hObject    handle to aValText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on aValText and none of its controls.
function aValText_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to aValText (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
