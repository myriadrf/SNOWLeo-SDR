clc;
clear all;
close all;
fid1=fopen('F:\matlab_work\tone_16bit.dat','r');
txdata=fread(fid1,'int16');
txd1=(txdata<0)*65536+txdata;
txd2=dec2hex(txd1,4);
txd3=txd2(:,1:2);
txd4=txd2(:,3:4);
txd5=hex2dec(txd3);
txd6=hex2dec(txd4);
txd7=zeros(length(txd6)*2,1);
txd7(1:2:end)=txd6;
txd7(2:2:end)=txd5;
fclose('all');
t = tcpip('192.168.1.10', 8000);
set(t,'InputBufferSize',16*1024);
set(t,'OutputBufferSize',64*1024);
fopen(t);
%% send file tx cmd
%'16' is file size 16*1024 bytes
%'f0' is cmd head
%'10' is cmd
%'1'  is dac mode(cycle or not);
dac_size=[1 0 hex2dec('10') hex2dec('f0') 16 0 0 0];
fwrite(t,dac_size,'uint8');
%% Write data to the zing and read from the host.
fwrite(t,txd7,'uint8');
%% send tx freq set cmd
freq_hex=dec2hex(2417,4);
tx_freq=[hex2dec(freq_hex(3:4)) hex2dec(freq_hex(1:2)) hex2dec('17') hex2dec('f0') 0 0 0 0];
fwrite(t,tx_freq,'uint8');
%% send tx vga set cmd
tx_vga=[hex2dec('13') hex2dec('00') hex2dec('19') hex2dec('f0') 0 0 hex2dec('00') hex2dec('0b')];
fwrite(t,tx_vga,'uint8');
%% send dac start cmd
dac_start=[0 0 hex2dec('13') hex2dec('f0') 0 0 0 0];
fwrite(t,dac_start,'uint8');
%% send disconnect cmd
con_stop=[0 0 hex2dec('16') hex2dec('f0') 0 0 0 0];
fwrite(t,con_stop,'uint8');
fclose(t);
delete(t);
clear t;

