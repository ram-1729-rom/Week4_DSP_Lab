duration = 10;        
sampling_rate = 200;   
t = 0:1/sampling_rate:duration; 
A = 140;
B = 146;

xa = 0.1 * sin(A * pi * t) + cos(B * pi * t);

num_samples = [215, 415, 1115, 1515, 1915];

for i = 1:length(num_samples)
    num_sample = num_samples(i);
    x_sampled = xa(1:num_sample);
    
    X = fft(x_sampled);
    
    figure;
    stem(abs(X));
    title(['DFT of xa(t) for A = ', num2str(A), ', B = ', num2str(B), ', and ', num2str(num_sample), ' samples']);
    xlabel('Frequency Bin');
    ylabel('Magnitude');
end
