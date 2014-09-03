clc;
clear;
close all;
warning off;
cyc=1;
%% TCPIP_Recv
link = tcpip('192.168.1.10', 8000);
set(link,'InputBufferSize',256*1024);
set(link,'OutputBufferSize',16*1024);
fopen(link);

%% send rx size cmd
rx_size=[0 0 hex2dec('11') hex2dec('f0') 0 hex2dec('1') 0 0]
fwrite(link,rx_size,'uint8');

%% send rx freq
freq_hex=dec2hex(1900e6,8);
rx_freq=[0 0 hex2dec('18') hex2dec('f0') hex2dec(freq_hex(7:8)) hex2dec(freq_hex(5:6)) hex2dec(freq_hex(3:4)) hex2dec(freq_hex(1:2))];
fwrite(link,rx_freq,'uint8');

%% send rx vga
rx_vga=[0 hex2dec('d0') hex2dec('20') hex2dec('f0') 0 0 0 hex2dec('03')];
fwrite(link,rx_vga,'uint8');

while (1)
    %% send adc start cmd
    adc_start=[0 0 hex2dec('12') hex2dec('f0') 0 0 0 0];
    fwrite(link,adc_start,'uint8');
    %data=zeros(64*1024,1);
    
    %% read 256*1024 bytes data from zing
    data = fread(link,256*1024,'uint8');
    
    %% send adc stop cmd
    %adc_stop=[0 0 hex2dec('14') hex2dec('f0') 0 0 0 0];
    %fwrite(link,adc_stop,'uint8');
    
    %% receive
    figure(1);clf;
    datah=data(2:2:end);
    datal=data(1:2:end);
    datah_hex=dec2hex(datah,2);
    datal_hex=dec2hex(datal,2);
    data_hex(:,1:2)=datah_hex;
    data_hex(:,3:4)=datal_hex;
    dataun=hex2dec(data_hex);
    datain=dataun-(dataun>32767)*65536;
    a1=datain(2:2:end);
    a2=datain(1:2:end);
    [uV sV] = memory;
    mem=round(uV.MemUsedMATLAB/2^20);
    subplot(221);
    plot(a1,'b');
    hold on
    plot(a2,'r');
    subplot(222);
    plot(a1,a2);
    title(['ÐÅºÅ²¨ÐÎ cyc=',num2str(cyc),';mem=',num2str(mem),'MB']);
    pause;
    cyc=cyc+1;
    %clearvars -except cyc;
    %clear maplemex
end

%% send disconnect cmd
con_stop=[0 0 hex2dec('16') hex2dec('f0') 0 0 0 0];
fwrite(link,con_stop,'uint8');
fclose(link);
delete(link);
clear link;
