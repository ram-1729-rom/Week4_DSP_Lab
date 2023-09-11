duration = 2;             
sampling_rate = 120;       
frequency = 30;            
N = duration * sampling_rate;  

t = linspace(0, duration, N);
signal = sin(2 * pi * frequency * t);

N1 = 120;
N2 = 130;

dft_sig_120 = abs(fft(signal(1:N1)))/N1;
dft_sig_130 = abs(fft(signal(1:N2)))/N2;

freq_120 = (0:N1-1)*(sampling_rate/N1);
freq_130 = (0:N2-1)*(sampling_rate/N2);

subplot(2,1,1);
stem(freq_120, dft_sig_120, 'Marker', 'o', 'DisplayName', 'DFT (N=120)');
title('Magnitude of DFT of First 120 samples');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on

subplot(2,1,2);
stem(freq_130, dft_sig_130, 'Marker', 'o', 'DisplayName', 'DFT (N=130)');
title('Magnitude of DFT of First 130 samples');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on
