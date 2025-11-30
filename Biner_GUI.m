function varargout = Biner_GUI(varargin)
% BINER_GUI MATLAB code for Biner_GUI.fig
%      BINER_GUI, by itself, creates a new BINER_GUI or raises the existing
%      singleton*.
%
%      H = BINER_GUI returns the handle to a new BINER_GUI or the handle to
%      the existing singleton*.
%
%      BINER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BINER_GUI.M with the given input arguments.
%
%      BINER_GUI('Property','Value',...) creates a new BINER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Biner_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Biner_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Biner_GUI

% Last Modified by GUIDE v2.5 30-Nov-2025 03:06:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Biner_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Biner_GUI_OutputFcn, ...
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


% --- Executes just before Biner_GUI is made visible.
function Biner_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Biner_GUI (see VARARGIN)

% Choose default command line output for Biner_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Biner_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Biner_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
guidata(hObject, handles);
movegui(handles.figure1,'center');

if ~isfield(handles, 'uploadCount')
    handles.uploadCount = 0;
end

[nama_file,nama_path] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif'}, 'Buka Citra');

if ~isequal(nama_file,0)
    data = imread(fullfile(nama_path,nama_file));
    citra_grey = rgb2gray(data);
    citra_biner = imbinarize(citra_grey);

    handles.uploadCount = handles.uploadCount + 1;

    if handles.uploadCount == 1
        handles.data1 = citra_biner;
        axes(handles.axes1);
        imshow(citra_biner);
        title('Citra Biner');
    elseif handles.uploadCount == 2
        handles.data2 = citra_biner;
        axes(handles.axes2);
        imshow(citra_biner);
        title('Citra Biner');
    else
    end

    guidata(hObject,handles);
    set(handles.axes4, 'Visible', 'off');
else
    return
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);

set(handles.axes4, 'Visible', 'off');
cla(handles.axes4);
title(handles.axes4, '');  

% Cek apakah data sudah ada
if ~isfield(handles, 'data1') || ~isfield(handles, 'data2')
    warndlg('Silakan upload gambar untuk axes1 dan axes2 terlebih dahulu.');
    return;
end

% Ambil citra dari handles
citra1 = handles.data1;     % Citra biner upload 1
citra2 = handles.data2;     % Citra biner upload 2

% --- Resize otomatis agar ukuran sama ---
ukuran1 = size(citra1);
citra2_resized = imresize(citra2, ukuran1(1:2));   % resize citra2 mengikuti citra1

% Operasi AND
hasil = citra1 & citra2_resized;

% Simpan hasil
handles.hasilAND = hasil;

% Tampilkan hasil di axes4
axes(handles.axes3);
imshow(hasil);
title('Hasil Operasi AND');
guidata(hObject, handles);





% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);

if ~isfield(handles, 'data1') || ~isfield(handles, 'data2')
    warndlg('Silakan upload gambar untuk axes1 dan axes2 terlebih dahulu.');
    return;
end

citra1 = handles.data1;   
citra2 = handles.data2;   
ukuran1 = size(citra1);
citra2_resized = imresize(citra2, ukuran1(1:2));
hasilNOT1 = ~citra1;            
hasilNOT2 = ~citra2_resized;    
handles.hasilNOT1 = hasilNOT1;
handles.hasilNOT2 = hasilNOT2;

axes(handles.axes3);
imshow(hasilNOT1);
title('NOT Citra 1');
axes(handles.axes4);
imshow(hasilNOT2);
title('NOT Citra 2');
guidata(hObject, handles);


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton4,'value',0);
set(handles.radiobutton5,'value',0);

set(handles.axes4, 'Visible', 'off');
cla(handles.axes4); 
title(handles.axes4, '');  


% Cek apakah data sudah ada
if ~isfield(handles, 'data1') || ~isfield(handles, 'data2')
    warndlg('Silakan upload gambar untuk axes1 dan axes2 terlebih dahulu.');
    return;
end

% Ambil citra biner dari handles
citra1 = handles.data1;     % Citra biner upload 1
citra2 = handles.data2;     % Citra biner upload 2

% --- Resize otomatis supaya ukuran sama ---
ukuran1 = size(citra1);
citra2_resized = imresize(citra2, ukuran1(1:2));

% --- Operasi OR ---
hasil = citra1 | citra2_resized;

% Simpan hasil jika dibutuhkan
handles.hasilOR = hasil;

% Tampilkan hasil di axes4
axes(handles.axes3);
imshow(hasil);
title('Hasil Operasi OR');
guidata(hObject, handles);


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton5,'value',0);


% Pastikan data sudah diupload
if ~isfield(handles, 'data1') || ~isfield(handles, 'data2')
    warndlg('Silakan upload gambar untuk axes1 dan axes2 terlebih dahulu.');
    return;
end

citra1 = handles.data1;   % Citra biner upload pertama
citra2 = handles.data2;   % Citra biner upload kedua

ukuran1 = size(citra1);
citra2_resized = imresize(citra2, ukuran1(1:2));
   
hasil = xor(citra1, citra2_resized);

handles.hasilXOR = hasil;

axes(handles.axes3);
imshow(hasil);
title('Hasil Operasi XOR');
set(handles.axes4, 'Visible', 'off');
cla(handles.axes4); 
title(handles.axes4, '');  
guidata(hObject, handles);

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
set(handles.radiobutton1,'value',0);
set(handles.radiobutton2,'value',0);
set(handles.radiobutton3,'value',0);
set(handles.radiobutton4,'value',0);

if ~isfield(handles, 'data1') || ~isfield(handles, 'data2')
    warndlg('Silakan upload gambar untuk axes1 dan axes2 terlebih dahulu.');
    return;
end

citra1 = handles.data1;  
citra2 = handles.data2;  

ukuran1 = size(citra1);
citra2_resized = imresize(citra2, ukuran1(1:2));

masking = citra1 & citra2_resized;      
inverseMasking = citra1 & ~citra2_resized; 

handles.masking = masking;
handles.inverseMasking = inverseMasking;

axes(handles.axes3);
imshow(masking);
title('Hasil Masking');

axes(handles.axes4);
imshow(inverseMasking);
title('Inverse Masking');
guidata(hObject, handles);
