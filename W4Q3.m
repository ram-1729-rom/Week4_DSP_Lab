duration = 10;          
sampling_rate = 200;   
t = 0:1/sampling_rate:duration; 
A = 140;
B = 146;

line_color = 'r';

xa = 0.1 * sin(A * pi * t) + cos(B * pi * t);

num_samples = [215, 415, 1115, 1515, 1915];

for i = 1:length(num_samples)
    num_sample = num_samples(i);
    x_sampled = xa(1:num_sample);
    
    window = hann(num_sample);
    x_windowed = x_sampled .* window';
    
    X = fft(x_windowed);
    
    figure;
    stem(abs(X), line_color);
    title(['DFT of windowed xa(t) for A = ', num2str(A), ', B = ', num2str(B), ', and ', num2str(num_sample), ' samples with Hanning window']);
    xlabel('Frequency Bin');
    ylabel('Magnitude');
end
