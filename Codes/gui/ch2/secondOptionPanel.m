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

% Last Modified by GUIDE v2.5 18-Dec-2016 16:00:06

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

% setting parent figure, FPD, and the number of equations
handles.parent = varargin{1}.thisWin;
handles.FPD = varargin{1}.FPD;
handles.numberOfEqns = varargin{1}.numberOfEqns;
NOEq = handles.numberOfEqns;


% setting up equation options Pop-up menu
eqs_opts = cell(NOEq, 1);
for i=1:NOEq,
    eqs_opts{i} = ['Equation', num2str(i)];
end

set(handles.ch2eqsPopUp, 'String', eqs_opts);

% setting enterEqSText
enterEqSText = cell(2, 1);
enterEqSText{1} = 'Enter the Equation :';
enterEqSText{2} = ['(Only use variables a1 ... a', ...
    num2str(NOEq), ')'];
set(handles.ch2enterEqSText, 'String', enterEqSText);

handles.IntvlDefault = -5999; % just a strange number :)

% initializing equations cell array
handles.cellEqns = cell(NOEq, 1);
for i=1:NOEq
    handles.cellEqns{i} = handles.IntvlDefault;
end
% initializing itervals

handles.EqIntvls = handles.IntvlDefault*ones(NOEq, 2);


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


% --- Executes on selection change in ch2eqsPopUp.
function ch2eqsPopUp_Callback(hObject, eventdata, handles)
% hObject    handle to ch2eqsPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ch2eqsPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ch2eqsPopUp

% showing saved amounts
chosenEqNumber = get(handles.ch2eqsPopUp, 'Value');

if handles.cellEqns{chosenEqNumber} ~= handles.IntvlDefault
    set(handles.ch2secondEqEdit, 'String', handles.cellEqns{chosenEqNumber});
else
    set(handles.ch2secondEqEdit, 'String', ''); 
end
if handles.EqIntvls(chosenEqNumber, 1) ~= handles.IntvlDefault
    set(handles.ch2secondIntvlStart, 'String', ...
        num2str(handles.EqIntvls(chosenEqNumber, 1)));
else
    set(handles.ch2secondIntvlStart, 'String', '');
end
if handles.EqIntvls(chosenEqNumber, 2) ~= handles.IntvlDefault
    set(handles.ch2secondIntvlEnd, 'String', ...
        num2str(handles.EqIntvls(chosenEqNumber, 2)));
else
    set(handles.ch2secondIntvlEnd, 'String', '');
end
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function ch2eqsPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2eqsPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch2secondEqEdit_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondEqEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch2secondEqEdit as text
%        str2double(get(hObject,'String')) returns contents of ch2secondEqEdit as a double


% --- Executes during object creation, after setting all properties.
function ch2secondEqEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2secondEqEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch2secondIntvlStart_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondIntvlStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch2secondIntvlStart as text
%        str2double(get(hObject,'String')) returns contents of ch2secondIntvlStart as a double


% --- Executes during object creation, after setting all properties.
function ch2secondIntvlStart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2secondIntvlStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch2secondIter_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch2secondIter as text
%        str2double(get(hObject,'String')) returns contents of ch2secondIter as a double


% --- Executes during object creation, after setting all properties.
function ch2secondIter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2secondIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function ch2secondIntvlEnd_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondIntvlEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ch2secondIntvlEnd as text
%        str2double(get(hObject,'String')) returns contents of ch2secondIntvlEnd as a double


% --- Executes during object creation, after setting all properties.
function ch2secondIntvlEnd_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2secondIntvlEnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ch2secondStepsLB.
function ch2secondStepsLB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ch2secondStepsLB contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ch2secondStepsLB


% --- Executes during object creation, after setting all properties.
function ch2secondStepsLB_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ch2secondStepsLB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ch2secondSolvePB.
function ch2secondSolvePB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondSolvePB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

for i=1:handles.numberOfEqns
    if handles.cellEqns{i} == handles.IntvlDefault
        errordlg(['Equation ', num2str(i), ' Data not complete!'],'Invalid Input','modal')
        uicontrol(hObject)
        return
    end
    if handles.EqIntvls(i, 1) == handles.IntvlDefault
        errordlg(['Equation ', num2str(i), 'Interval Data not complete!'],'Invalid Input','modal')
        uicontrol(hObject)
        return
    end
    if handles.EqIntvls(i, 2) == handles.IntvlDefault
        errordlg(['Equation ', num2str(i), 'Interval Data not complete!'],'Invalid Input','modal')
        uicontrol(hObject)
        return
    end
end

if handles.numberOfEqns == 2
    axes(handles.ch2secondAxes);
    ezplot(subs(handles.cellEqns{1}), ...
        [handles.EqIntvls(1, 1), handles.EqIntvls(1, 2), ...
        handles.EqIntvls(2, 1), handles.EqIntvls(2, 2)]);

    hold on
    axes(handles.ch2secondAxes);
    ezplot(subs(handles.cellEqns{2}), ...
        [handles.EqIntvls(1, 1), handles.EqIntvls(1, 2), ...
        handles.EqIntvls(2, 1), handles.EqIntvls(2, 2)]);

end

numOfIter = str2num(get(handles.ch2secondIter, 'String'));

[~, steps] = genNewtonRaphson(handles.cellEqns, handles.numberOfEqns, ...
    handles.EqIntvls, numOfIter, handles.FPD);

set(handles.ch2secondStepsLB, 'String', steps);
guidata(hObject, handles);

% --- Executes on button press in ch2secondHideGraphCB.
function ch2secondHideGraphCB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondHideGraphCB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch2secondHideGraphCB
if get(handles.ch2secondHideGraphCB, 'Value') == 0,
    set(handles.ch2secondAxes, 'Visible', 'on');
    ch2axes2 = get(handles.ch2secondAxes, 'children');
    set(ch2axes2, 'Visible', 'on');
    
else
    ch2axes2 = get(handles.ch2secondAxes, 'children');
    set(ch2axes2, 'Visible', 'off');
    set(handles.ch2secondAxes, 'Visible', 'off');
end


% --- Executes on button press in ch2secondHideStepsCB.
function ch2secondHideStepsCB_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondHideStepsCB (see GCBO)
% eventdata  reserved - to be ;defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch2secondHideStepsCB
if get(handles.ch2secondHideStepsCB, 'Value') == 0,
    set(handles.ch2secondStepsLB, 'Visible', 'on');
else
    set(handles.ch2secondStepsLB, 'Visible', 'off');
end


% --- Executes on button press in ch2secondConfirmEqn.
function ch2secondConfirmEqn_Callback(hObject, eventdata, handles)
% hObject    handle to ch2secondConfirmEqn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

chosenEqNumber = get(handles.ch2eqsPopUp, 'Value');

handles.cellEqns{chosenEqNumber} = get(handles.ch2secondEqEdit, 'String');

handles.EqIntvls(chosenEqNumber, :) = ...
    [str2double(get(handles.ch2secondIntvlStart, 'String')), ...
    str2double(get(handles.ch2secondIntvlEnd, 'String'))];
guidata(hObject, handles);
