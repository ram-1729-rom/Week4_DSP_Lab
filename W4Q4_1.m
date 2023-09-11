data = load("Exp4Data2.txt");

window = hamming(500);
x1 = data .* window';

N = 10000;
m1 = abs(fft(x1, N));
f1 = (0:length(m1)-1) * 1/N;

figure;
plot(f1, m1)
title("With Hamming")
xlabel("Frequency (Hz)");
ylabel("Amplitude");

threshold = max(m1) * 0.1; 
[pks, locs] = findpeaks(m1, 'MinPeakHeight', threshold, 'SortStr', 'descend');

fprintf('Dominant Frequencies (in terms of Fs):\n');
for i = 1:min(2, length(locs))
    freq_in_hz = f1(locs(i));
    fprintf('Peak %d: %.3f Hz\n', i, freq_in_hz);
end
