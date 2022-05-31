% Angenommene Variablenwerte 
w_lc = 1.1 * 10^4;
w_esr = 5.15 * 10^4;

% Feste Parameter
K_mod = 20;
d = 0.3; % wählbar 0 .. 1

% Variante 1 -> w_lc, w_esr entsprechen angenommenen Werten
z1 = [1/w_esr 1];
n1 = [1/(w_lc^2) 2*d/w_lc 1];
gps_1 = K_mod * tf(z1, n1);

% Variante 1 -> w_lc, w_esr vertauscht
z2 = [1/w_lc 1];
n2 = [1/(w_esr^2) 2*d/w_esr 1];
gps_2 = K_mod * tf(z2, n2);


bode(gps_1, gps_2), grid;
legend("Variante 1", "Variante 2")

% -> Variante 1 entspricht dargestelltem Bodediagramm ==> angenommene
% Variablenwerte korrekt 
save("mem.mat", "gps_1", '-append', '-nocompression');