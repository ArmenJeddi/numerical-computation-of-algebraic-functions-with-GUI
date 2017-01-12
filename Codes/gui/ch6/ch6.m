function varargout = ch6(varargin)
% CH6 MATLAB code for ch6.fig
%      CH6, by itself, creates a new CH6 or raises the existing
%      singleton*.
%
%      H = CH6 returns the handle to a new CH6 or the handle to
%      the existing singleton*.
%
%      CH6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CH6.M with the given input arguments.
%
%      CH6('Property','Value',...) creates a new CH6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ch6_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ch6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ch6

% Last Modified by GUIDE v2.5 08-Jan-2017 00:06:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ch6_OpeningFcn, ...
                   'gui_OutputFcn',  @ch6_OutputFcn, ...
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


% --- Executes just before ch6 is made visible.
function ch6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ch6 (see VARARGIN)

% Choose default command line output for ch6
handles.output = hObject;
handles.FPD = varargin{1}.newVar1 ;
handles.parent = varargin{1}.thisWin ;
handles.numofpoints = 2 ;
handles.act_type = 1 ;

    bg_image = imread('flash.png');
    set(handles.flash_button, 'CData' , bg_image) ;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ch6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ch6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in option.
function option_Callback(hObject, eventdata, handles)
% hObject    handle to option (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.act_type = get(hObject, 'Value');

if(hObject.Value == 1)
    handles.method_text.Visible = 'On' ;
    handles.methods.Visible = 'On' ;
    handles.methods.Value = 1 ;
    handles.init_text.Visible = 'Off' ;
    for k=1:8
        set(findobj( 'Tag', strjoin({'i', int2str(k)},'') ) , 'Visible', 'Off');
    end
    handles.step.Visible = 'Off' ;
    handles.step_text.Visible = 'Off' ;
else
    handles.method_text.Visible = 'Off' ;
    handles.methods.Visible = 'Off' ;
    handles.init_text.Visible = 'On' ;
    for k=1:handles.numofpoints
        set(findobj( 'Tag', strjoin({'i', int2str(k)},'') ) , 'Visible', 'On');
    end
    handles.step.Visible = 'On' ;
    handles.step_text.Visible = 'On' ;
    
end

guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns option contents as cell array
%        contents{get(hObject,'Value')} returns selected item from option


% --- Executes during object creation, after setting all properties.
function option_CreateFcn(hObject, eventdata, handles)
% hObject    handle to option (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in methods.
function methods_Callback(hObject, eventdata, handles)
% hObject    handle to methods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(hObject.Value == 7 || hObject.Value == 8 )

    handles.init_text.Visible = 'On' ;
    for k=1:handles.numofpoints
        set(findobj( 'Tag', strjoin({'i', int2str(k)},'') ) , 'Visible', 'On');
    end
    handles.step.Visible = 'On' ;
    handles.step_text.Visible = 'On' ;
else    
    handles.init_text.Visible = 'Off' ;
    for k=1:8
        set(findobj( 'Tag', strjoin({'i', int2str(k)},'') ) , 'Visible', 'Off');
    end
    handles.step.Visible = 'Off' ;
    handles.step_text.Visible = 'Off' ;

   
end

guidata(hObject, handles);
% Hints: contents = cellstr(get(hObject,'String')) returns methods contents as cell array
%        contents{get(hObject,'Value')} returns selected item from methods


% --- Executes during object creation, after setting all properties.
function methods_CreateFcn(hObject, eventdata, handles)
% hObject    handle to methods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit259_Callback(hObject, eventdata, handles)
% hObject    handle to edit259 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit259 as text
%        str2double(get(hObject,'String')) returns contents of edit259 as a double


% --- Executes during object creation, after setting all properties.
function edit259_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit259 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_Callback(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of step as text
%        str2double(get(hObject,'String')) returns contents of step as a double


% --- Executes during object creation, after setting all properties.
function step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pnum_Callback(hObject, eventdata, handles)
% hObject    handle to pnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject, 'String')) ;
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
else
    if(floor(input) ~= input || (input < 2))
        errordlg('You must enter a positive integer between 2 and 8','Invalid Input','modal')
        uicontrol(hObject)
        return
    else
        handles.numofpoints = input ;
    end
end

if handles.numofpoints > 8
    set(hObject, 'String', '8');
end

for i = 1:8
    
    for k=1:8
        set(findobj( 'Tag', strjoin({'v', int2str(i),int2str(k)},'') ) , 'String', '');
         
    end  
    set(findobj( 'Tag', strjoin({'i', int2str(i)},'')) , 'Visible', 'Off' );
    set(findobj( 'Tag', strjoin({'x', int2str(i)},'')) , 'String', '' );
    set(findobj( 'Tag', strjoin({'b', int2str(i)},'')) , 'String', '' );
end

for i = 1:handles.numofpoints
    
    for k=1:handles.numofpoints
        set(findobj( 'Tag', strjoin({'v', int2str(i),int2str(k)},'') ) , 'String', num2str(i));
    end  
    
    if handles.option.Value == 1 && handles.methods.Value ~= 7 && handles.methods.Value ~= 8
         set(findobj( 'Tag', strjoin({'i', int2str(i)},'')) , 'Visible', 'Off' );
    else
        if i <= handles.numofpoints
            set(findobj( 'Tag', strjoin({'i', int2str(i)},'')) , 'Visible', 'On' );
            set(findobj( 'Tag', strjoin({'i', int2str(i)},'')) , 'String', num2str(i) );
        end
    end
    
    set(findobj( 'Tag', strjoin({'x', int2str(i)},'')) , 'String', strcat('x',num2str(i)) );
    set(findobj( 'Tag', strjoin({'b', int2str(i)},'')) , 'String', num2str(i) );
    set(findobj( 'Tag', strjoin({'i', int2str(i)},'')) , 'String', num2str(i) );
    
end
  
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of pnum as text
%        str2double(get(hObject,'String')) returns contents of pnum as a double


% --- Executes during object creation, after setting all properties.
function pnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v11_Callback(hObject, eventdata, handles)
% hObject    handle to v11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v11 as text
%        str2double(get(hObject,'String')) returns contents of v11 as a double


% --- Executes during object creation, after setting all properties.
function v11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v21_Callback(hObject, eventdata, handles)
% hObject    handle to v21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v21 as text
%        str2double(get(hObject,'String')) returns contents of v21 as a double


% --- Executes during object creation, after setting all properties.
function v21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v31_Callback(hObject, eventdata, handles)
% hObject    handle to v31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v31 as text
%        str2double(get(hObject,'String')) returns contents of v31 as a double


% --- Executes during object creation, after setting all properties.
function v31_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v41_Callback(hObject, eventdata, handles)
% hObject    handle to v41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v41 as text
%        str2double(get(hObject,'String')) returns contents of v41 as a double


% --- Executes during object creation, after setting all properties.
function v41_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v51_Callback(hObject, eventdata, handles)
% hObject    handle to v51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v51 as text
%        str2double(get(hObject,'String')) returns contents of v51 as a double


% --- Executes during object creation, after setting all properties.
function v51_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v61_Callback(hObject, eventdata, handles)
% hObject    handle to v61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v61 as text
%        str2double(get(hObject,'String')) returns contents of v61 as a double


% --- Executes during object creation, after setting all properties.
function v61_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v71_Callback(hObject, eventdata, handles)
% hObject    handle to v71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v71 as text
%        str2double(get(hObject,'String')) returns contents of v71 as a double


% --- Executes during object creation, after setting all properties.
function v71_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v81_Callback(hObject, eventdata, handles)
% hObject    handle to v81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v81 as text
%        str2double(get(hObject,'String')) returns contents of v81 as a double


% --- Executes during object creation, after setting all properties.
function v81_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v12_Callback(hObject, eventdata, handles)
% hObject    handle to v12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v12 as text
%        str2double(get(hObject,'String')) returns contents of v12 as a double


% --- Executes during object creation, after setting all properties.
function v12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v22_Callback(hObject, eventdata, handles)
% hObject    handle to v22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v22 as text
%        str2double(get(hObject,'String')) returns contents of v22 as a double


% --- Executes during object creation, after setting all properties.
function v22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v32_Callback(hObject, eventdata, handles)
% hObject    handle to v32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v32 as text
%        str2double(get(hObject,'String')) returns contents of v32 as a double


% --- Executes during object creation, after setting all properties.
function v32_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v42_Callback(hObject, eventdata, handles)
% hObject    handle to v42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v42 as text
%        str2double(get(hObject,'String')) returns contents of v42 as a double


% --- Executes during object creation, after setting all properties.
function v42_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v52_Callback(hObject, eventdata, handles)
% hObject    handle to v52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v52 as text
%        str2double(get(hObject,'String')) returns contents of v52 as a double


% --- Executes during object creation, after setting all properties.
function v52_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v62_Callback(hObject, eventdata, handles)
% hObject    handle to v62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v62 as text
%        str2double(get(hObject,'String')) returns contents of v62 as a double


% --- Executes during object creation, after setting all properties.
function v62_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v72_Callback(hObject, eventdata, handles)
% hObject    handle to v72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v72 as text
%        str2double(get(hObject,'String')) returns contents of v72 as a double


% --- Executes during object creation, after setting all properties.
function v72_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v72 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v82_Callback(hObject, eventdata, handles)
% hObject    handle to v82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v82 as text
%        str2double(get(hObject,'String')) returns contents of v82 as a double


% --- Executes during object creation, after setting all properties.
function v82_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v13_Callback(hObject, eventdata, handles)
% hObject    handle to v13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v13 as text
%        str2double(get(hObject,'String')) returns contents of v13 as a double


% --- Executes during object creation, after setting all properties.
function v13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v23_Callback(hObject, eventdata, handles)
% hObject    handle to v23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v23 as text
%        str2double(get(hObject,'String')) returns contents of v23 as a double


% --- Executes during object creation, after setting all properties.
function v23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v33_Callback(hObject, eventdata, handles)
% hObject    handle to v33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v33 as text
%        str2double(get(hObject,'String')) returns contents of v33 as a double


% --- Executes during object creation, after setting all properties.
function v33_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v43_Callback(hObject, eventdata, handles)
% hObject    handle to v43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v43 as text
%        str2double(get(hObject,'String')) returns contents of v43 as a double


% --- Executes during object creation, after setting all properties.
function v43_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v53_Callback(hObject, eventdata, handles)
% hObject    handle to v53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v53 as text
%        str2double(get(hObject,'String')) returns contents of v53 as a double


% --- Executes during object creation, after setting all properties.
function v53_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v63_Callback(hObject, eventdata, handles)
% hObject    handle to v63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v63 as text
%        str2double(get(hObject,'String')) returns contents of v63 as a double


% --- Executes during object creation, after setting all properties.
function v63_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v73_Callback(hObject, eventdata, handles)
% hObject    handle to v73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v73 as text
%        str2double(get(hObject,'String')) returns contents of v73 as a double


% --- Executes during object creation, after setting all properties.
function v73_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v73 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v83_Callback(hObject, eventdata, handles)
% hObject    handle to v83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v83 as text
%        str2double(get(hObject,'String')) returns contents of v83 as a double


% --- Executes during object creation, after setting all properties.
function v83_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v14_Callback(hObject, eventdata, handles)
% hObject    handle to v14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v14 as text
%        str2double(get(hObject,'String')) returns contents of v14 as a double


% --- Executes during object creation, after setting all properties.
function v14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v24_Callback(hObject, eventdata, handles)
% hObject    handle to v24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v24 as text
%        str2double(get(hObject,'String')) returns contents of v24 as a double


% --- Executes during object creation, after setting all properties.
function v24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v34_Callback(hObject, eventdata, handles)
% hObject    handle to v34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of v34 as text
%  input = str2double(get(hObject,'String'));
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end


% --- Executes during object creation, after setting all properties.
function v34_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v44_Callback(hObject, eventdata, handles)
% hObject    handle to v44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v44 as text
%        str2double(get(hObject,'String')) returns contents of v44 as a double


% --- Executes during object creation, after setting all properties.
function v44_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v54_Callback(hObject, eventdata, handles)
% hObject    handle to v54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v54 as text
%        str2double(get(hObject,'String')) returns contents of v54 as a double


% --- Executes during object creation, after setting all properties.
function v54_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v64_Callback(hObject, eventdata, handles)
% hObject    handle to v64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v64 as text
%        str2double(get(hObject,'String')) returns contents of v64 as a double


% --- Executes during object creation, after setting all properties.
function v64_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v74_Callback(hObject, eventdata, handles)
% hObject    handle to v74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v74 as text
%        str2double(get(hObject,'String')) returns contents of v74 as a double


% --- Executes during object creation, after setting all properties.
function v74_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v74 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v84_Callback(hObject, eventdata, handles)
% hObject    handle to v84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v84 as text
%        str2double(get(hObject,'String')) returns contents of v84 as a double


% --- Executes during object creation, after setting all properties.
function v84_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v15_Callback(hObject, eventdata, handles)
% hObject    handle to v15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v15 as text
%        str2double(get(hObject,'String')) returns contents of v15 as a double


% --- Executes during object creation, after setting all properties.
function v15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v25_Callback(hObject, eventdata, handles)
% hObject    handle to v25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v25 as text
%        str2double(get(hObject,'String')) returns contents of v25 as a double


% --- Executes during object creation, after setting all properties.
function v25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v35_Callback(hObject, eventdata, handles)
% hObject    handle to v35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v35 as text
%        str2double(get(hObject,'String')) returns contents of v35 as a double


% --- Executes during object creation, after setting all properties.
function v35_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v45_Callback(hObject, eventdata, handles)
% hObject    handle to v45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v45 as text
%        str2double(get(hObject,'String')) returns contents of v45 as a double


% --- Executes during object creation, after setting all properties.
function v45_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v55_Callback(hObject, eventdata, handles)
% hObject    handle to v55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v55 as text
%        str2double(get(hObject,'String')) returns contents of v55 as a double


% --- Executes during object creation, after setting all properties.
function v55_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v65_Callback(hObject, eventdata, handles)
% hObject    handle to v65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v65 as text
%        str2double(get(hObject,'String')) returns contents of v65 as a double


% --- Executes during object creation, after setting all properties.
function v65_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v75_Callback(hObject, eventdata, handles)
% hObject    handle to v75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v75 as text
%        str2double(get(hObject,'String')) returns contents of v75 as a double


% --- Executes during object creation, after setting all properties.
function v75_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v75 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v85_Callback(hObject, eventdata, handles)
% hObject    handle to v85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v85 as text
%        str2double(get(hObject,'String')) returns contents of v85 as a double


% --- Executes during object creation, after setting all properties.
function v85_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v16_Callback(hObject, eventdata, handles)
% hObject    handle to v16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v16 as text
%        str2double(get(hObject,'String')) returns contents of v16 as a double


% --- Executes during object creation, after setting all properties.
function v16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v26_Callback(hObject, eventdata, handles)
% hObject    handle to v26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v26 as text
%        str2double(get(hObject,'String')) returns contents of v26 as a double


% --- Executes during object creation, after setting all properties.
function v26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v36_Callback(hObject, eventdata, handles)
% hObject    handle to v36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v36 as text
%        str2double(get(hObject,'String')) returns contents of v36 as a double


% --- Executes during object creation, after setting all properties.
function v36_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v46_Callback(hObject, eventdata, handles)
% hObject    handle to v46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v46 as text
%        str2double(get(hObject,'String')) returns contents of v46 as a double


% --- Executes during object creation, after setting all properties.
function v46_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v56_Callback(hObject, eventdata, handles)
% hObject    handle to v56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v56 as text
%        str2double(get(hObject,'String')) returns contents of v56 as a double


% --- Executes during object creation, after setting all properties.
function v56_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v66_Callback(hObject, eventdata, handles)
% hObject    handle to v66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v66 as text
%        str2double(get(hObject,'String')) returns contents of v66 as a double


% --- Executes during object creation, after setting all properties.
function v66_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v76_Callback(hObject, eventdata, handles)
% hObject    handle to v76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v76 as text
%        str2double(get(hObject,'String')) returns contents of v76 as a double


% --- Executes during object creation, after setting all properties.
function v76_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v76 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v86_Callback(hObject, eventdata, handles)
% hObject    handle to v86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v86 as text
%        str2double(get(hObject,'String')) returns contents of v86 as a double


% --- Executes during object creation, after setting all properties.
function v86_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v17_Callback(hObject, eventdata, handles)
% hObject    handle to v17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v17 as text
%        str2double(get(hObject,'String')) returns contents of v17 as a double


% --- Executes during object creation, after setting all properties.
function v17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v27_Callback(hObject, eventdata, handles)
% hObject    handle to v27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v27 as text
%        str2double(get(hObject,'String')) returns contents of v27 as a double


% --- Executes during object creation, after setting all properties.
function v27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v37_Callback(hObject, eventdata, handles)
% hObject    handle to v37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v37 as text
%        str2double(get(hObject,'String')) returns contents of v37 as a double


% --- Executes during object creation, after setting all properties.
function v37_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v47_Callback(hObject, eventdata, handles)
% hObject    handle to v47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v47 as text
%        str2double(get(hObject,'String')) returns contents of v47 as a double


% --- Executes during object creation, after setting all properties.
function v47_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v57_Callback(hObject, eventdata, handles)
% hObject    handle to v57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v57 as text
%        str2double(get(hObject,'String')) returns contents of v57 as a double


% --- Executes during object creation, after setting all properties.
function v57_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v67_Callback(hObject, eventdata, handles)
% hObject    handle to v67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v67 as text
%        str2double(get(hObject,'String')) returns contents of v67 as a double


% --- Executes during object creation, after setting all properties.
function v67_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v77_Callback(hObject, eventdata, handles)
% hObject    handle to v77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v77 as text
%        str2double(get(hObject,'String')) returns contents of v77 as a double


% --- Executes during object creation, after setting all properties.
function v77_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v87_Callback(hObject, eventdata, handles)
% hObject    handle to v87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v87 as text
%        str2double(get(hObject,'String')) returns contents of v87 as a double


% --- Executes during object creation, after setting all properties.
function v87_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v18_Callback(hObject, eventdata, handles)
% hObject    handle to v18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v18 as text
%        str2double(get(hObject,'String')) returns contents of v18 as a double


% --- Executes during object creation, after setting all properties.
function v18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v28_Callback(hObject, eventdata, handles)
% hObject    handle to v28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v28 as text
%        str2double(get(hObject,'String')) returns contents of v28 as a double


% --- Executes during object creation, after setting all properties.
function v28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v38_Callback(hObject, eventdata, handles)
% hObject    handle to v38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v38 as text
%        str2double(get(hObject,'String')) returns contents of v38 as a double


% --- Executes during object creation, after setting all properties.
function v38_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v48_Callback(hObject, eventdata, handles)
% hObject    handle to v48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v48 as text
%        str2double(get(hObject,'String')) returns contents of v48 as a double


% --- Executes during object creation, after setting all properties.
function v48_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v58_Callback(hObject, eventdata, handles)
% hObject    handle to v58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v58 as text
%        str2double(get(hObject,'String')) returns contents of v58 as a double


% --- Executes during object creation, after setting all properties.
function v58_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v68_Callback(hObject, eventdata, handles)
% hObject    handle to v68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v68 as text
%        str2double(get(hObject,'String')) returns contents of v68 as a double


% --- Executes during object creation, after setting all properties.
function v68_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v78_Callback(hObject, eventdata, handles)
% hObject    handle to v78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v78 as text
%        str2double(get(hObject,'String')) returns contents of v78 as a double


% --- Executes during object creation, after setting all properties.
function v78_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function v88_Callback(hObject, eventdata, handles)
% hObject    handle to v88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of v88 as text
%        str2double(get(hObject,'String')) returns contents of v88 as a double


% --- Executes during object creation, after setting all properties.
function v88_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_Callback(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1 as text
%        str2double(get(hObject,'String')) returns contents of x1 as a double


% --- Executes during object creation, after setting all properties.
function x1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x2_Callback(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x2 as text
%        str2double(get(hObject,'String')) returns contents of x2 as a double


% --- Executes during object creation, after setting all properties.
function x2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x3_Callback(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x3 as text
%        str2double(get(hObject,'String')) returns contents of x3 as a double


% --- Executes during object creation, after setting all properties.
function x3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x4_Callback(hObject, eventdata, handles)
% hObject    handle to x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x4 as text
%        str2double(get(hObject,'String')) returns contents of x4 as a double


% --- Executes during object creation, after setting all properties.
function x4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x5_Callback(hObject, eventdata, handles)
% hObject    handle to x5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x5 as text
%        str2double(get(hObject,'String')) returns contents of x5 as a double


% --- Executes during object creation, after setting all properties.
function x5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x6_Callback(hObject, eventdata, handles)
% hObject    handle to x6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x6 as text
%        str2double(get(hObject,'String')) returns contents of x6 as a double


% --- Executes during object creation, after setting all properties.
function x6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x7_Callback(hObject, eventdata, handles)
% hObject    handle to x7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x7 as text
%        str2double(get(hObject,'String')) returns contents of x7 as a double


% --- Executes during object creation, after setting all properties.
function x7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x8_Callback(hObject, eventdata, handles)
% hObject    handle to x8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x8 as text
%        str2double(get(hObject,'String')) returns contents of x8 as a double


% --- Executes during object creation, after setting all properties.
function x8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b1_Callback(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b1 as text
%        str2double(get(hObject,'String')) returns contents of b1 as a double


% --- Executes during object creation, after setting all properties.
function b1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b2_Callback(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b2 as text
%        str2double(get(hObject,'String')) returns contents of b2 as a double


% --- Executes during object creation, after setting all properties.
function b2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b3_Callback(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b3 as text
%        str2double(get(hObject,'String')) returns contents of b3 as a double


% --- Executes during object creation, after setting all properties.
function b3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b4_Callback(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b4 as text
%        str2double(get(hObject,'String')) returns contents of b4 as a double


% --- Executes during object creation, after setting all properties.
function b4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b5_Callback(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b5 as text
%        str2double(get(hObject,'String')) returns contents of b5 as a double


% --- Executes during object creation, after setting all properties.
function b5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b6_Callback(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b6 as text
%        str2double(get(hObject,'String')) returns contents of b6 as a double


% --- Executes during object creation, after setting all properties.
function b6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b7_Callback(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b7 as text
%        str2double(get(hObject,'String')) returns contents of b7 as a double


% --- Executes during object creation, after setting all properties.
function b7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b8_Callback(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of b8 as text
%        str2double(get(hObject,'String')) returns contents of b8 as a double


% --- Executes during object creation, after setting all properties.
function b8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i1_Callback(hObject, eventdata, handles)
% hObject    handle to i1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of i1 as text
%        str2double(get(hObject,'String')) returns contents of i1 as a double


% --- Executes during object creation, after setting all properties.
function i1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i2_Callback(hObject, eventdata, handles)
% hObject    handle to i2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of i2 as text
%        str2double(get(hObject,'String')) returns contents of i2 as a double


% --- Executes during object creation, after setting all properties.
function i2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i3_Callback(hObject, eventdata, handles)
% hObject    handle to i3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end                                                    
% Hints: get(hObject,'String') returns contents of i3 as text
%        str2double(get(hObject,'String')) returns contents of i3 as a double


% --- Executes during object creation, after setting all properties.
function i3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i4_Callback(hObject, eventdata, handles)
% hObject    handle to i4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of i4 as text
%        str2double(get(hObject,'String')) returns contents of i4 as a double


% --- Executes during object creation, after setting all properties.
function i4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i5_Callback(hObject, eventdata, handles)
% hObject    handle to i5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of i5 as text
%        str2double(get(hObject,'String')) returns contents of i5 as a double


% --- Executes during object creation, after setting all properties.
function i5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i6_Callback(hObject, eventdata, handles)
% hObject    handle to i6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of i6 as text
%        str2double(get(hObject,'String')) returns contents of i6 as a double


% --- Executes during object creation, after setting all properties.
function i6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i7_Callback(hObject, eventdata, handles)
% hObject    handle to i7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of i7 as text
%        str2double(get(hObject,'String')) returns contents of i7 as a double


% --- Executes during object creation, after setting all properties.
function i7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function i8_Callback(hObject, eventdata, handles)
% hObject    handle to i8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
input = str2double(get(hObject,'String'));
if isnan(input) || ~isreal(input)
    errordlg('You must enter a numeric value','Invalid Input','modal')
    uicontrol(hObject)
    return
end
% Hints: get(hObject,'String') returns contents of i8 as text
%        str2double(get(hObject,'String')) returns contents of i8 as a double


% --- Executes during object creation, after setting all properties.
function i8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to i8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in back.
function back_Callback(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf) ;
set(handles.parent , 'Visible' , 'on')

% --- Executes on button press in quit.
function quit_Callback(hObject, eventdata, handles)
% hObject    handle to quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
user_response = modaldlg('Title','Confirm Close');
switch user_response
    case 'No'
        %are you sure
    case 'Yes'
        close(handles.parent) ;
        close(gcf) ;
end


function r1_Callback(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r1 as text
%        str2double(get(hObject,'String')) returns contents of r1 as a double


% --- Executes during object creation, after setting all properties.
function r1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r2_Callback(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r2 as text
%        str2double(get(hObject,'String')) returns contents of r2 as a double


% --- Executes during object creation, after setting all properties.
function r2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r3_Callback(hObject, eventdata, handles)
% hObject    handle to r3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r3 as text
%        str2double(get(hObject,'String')) returns contents of r3 as a double


% --- Executes during object creation, after setting all properties.
function r3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r4_Callback(hObject, eventdata, handles)
% hObject    handle to r4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r4 as text
%        str2double(get(hObject,'String')) returns contents of r4 as a double


% --- Executes during object creation, after setting all properties.
function r4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r5_Callback(hObject, eventdata, handles)
% hObject    handle to r5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r5 as text
%        str2double(get(hObject,'String')) returns contents of r5 as a double


% --- Executes during object creation, after setting all properties.
function r5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r6_Callback(hObject, eventdata, handles)
% hObject    handle to r6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r6 as text
%        str2double(get(hObject,'String')) returns contents of r6 as a double


% --- Executes during object creation, after setting all properties.
function r6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r7_Callback(hObject, eventdata, handles)
% hObject    handle to r7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r7 as text
%        str2double(get(hObject,'String')) returns contents of r7 as a double


% --- Executes during object creation, after setting all properties.
function r7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function r8_Callback(hObject, eventdata, handles)
% hObject    handle to r8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of r8 as text
%        str2double(get(hObject,'String')) returns contents of r8 as a double


% --- Executes during object creation, after setting all properties.
function r8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in flash_button.
function flash_button_Callback(hObject, eventdata, handles)
% hObject    handle to flash_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function flash_button_CreateFcn(hObject, eventdata, handles)
% hObject    handle to flash_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit470_Callback(hObject, eventdata, handles)
% hObject    handle to edit470 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit470 as text
%        str2double(get(hObject,'String')) returns contents of edit470 as a double


% --- Executes during object creation, after setting all properties.
function edit470_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit470 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit471_Callback(hObject, eventdata, handles)
% hObject    handle to edit471 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit471 as text
%        str2double(get(hObject,'String')) returns contents of edit471 as a double


% --- Executes during object creation, after setting all properties.
function edit471_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit471 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit472_Callback(hObject, eventdata, handles)
% hObject    handle to edit472 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit472 as text
%        str2double(get(hObject,'String')) returns contents of edit472 as a double


% --- Executes during object creation, after setting all properties.
function edit472_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit472 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit473_Callback(hObject, eventdata, handles)
% hObject    handle to edit473 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit473 as text
%        str2double(get(hObject,'String')) returns contents of edit473 as a double


% --- Executes during object creation, after setting all properties.
function edit473_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit473 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit474_Callback(hObject, eventdata, handles)
% hObject    handle to edit474 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit474 as text
%        str2double(get(hObject,'String')) returns contents of edit474 as a double


% --- Executes during object creation, after setting all properties.
function edit474_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit474 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit475_Callback(hObject, eventdata, handles)
% hObject    handle to edit475 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit475 as text
%        str2double(get(hObject,'String')) returns contents of edit475 as a double


% --- Executes during object creation, after setting all properties.
function edit475_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit475 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit476_Callback(hObject, eventdata, handles)
% hObject    handle to edit476 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit476 as text
%        str2double(get(hObject,'String')) returns contents of edit476 as a double


% --- Executes during object creation, after setting all properties.
function edit476_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit476 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit477_Callback(hObject, eventdata, handles)
% hObject    handle to edit477 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit477 as text
%        str2double(get(hObject,'String')) returns contents of edit477 as a double


% --- Executes during object creation, after setting all properties.
function edit477_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit477 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit478_Callback(hObject, eventdata, handles)
% hObject    handle to edit478 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit478 as text
%        str2double(get(hObject,'String')) returns contents of edit478 as a double


% --- Executes during object creation, after setting all properties.
function edit478_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit478 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit479_Callback(hObject, eventdata, handles)
% hObject    handle to edit479 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit479 as text
%        str2double(get(hObject,'String')) returns contents of edit479 as a double


% --- Executes during object creation, after setting all properties.
function edit479_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit479 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit480_Callback(hObject, eventdata, handles)
% hObject    handle to edit480 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit480 as text
%        str2double(get(hObject,'String')) returns contents of edit480 as a double


% --- Executes during object creation, after setting all properties.
function edit480_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit480 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit481_Callback(hObject, eventdata, handles)
% hObject    handle to edit481 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit481 as text
%        str2double(get(hObject,'String')) returns contents of edit481 as a double


% --- Executes during object creation, after setting all properties.
function edit481_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit481 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit482_Callback(hObject, eventdata, handles)
% hObject    handle to edit482 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit482 as text
%        str2double(get(hObject,'String')) returns contents of edit482 as a double


% --- Executes during object creation, after setting all properties.
function edit482_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit482 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit483_Callback(hObject, eventdata, handles)
% hObject    handle to edit483 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit483 as text
%        str2double(get(hObject,'String')) returns contents of edit483 as a double


% --- Executes during object creation, after setting all properties.
function edit483_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit483 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit484_Callback(hObject, eventdata, handles)
% hObject    handle to edit484 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit484 as text
%        str2double(get(hObject,'String')) returns contents of edit484 as a double


% --- Executes during object creation, after setting all properties.
function edit484_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit484 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit485_Callback(hObject, eventdata, handles)
% hObject    handle to edit485 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit485 as text
%        str2double(get(hObject,'String')) returns contents of edit485 as a double


% --- Executes during object creation, after setting all properties.
function edit485_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit485 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit486_Callback(hObject, eventdata, handles)
% hObject    handle to edit486 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit486 as text
%        str2double(get(hObject,'String')) returns contents of edit486 as a double


% --- Executes during object creation, after setting all properties.
function edit486_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit486 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit487_Callback(hObject, eventdata, handles)
% hObject    handle to edit487 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit487 as text
%        str2double(get(hObject,'String')) returns contents of edit487 as a double


% --- Executes during object creation, after setting all properties.
function edit487_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit487 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit488_Callback(hObject, eventdata, handles)
% hObject    handle to edit488 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit488 as text
%        str2double(get(hObject,'String')) returns contents of edit488 as a double


% --- Executes during object creation, after setting all properties.
function edit488_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit488 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit489_Callback(hObject, eventdata, handles)
% hObject    handle to edit489 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit489 as text
%        str2double(get(hObject,'String')) returns contents of edit489 as a double


% --- Executes during object creation, after setting all properties.
function edit489_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit489 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit490_Callback(hObject, eventdata, handles)
% hObject    handle to edit490 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit490 as text
%        str2double(get(hObject,'String')) returns contents of edit490 as a double


% --- Executes during object creation, after setting all properties.
function edit490_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit490 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit491_Callback(hObject, eventdata, handles)
% hObject    handle to edit491 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit491 as text
%        str2double(get(hObject,'String')) returns contents of edit491 as a double


% --- Executes during object creation, after setting all properties.
function edit491_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit491 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit492_Callback(hObject, eventdata, handles)
% hObject    handle to edit492 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit492 as text
%        str2double(get(hObject,'String')) returns contents of edit492 as a double


% --- Executes during object creation, after setting all properties.
function edit492_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit492 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit493_Callback(hObject, eventdata, handles)
% hObject    handle to edit493 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit493 as text
%        str2double(get(hObject,'String')) returns contents of edit493 as a double


% --- Executes during object creation, after setting all properties.
function edit493_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit493 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit494_Callback(hObject, eventdata, handles)
% hObject    handle to edit494 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit494 as text
%        str2double(get(hObject,'String')) returns contents of edit494 as a double


% --- Executes during object creation, after setting all properties.
function edit494_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit494 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit495_Callback(hObject, eventdata, handles)
% hObject    handle to edit495 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit495 as text
%        str2double(get(hObject,'String')) returns contents of edit495 as a double


% --- Executes during object creation, after setting all properties.
function edit495_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit495 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit496_Callback(hObject, eventdata, handles)
% hObject    handle to edit496 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit496 as text
%        str2double(get(hObject,'String')) returns contents of edit496 as a double


% --- Executes during object creation, after setting all properties.
function edit496_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit496 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit497_Callback(hObject, eventdata, handles)
% hObject    handle to edit497 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit497 as text
%        str2double(get(hObject,'String')) returns contents of edit497 as a double


% --- Executes during object creation, after setting all properties.
function edit497_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit497 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit498_Callback(hObject, eventdata, handles)
% hObject    handle to edit498 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit498 as text
%        str2double(get(hObject,'String')) returns contents of edit498 as a double


% --- Executes during object creation, after setting all properties.
function edit498_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit498 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit499_Callback(hObject, eventdata, handles)
% hObject    handle to edit499 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit499 as text
%        str2double(get(hObject,'String')) returns contents of edit499 as a double


% --- Executes during object creation, after setting all properties.
function edit499_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit499 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit500_Callback(hObject, eventdata, handles)
% hObject    handle to edit500 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit500 as text
%        str2double(get(hObject,'String')) returns contents of edit500 as a double


% --- Executes during object creation, after setting all properties.
function edit500_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit500 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit501_Callback(hObject, eventdata, handles)
% hObject    handle to edit501 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit501 as text
%        str2double(get(hObject,'String')) returns contents of edit501 as a double


% --- Executes during object creation, after setting all properties.
function edit501_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit501 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit502_Callback(hObject, eventdata, handles)
% hObject    handle to edit502 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit502 as text
%        str2double(get(hObject,'String')) returns contents of edit502 as a double


% --- Executes during object creation, after setting all properties.
function edit502_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit502 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit503_Callback(hObject, eventdata, handles)
% hObject    handle to edit503 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit503 as text
%        str2double(get(hObject,'String')) returns contents of edit503 as a double


% --- Executes during object creation, after setting all properties.
function edit503_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit503 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit504_Callback(hObject, eventdata, handles)
% hObject    handle to edit504 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit504 as text
%        str2double(get(hObject,'String')) returns contents of edit504 as a double


% --- Executes during object creation, after setting all properties.
function edit504_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit504 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit505_Callback(hObject, eventdata, handles)
% hObject    handle to edit505 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit505 as text
%        str2double(get(hObject,'String')) returns contents of edit505 as a double


% --- Executes during object creation, after setting all properties.
function edit505_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit505 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit506_Callback(hObject, eventdata, handles)
% hObject    handle to edit506 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit506 as text
%        str2double(get(hObject,'String')) returns contents of edit506 as a double


% --- Executes during object creation, after setting all properties.
function edit506_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit506 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit507_Callback(hObject, eventdata, handles)
% hObject    handle to edit507 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit507 as text
%        str2double(get(hObject,'String')) returns contents of edit507 as a double


% --- Executes during object creation, after setting all properties.
function edit507_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit507 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit508_Callback(hObject, eventdata, handles)
% hObject    handle to edit508 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit508 as text
%        str2double(get(hObject,'String')) returns contents of edit508 as a double


% --- Executes during object creation, after setting all properties.
function edit508_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit508 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit509_Callback(hObject, eventdata, handles)
% hObject    handle to edit509 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit509 as text
%        str2double(get(hObject,'String')) returns contents of edit509 as a double


% --- Executes during object creation, after setting all properties.
function edit509_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit509 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit510_Callback(hObject, eventdata, handles)
% hObject    handle to edit510 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit510 as text
%        str2double(get(hObject,'String')) returns contents of edit510 as a double


% --- Executes during object creation, after setting all properties.
function edit510_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit510 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit511_Callback(hObject, eventdata, handles)
% hObject    handle to edit511 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit511 as text
%        str2double(get(hObject,'String')) returns contents of edit511 as a double


% --- Executes during object creation, after setting all properties.
function edit511_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit511 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit512_Callback(hObject, eventdata, handles)
% hObject    handle to edit512 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit512 as text
%        str2double(get(hObject,'String')) returns contents of edit512 as a double


% --- Executes during object creation, after setting all properties.
function edit512_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit512 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit513_Callback(hObject, eventdata, handles)
% hObject    handle to edit513 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit513 as text
%        str2double(get(hObject,'String')) returns contents of edit513 as a double


% --- Executes during object creation, after setting all properties.
function edit513_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit513 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit514_Callback(hObject, eventdata, handles)
% hObject    handle to edit514 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit514 as text
%        str2double(get(hObject,'String')) returns contents of edit514 as a double


% --- Executes during object creation, after setting all properties.
function edit514_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit514 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit515_Callback(hObject, eventdata, handles)
% hObject    handle to edit515 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit515 as text
%        str2double(get(hObject,'String')) returns contents of edit515 as a double


% --- Executes during object creation, after setting all properties.
function edit515_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit515 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit516_Callback(hObject, eventdata, handles)
% hObject    handle to edit516 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit516 as text
%        str2double(get(hObject,'String')) returns contents of edit516 as a double


% --- Executes during object creation, after setting all properties.
function edit516_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit516 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit517_Callback(hObject, eventdata, handles)
% hObject    handle to edit517 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit517 as text
%        str2double(get(hObject,'String')) returns contents of edit517 as a double


% --- Executes during object creation, after setting all properties.
function edit517_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit517 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit518_Callback(hObject, eventdata, handles)
% hObject    handle to edit518 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit518 as text
%        str2double(get(hObject,'String')) returns contents of edit518 as a double


% --- Executes during object creation, after setting all properties.
function edit518_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit518 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit519_Callback(hObject, eventdata, handles)
% hObject    handle to edit519 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit519 as text
%        str2double(get(hObject,'String')) returns contents of edit519 as a double


% --- Executes during object creation, after setting all properties.
function edit519_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit519 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit520_Callback(hObject, eventdata, handles)
% hObject    handle to edit520 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit520 as text
%        str2double(get(hObject,'String')) returns contents of edit520 as a double


% --- Executes during object creation, after setting all properties.
function edit520_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit520 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit521_Callback(hObject, eventdata, handles)
% hObject    handle to edit521 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit521 as text
%        str2double(get(hObject,'String')) returns contents of edit521 as a double


% --- Executes during object creation, after setting all properties.
function edit521_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit521 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit522_Callback(hObject, eventdata, handles)
% hObject    handle to edit522 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit522 as text
%        str2double(get(hObject,'String')) returns contents of edit522 as a double


% --- Executes during object creation, after setting all properties.
function edit522_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit522 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit523_Callback(hObject, eventdata, handles)
% hObject    handle to edit523 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit523 as text
%        str2double(get(hObject,'String')) returns contents of edit523 as a double


% --- Executes during object creation, after setting all properties.
function edit523_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit523 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit524_Callback(hObject, eventdata, handles)
% hObject    handle to edit524 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit524 as text
%        str2double(get(hObject,'String')) returns contents of edit524 as a double


% --- Executes during object creation, after setting all properties.
function edit524_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit524 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit525_Callback(hObject, eventdata, handles)
% hObject    handle to edit525 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit525 as text
%        str2double(get(hObject,'String')) returns contents of edit525 as a double


% --- Executes during object creation, after setting all properties.
function edit525_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit525 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit526_Callback(hObject, eventdata, handles)
% hObject    handle to edit526 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit526 as text
%        str2double(get(hObject,'String')) returns contents of edit526 as a double


% --- Executes during object creation, after setting all properties.
function edit526_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit526 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit527_Callback(hObject, eventdata, handles)
% hObject    handle to edit527 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit527 as text
%        str2double(get(hObject,'String')) returns contents of edit527 as a double


% --- Executes during object creation, after setting all properties.
function edit527_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit527 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit528_Callback(hObject, eventdata, handles)
% hObject    handle to edit528 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit528 as text
%        str2double(get(hObject,'String')) returns contents of edit528 as a double


% --- Executes during object creation, after setting all properties.
function edit528_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit528 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit529_Callback(hObject, eventdata, handles)
% hObject    handle to edit529 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit529 as text
%        str2double(get(hObject,'String')) returns contents of edit529 as a double


% --- Executes during object creation, after setting all properties.
function edit529_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit529 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit530_Callback(hObject, eventdata, handles)
% hObject    handle to edit530 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit530 as text
%        str2double(get(hObject,'String')) returns contents of edit530 as a double


% --- Executes during object creation, after setting all properties.
function edit530_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit530 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit531_Callback(hObject, eventdata, handles)
% hObject    handle to edit531 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit531 as text
%        str2double(get(hObject,'String')) returns contents of edit531 as a double


% --- Executes during object creation, after setting all properties.
function edit531_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit531 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit532_Callback(hObject, eventdata, handles)
% hObject    handle to edit532 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit532 as text
%        str2double(get(hObject,'String')) returns contents of edit532 as a double


% --- Executes during object creation, after setting all properties.
function edit532_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit532 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit533_Callback(hObject, eventdata, handles)
% hObject    handle to edit533 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit533 as text
%        str2double(get(hObject,'String')) returns contents of edit533 as a double


% --- Executes during object creation, after setting all properties.
function edit533_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit533 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit534_Callback(hObject, eventdata, handles)
% hObject    handle to edit534 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit534 as text
%        str2double(get(hObject,'String')) returns contents of edit534 as a double


% --- Executes during object creation, after setting all properties.
function edit534_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit534 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit535_Callback(hObject, eventdata, handles)
% hObject    handle to edit535 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit535 as text
%        str2double(get(hObject,'String')) returns contents of edit535 as a double


% --- Executes during object creation, after setting all properties.
function edit535_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit535 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit536_Callback(hObject, eventdata, handles)
% hObject    handle to edit536 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit536 as text
%        str2double(get(hObject,'String')) returns contents of edit536 as a double


% --- Executes during object creation, after setting all properties.
function edit536_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit536 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit537_Callback(hObject, eventdata, handles)
% hObject    handle to edit537 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit537 as text
%        str2double(get(hObject,'String')) returns contents of edit537 as a double


% --- Executes during object creation, after setting all properties.
function edit537_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit537 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit538_Callback(hObject, eventdata, handles)
% hObject    handle to edit538 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit538 as text
%        str2double(get(hObject,'String')) returns contents of edit538 as a double


% --- Executes during object creation, after setting all properties.
function edit538_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit538 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit539_Callback(hObject, eventdata, handles)
% hObject    handle to edit539 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit539 as text
%        str2double(get(hObject,'String')) returns contents of edit539 as a double


% --- Executes during object creation, after setting all properties.
function edit539_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit539 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit540_Callback(hObject, eventdata, handles)
% hObject    handle to edit540 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit540 as text
%        str2double(get(hObject,'String')) returns contents of edit540 as a double


% --- Executes during object creation, after setting all properties.
function edit540_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit540 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit541_Callback(hObject, eventdata, handles)
% hObject    handle to edit541 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit541 as text
%        str2double(get(hObject,'String')) returns contents of edit541 as a double


% --- Executes during object creation, after setting all properties.
function edit541_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit541 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit542_Callback(hObject, eventdata, handles)
% hObject    handle to edit542 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit542 as text
%        str2double(get(hObject,'String')) returns contents of edit542 as a double


% --- Executes during object creation, after setting all properties.
function edit542_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit542 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit543_Callback(hObject, eventdata, handles)
% hObject    handle to edit543 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit543 as text
%        str2double(get(hObject,'String')) returns contents of edit543 as a double


% --- Executes during object creation, after setting all properties.
function edit543_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit543 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit544_Callback(hObject, eventdata, handles)
% hObject    handle to edit544 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit544 as text
%        str2double(get(hObject,'String')) returns contents of edit544 as a double


% --- Executes during object creation, after setting all properties.
function edit544_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit544 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit545_Callback(hObject, eventdata, handles)
% hObject    handle to edit545 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit545 as text
%        str2double(get(hObject,'String')) returns contents of edit545 as a double


% --- Executes during object creation, after setting all properties.
function edit545_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit545 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit546_Callback(hObject, eventdata, handles)
% hObject    handle to edit546 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit546 as text
%        str2double(get(hObject,'String')) returns contents of edit546 as a double


% --- Executes during object creation, after setting all properties.
function edit546_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit546 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit547_Callback(hObject, eventdata, handles)
% hObject    handle to edit547 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit547 as text
%        str2double(get(hObject,'String')) returns contents of edit547 as a double


% --- Executes during object creation, after setting all properties.
function edit547_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit547 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit548_Callback(hObject, eventdata, handles)
% hObject    handle to edit548 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit548 as text
%        str2double(get(hObject,'String')) returns contents of edit548 as a double


% --- Executes during object creation, after setting all properties.
function edit548_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit548 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit549_Callback(hObject, eventdata, handles)
% hObject    handle to edit549 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit549 as text
%        str2double(get(hObject,'String')) returns contents of edit549 as a double


% --- Executes during object creation, after setting all properties.
function edit549_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit549 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit550_Callback(hObject, eventdata, handles)
% hObject    handle to edit550 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit550 as text
%        str2double(get(hObject,'String')) returns contents of edit550 as a double


% --- Executes during object creation, after setting all properties.
function edit550_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit550 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit551_Callback(hObject, eventdata, handles)
% hObject    handle to edit551 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit551 as text
%        str2double(get(hObject,'String')) returns contents of edit551 as a double


% --- Executes during object creation, after setting all properties.
function edit551_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit551 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit552_Callback(hObject, eventdata, handles)
% hObject    handle to edit552 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit552 as text
%        str2double(get(hObject,'String')) returns contents of edit552 as a double


% --- Executes during object creation, after setting all properties.
function edit552_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit552 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit553_Callback(hObject, eventdata, handles)
% hObject    handle to edit553 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit553 as text
%        str2double(get(hObject,'String')) returns contents of edit553 as a double


% --- Executes during object creation, after setting all properties.
function edit553_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit553 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit554_Callback(hObject, eventdata, handles)
% hObject    handle to edit554 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit554 as text
%        str2double(get(hObject,'String')) returns contents of edit554 as a double


% --- Executes during object creation, after setting all properties.
function edit554_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit554 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit555_Callback(hObject, eventdata, handles)
% hObject    handle to edit555 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit555 as text
%        str2double(get(hObject,'String')) returns contents of edit555 as a double


% --- Executes during object creation, after setting all properties.
function edit555_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit555 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit556_Callback(hObject, eventdata, handles)
% hObject    handle to edit556 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit556 as text
%        str2double(get(hObject,'String')) returns contents of edit556 as a double


% --- Executes during object creation, after setting all properties.
function edit556_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit556 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit557_Callback(hObject, eventdata, handles)
% hObject    handle to edit557 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit557 as text
%        str2double(get(hObject,'String')) returns contents of edit557 as a double


% --- Executes during object creation, after setting all properties.
function edit557_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit557 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit558_Callback(hObject, eventdata, handles)
% hObject    handle to edit558 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit558 as text
%        str2double(get(hObject,'String')) returns contents of edit558 as a double


% --- Executes during object creation, after setting all properties.
function edit558_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit558 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit559_Callback(hObject, eventdata, handles)
% hObject    handle to edit559 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit559 as text
%        str2double(get(hObject,'String')) returns contents of edit559 as a double


% --- Executes during object creation, after setting all properties.
function edit559_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit559 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit560_Callback(hObject, eventdata, handles)
% hObject    handle to edit560 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit560 as text
%        str2double(get(hObject,'String')) returns contents of edit560 as a double


% --- Executes during object creation, after setting all properties.
function edit560_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit560 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit561_Callback(hObject, eventdata, handles)
% hObject    handle to edit561 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit561 as text
%        str2double(get(hObject,'String')) returns contents of edit561 as a double


% --- Executes during object creation, after setting all properties.
function edit561_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit561 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit562_Callback(hObject, eventdata, handles)
% hObject    handle to edit562 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit562 as text
%        str2double(get(hObject,'String')) returns contents of edit562 as a double


% --- Executes during object creation, after setting all properties.
function edit562_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit562 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit563_Callback(hObject, eventdata, handles)
% hObject    handle to edit563 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit563 as text
%        str2double(get(hObject,'String')) returns contents of edit563 as a double


% --- Executes during object creation, after setting all properties.
function edit563_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit563 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit564_Callback(hObject, eventdata, handles)
% hObject    handle to edit564 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit564 as text
%        str2double(get(hObject,'String')) returns contents of edit564 as a double


% --- Executes during object creation, after setting all properties.
function edit564_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit564 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit565_Callback(hObject, eventdata, handles)
% hObject    handle to edit565 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit565 as text
%        str2double(get(hObject,'String')) returns contents of edit565 as a double


% --- Executes during object creation, after setting all properties.
function edit565_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit565 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit566_Callback(hObject, eventdata, handles)
% hObject    handle to edit566 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit566 as text
%        str2double(get(hObject,'String')) returns contents of edit566 as a double


% --- Executes during object creation, after setting all properties.
function edit566_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit566 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit567_Callback(hObject, eventdata, handles)
% hObject    handle to edit567 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit567 as text
%        str2double(get(hObject,'String')) returns contents of edit567 as a double


% --- Executes during object creation, after setting all properties.
function edit567_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit567 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit568_Callback(hObject, eventdata, handles)
% hObject    handle to edit568 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit568 as text
%        str2double(get(hObject,'String')) returns contents of edit568 as a double


% --- Executes during object creation, after setting all properties.
function edit568_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit568 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit569_Callback(hObject, eventdata, handles)
% hObject    handle to edit569 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit569 as text
%        str2double(get(hObject,'String')) returns contents of edit569 as a double


% --- Executes during object creation, after setting all properties.
function edit569_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit569 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit570_Callback(hObject, eventdata, handles)
% hObject    handle to edit570 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit570 as text
%        str2double(get(hObject,'String')) returns contents of edit570 as a double


% --- Executes during object creation, after setting all properties.
function edit570_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit570 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit571_Callback(hObject, eventdata, handles)
% hObject    handle to edit571 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit571 as text
%        str2double(get(hObject,'String')) returns contents of edit571 as a double


% --- Executes during object creation, after setting all properties.
function edit571_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit571 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit572_Callback(hObject, eventdata, handles)
% hObject    handle to edit572 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit572 as text
%        str2double(get(hObject,'String')) returns contents of edit572 as a double


% --- Executes during object creation, after setting all properties.
function edit572_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit572 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit573_Callback(hObject, eventdata, handles)
% hObject    handle to edit573 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit573 as text
%        str2double(get(hObject,'String')) returns contents of edit573 as a double


% --- Executes during object creation, after setting all properties.
function edit573_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit573 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit574_Callback(hObject, eventdata, handles)
% hObject    handle to edit574 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit574 as text
%        str2double(get(hObject,'String')) returns contents of edit574 as a double


% --- Executes during object creation, after setting all properties.
function edit574_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit574 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit575_Callback(hObject, eventdata, handles)
% hObject    handle to edit575 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit575 as text
%        str2double(get(hObject,'String')) returns contents of edit575 as a double


% --- Executes during object creation, after setting all properties.
function edit575_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit575 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit576_Callback(hObject, eventdata, handles)
% hObject    handle to edit576 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit576 as text
%        str2double(get(hObject,'String')) returns contents of edit576 as a double


% --- Executes during object creation, after setting all properties.
function edit576_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit576 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit577_Callback(hObject, eventdata, handles)
% hObject    handle to edit577 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit577 as text
%        str2double(get(hObject,'String')) returns contents of edit577 as a double


% --- Executes during object creation, after setting all properties.
function edit577_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit577 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit578_Callback(hObject, eventdata, handles)
% hObject    handle to edit578 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit578 as text
%        str2double(get(hObject,'String')) returns contents of edit578 as a double


% --- Executes during object creation, after setting all properties.
function edit578_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit578 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit579_Callback(hObject, eventdata, handles)
% hObject    handle to edit579 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit579 as text
%        str2double(get(hObject,'String')) returns contents of edit579 as a double


% --- Executes during object creation, after setting all properties.
function edit579_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit579 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit580_Callback(hObject, eventdata, handles)
% hObject    handle to edit580 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit580 as text
%        str2double(get(hObject,'String')) returns contents of edit580 as a double


% --- Executes during object creation, after setting all properties.
function edit580_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit580 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit581_Callback(hObject, eventdata, handles)
% hObject    handle to edit581 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit581 as text
%        str2double(get(hObject,'String')) returns contents of edit581 as a double


% --- Executes during object creation, after setting all properties.
function edit581_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit581 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit582_Callback(hObject, eventdata, handles)
% hObject    handle to edit582 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit582 as text
%        str2double(get(hObject,'String')) returns contents of edit582 as a double


% --- Executes during object creation, after setting all properties.
function edit582_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit582 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit583_Callback(hObject, eventdata, handles)
% hObject    handle to edit583 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit583 as text
%        str2double(get(hObject,'String')) returns contents of edit583 as a double


% --- Executes during object creation, after setting all properties.
function edit583_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit583 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit584_Callback(hObject, eventdata, handles)
% hObject    handle to edit584 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit584 as text
%        str2double(get(hObject,'String')) returns contents of edit584 as a double


% --- Executes during object creation, after setting all properties.
function edit584_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit584 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit585_Callback(hObject, eventdata, handles)
% hObject    handle to edit585 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit585 as text
%        str2double(get(hObject,'String')) returns contents of edit585 as a double


% --- Executes during object creation, after setting all properties.
function edit585_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit585 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit586_Callback(hObject, eventdata, handles)
% hObject    handle to edit586 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit586 as text
%        str2double(get(hObject,'String')) returns contents of edit586 as a double


% --- Executes during object creation, after setting all properties.
function edit586_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit586 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit587_Callback(hObject, eventdata, handles)
% hObject    handle to edit587 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit587 as text
%        str2double(get(hObject,'String')) returns contents of edit587 as a double


% --- Executes during object creation, after setting all properties.
function edit587_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit587 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit588_Callback(hObject, eventdata, handles)
% hObject    handle to edit588 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit588 as text
%        str2double(get(hObject,'String')) returns contents of edit588 as a double


% --- Executes during object creation, after setting all properties.
function edit588_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit588 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit589_Callback(hObject, eventdata, handles)
% hObject    handle to edit589 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit589 as text
%        str2double(get(hObject,'String')) returns contents of edit589 as a double


% --- Executes during object creation, after setting all properties.
function edit589_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit589 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit590_Callback(hObject, eventdata, handles)
% hObject    handle to edit590 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit590 as text
%        str2double(get(hObject,'String')) returns contents of edit590 as a double


% --- Executes during object creation, after setting all properties.
function edit590_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit590 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit591_Callback(hObject, eventdata, handles)
% hObject    handle to edit591 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit591 as text
%        str2double(get(hObject,'String')) returns contents of edit591 as a double


% --- Executes during object creation, after setting all properties.
function edit591_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit591 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit592_Callback(hObject, eventdata, handles)
% hObject    handle to edit592 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit592 as text
%        str2double(get(hObject,'String')) returns contents of edit592 as a double


% --- Executes during object creation, after setting all properties.
function edit592_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit592 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit593_Callback(hObject, eventdata, handles)
% hObject    handle to edit593 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit593 as text
%        str2double(get(hObject,'String')) returns contents of edit593 as a double


% --- Executes during object creation, after setting all properties.
function edit593_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit593 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit594_Callback(hObject, eventdata, handles)
% hObject    handle to edit594 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit594 as text
%        str2double(get(hObject,'String')) returns contents of edit594 as a double


% --- Executes during object creation, after setting all properties.
function edit594_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit594 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit595_Callback(hObject, eventdata, handles)
% hObject    handle to edit595 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit595 as text
%        str2double(get(hObject,'String')) returns contents of edit595 as a double


% --- Executes during object creation, after setting all properties.
function edit595_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit595 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit596_Callback(hObject, eventdata, handles)
% hObject    handle to edit596 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit596 as text
%        str2double(get(hObject,'String')) returns contents of edit596 as a double


% --- Executes during object creation, after setting all properties.
function edit596_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit596 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit597_Callback(hObject, eventdata, handles)
% hObject    handle to edit597 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit597 as text
%        str2double(get(hObject,'String')) returns contents of edit597 as a double


% --- Executes during object creation, after setting all properties.
function edit597_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit597 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in go.
function go_Callback(hObject, eventdata, handles)
% hObject    handle to go (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
for i = 1:handles.numofpoints
    for k = 1:handles.numofpoints
        X(i,k) = str2double(get(findobj( 'Tag', strjoin({'v', int2str(i) , int2str(k)},'') ), 'String'));
    end
    B(i,1) = str2double(get(findobj( 'Tag', strjoin({'b', int2str(i)},'') ), 'String'));
end
%disp(X) ;
%disp(B) ;
N = size(X) ;
for i = 1:8
   set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
end
handles.x_text.Visible = 'Off' ;
handles.flash_button.Visible = 'Off' ;
for j = 1:8
   for z = 1:8
      set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'Visible', 'Off');
      set(findobj( 'Tag', strjoin({'u', int2str(j),int2str(z)},'') ) , 'Visible', 'Off');
   end  
end   
handles.ev_text.Visible = 'Off' ;
handles.ev.Visible = 'Off' ;
handles.u_text.Visible = 'Off' ;
handles.l_text.Visible = 'Off' ;

if handles.option.Value == 1
    switch(handles.methods.Value)
        case 1 %cramer
            output = cramer(X,B) ;
            
            if(output(N(1)+1 , 1) == 0)
                for i = 1:8
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                handles.x_text.Visible = 'Off' ;
                handles.flash_button.Visible = 'Off' ;
                
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                    char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String',char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end

            handles.flash_button.Visible = 'On' ;
            
        case 2   %inverted index
            [output,invert] = invert_index(X,B) ;
            
            if(output(N(1)+1 , 1) == 0)
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                    char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end
            
            handles.flash_button.Visible = 'On' ;
            handles.l_text.Visible = 'On' ;
            handles.l_text.String = 'Inverted Matrix' ;
            
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints
                   char1 = num2str(invert(j,z)) ;
                   char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'String', char2);
               end  
            end
            
            
        case 3   % gauss elimination
            [output,matric] = Gauss(X,B) ;
            
            if(output(N(1)+1 , 1) == 0)
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                    char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end
            
            handles.flash_button.Visible = 'On' ;
            handles.l_text.Visible = 'On' ;
            handles.l_text.String = 'Gauss matrix' ;
            disp(matric) ;
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints+1
                    char1 = num2str(matric(j,z)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'String', char2);
               end  
            end
            
            
        case 4 % doolittle
            [output,L,U] = LU_doolittle(X,B) ;
            
            if(output(N(1)+1 , 1) == 0)
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                    char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end
            
            handles.flash_button.Visible = 'On' ;
            handles.l_text.Visible = 'On' ;
            handles.l_text.String = 'L' ;
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints
                   char1 = num2str(L(j,z)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'String', char2 );
               end  
            end
            
            handles.u_text.Visible = 'On' ;
            handles.u_text.String = 'U' ;
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints
                   char1 = num2str(U(j,z)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'u', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'u', int2str(j),int2str(z)},'') ) , 'String', char2);
               end  
            end
            
            
        case 5   % LU_crout
            [output,L,U] = LU_crout(X,B) ;
            
            if(output(N(1)+1 , 1) == 0)
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                    char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end
            
            handles.flash_button.Visible = 'On' ;
            handles.l_text.Visible = 'On' ;
            handles.l_text.String = 'L' ;
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints
                   char1 = num2str(L(j,z)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'String', char2);
               end  
            end
            
            handles.u_text.Visible = 'On' ;
            handles.u_text.String = 'U' ;
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints
                   char1 = num2str(U(j,z)) ;
                   char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'u', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'u', int2str(j),int2str(z)},'') ) , 'String', char2);
               end  
            end
            
        case 6
            [output,L,U] = LU_cholsky(X,B) ;
            
            if(output(N(1)+1 , 1) == 0)
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                    char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end
            
            handles.flash_button.Visible = 'On' ;
            handles.l_text.Visible = 'On' ;
            handles.l_text.String = 'L' ;
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints
                   char1 = num2str(L(j,z)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'l', int2str(j),int2str(z)},'') ) , 'String', char2 );
               end  
            end
            
            handles.u_text.Visible = 'On' ;
            handles.u_text.String = 'U' ;
            for j = 1:handles.numofpoints
               for z = 1:handles.numofpoints
                   char1 = num2str(U(j,z)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                   set(findobj( 'Tag', strjoin({'u', int2str(j),int2str(z)},'') ) , 'Visible', 'On');
                   set(findobj( 'Tag', strjoin({'u', int2str(j),int2str(z)},'') ) , 'String', char2);
               end  
            end
            
        case 7
            initial = zeros(N(1),1) ;
            for k = 1:handles.numofpoints
                initial(k,1) = str2double(get(findobj( 'Tag', strjoin({'i',int2str(k)},'') ), 'String'));
            end 
            
            output = Jacobi(X,B,initial , str2double(handles.step.String));

            if(output(N(1)+1 , 1) == 0)
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            handles.flash_button.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                     char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end
            
        case 8
            initial = zeros(N(1),1) ;
            for k = 1:handles.numofpoints
                initial(k,1) = str2double(get(findobj( 'Tag', strjoin({'i',int2str(k)},'') ), 'String'));
            end 
            
            output = Gauss_Seidel(X,B,initial , str2double(handles.step.String)) ;
            
            if(output(N(1)+1 , 1) == 0)
                errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
                uicontrol(hObject)
                return 
            end
            handles.x_text.Visible = 'On' ;
            handles.flash_button.Visible = 'On' ;
            for i = 1:8
                if i <= handles.numofpoints
                     char1 = num2str(output(i,1)) ;
                    char2 = char(vpa(char1 , handles.FPD)) ;
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
                    set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2); 
                else
                     set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
                end
                
            end    
    
    end
else
    initial = zeros(N(1),1) ;
    for k = 1:handles.numofpoints
        initial(k,1) = str2double(get(findobj( 'Tag', strjoin({'i',int2str(k)},'') ), 'String'));
    end
    
   [eval, evec , valid] =  power_method( X , initial , str2double(handles.step.String )) ;
    
 %  eval = vpa(eval , handles.FPD) ;
  % evec = vpa(evec,handles.FPD) ;
   %valid = vpa(valid , handles.FPD) ;
   
   if(valid == 0)
       errordlg('Determinant of Coefficient matrix is 0 or B = 0, please change input','Invalid Input','modal')
       uicontrol(hObject)
       return 
   end

   handles.x_text.Visible = 'On' ;
   handles.x_text.String = 'EagenVector' ;
   handles.flash_button.Visible = 'On' ;
   handles.ev_text.Visible = 'On' ;
   handles.ev.Visible = 'On' ;
   handles.ev.String = char(vpa(num2str(eval) , handles.FPD)) ;
   
   for i = 1:8
       if i <= handles.numofpoints
            char1 = num2str(evec(i,1)) ;
            char2 = char(vpa(char1 , handles.FPD)) ;
           set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'On'); 
           set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'String', char2 ); 
       else
           set(findobj( 'Tag', strjoin({'r', int2str(i)},'') ) , 'Visible', 'Off'); 
       end
                
   end
   
    
end

% --- Executes on button press in flash_button.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to flash_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in play.
function play_Callback(hObject, eventdata, handles)
% hObject    handle to play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear player1 ;
