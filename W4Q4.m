data = load('Exp4Data2.txt');

Fs = 1000; 

N = length(data); 
fft_result = fft(data);

frequencies = (0:N-1) * (Fs / N);

figure;
plot(frequencies, abs(fft_result));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency Spectrum');
grid on;

[pks, locs] = findpeaks(abs(fft_result), 'MinPeakHeight', max(abs(fft_result)) * 0.1);

fprintf('Dominant Frequencies (in terms of Fs):\n');
for i = 1:length(locs)
    freq_in_hz = frequencies(locs(i));
    fprintf('Peak %d: %.3f Hz\n', i, freq_in_hz);
end
