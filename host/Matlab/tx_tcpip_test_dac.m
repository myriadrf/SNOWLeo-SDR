clc;
clear all;
close all;
%fid1=fopen('F:\matlab_work\frame36_300_up4.dat','r');
% fid1=fopen('F:\matlab_work\frame36_100.dat','r');
% fid1=fopen('F:\matlab_work\mcs7_450_20.dat','r');
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
%while (1)
%% send file tx cmd
%'16' is file size 16*1024 bytes
%'f0' is cmd head
%'10' is cmd word
%'1'  is dac mode(cycle or not);
dac_size=[1 0 hex2dec('10') hex2dec('f0') 16 0 0 0];
fwrite(t,dac_size,'uint8');
%% Write data to the zing and read from the host.
fwrite(t,txd7,'uint8');

%% Test register write and read
%'f0' is cmd head
%'22' is cmd word
% '00' is write cmd word
% '4' is bytes of register and data  e.g.{0x85,0x01, 0x89, 0x01}
% reg_wr_cmd = [hex2dec('4') hex2dec('00') hex2dec('22') hex2dec('f0') 0 0 0 0];
% fwrite(t,reg_wr_cmd,'uint8');

% '85' is register 0x05 | 1<<7(spi write cmd) to be written
% '01' is the data to be written to register 0x05
% '89' is register 0x09 | 1<<7(spi write cmd) to be written
% '02' is the data to be written to register 0x09
% reg_wr = [hex2dec('85') hex2dec('01') hex2dec('89') hex2dec('02')];
% fwrite(t,reg_wr,'uint8');

%'f0' is cmd head
%'22' is cmd word
% '01' is read cmd word
% '2' is bytes of register  e.g.{0x85, 0x89}
% reg_rd_cmd = [hex2dec('2') hex2dec('01') hex2dec('22') hex2dec('f0') 0 0 0 0];
% fwrite(t,reg_rd_cmd,'uint8');

% '05' is register 0x05  to be read
% '09' is register 0x09  to be read
% reg_rd = [hex2dec('05') hex2dec('09')];
% fwrite(t,reg_rd,'uint8');

%% read reg data from net
% reg = fread(t, 2, 'uint8');

%% send tx freq set cmd
freq_hex=dec2hex(1900e6,8);
tx_freq=[0 0 hex2dec('17') hex2dec('f0') hex2dec(freq_hex(7:8)) hex2dec(freq_hex(5:6)) hex2dec(freq_hex(3:4)) hex2dec(freq_hex(1:2))];
fwrite(t,tx_freq,'uint8');
%% send tx vga set cmd
tx_vga=[hex2dec('1d') hex2dec('00') hex2dec('19') hex2dec('f0') 0 0 hex2dec('00') hex2dec('0b')];
fwrite(t,tx_vga,'uint8');

%% send tx dc set cmd
% fwrite(t,[170 115 hex2dec('21') hex2dec('f0') 0 0 0 0],'uint8');
fwrite(t,[0 0 hex2dec('21') hex2dec('f0') 0 0 0 0],'uint8');

% %% send dac start cmd
% dac_start=[0 0 hex2dec('13') hex2dec('f0') 0 0 0 0];
% fwrite(t,dac_start,'uint8');

% send disconnect cmd
con_stop=[0 0 hex2dec('16') hex2dec('f0') 0 0 0 0];
fwrite(t,con_stop,'uint8');
fclose(t);
delete(t);
clear t;

