load("Exp4Data2.txt")

Fs = 1000; 

x = Exp4Data2;

N = length(x);
m = abs(fft(x, 10000));

f = (0:length(m)-1) * (Fs / length(m));

figure;
plot(f, m)
title("Frequency Spectrum")
xlabel("Frequency (Hz)")
ylabel("Amplitude")
grid on;

[pks, locs] = findpeaks(m, 'SortStr', 'descend', 'NPeaks', 2);

fprintf('Dominant Frequencies (in terms of Fs):\n');
for i = 1:length(locs)
    freq_in_hz = f(locs(i));
    fprintf('Peak %d: %.3f Hz\n', i, freq_in_hz);
end
