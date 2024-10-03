%---------TIDSDOMENET---------------------------------------------------------------------
% MITT SIGNAL iiiiiii
filename = 'lydfil.wav'; 
[sung_signal, fs] = audioread(filename);

disp(['Samplingfrekvens: ', num2str(fs), ' Hz']);
disp(['Antall samples i ditt signal: ', num2str(length(sung_signal))]);

% GENERATE 1000 Hz SIGNAL 
f = 1000;
t = (0:length(sung_signal)-1) / fs; % Tidsvektor basert på m_signal
clean_signal = sin(2 * pi * f * t);

% PLOT TIME DOMAIN
figure;
subplot(2,1,1);
plot(t, m_signal);
title('Sung signal');
xlim([0 0.05])
xlabel('Tid (s)');
ylabel('Amplitude');

subplot(2,1,2);
plot(t, g_signal);
title('Clean signal');
xlim([0 0.05])
xlabel('Tid (s)');
ylabel('Amplitude');

saveas(gcf, 'Signals.png'); %plot av begge signalene som png <3


%---------FREKVENSDOMENET---------------------------------------------------------------------
N = length(sung_signal); % antall samples
f_n = (0:N/2-1) * (fs/N); % frekvensvektor

% Calculate FFT
sung_fourier = fft(sung_signal); % FFT av mitt signal
clean_fourier = fft(clean_signal); % FFT av generert signal

% Calculate magnitudes, convert to dB
sung_dB = 20 * log10(abs(sung_fourier(1:N/2)));
clean_dB = 20 * log10(abs(clean_fourier(1:N/2)));

% PLOT FREQUENCY DOMAIN
figure;
plot(f_n, sung_dB, 'r'); % mitt signal - rød
hold on;
plot(f_n, clean_dB, 'b'); % generert signal blå
xlim([0 3000]); 
title('Magnitude Spectrum of Sung Signal and Clean Signal (in dB)');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Sung Signal', 'Clean Signal');
grid on;

saveas(gcf, 'Frequency.png'); 

