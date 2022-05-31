% Variablen
w_lc = 1.1e4;
w_esr = 5.15e4;
w_sw = 45e5;
K_r = 1;

w_z1 = w_lc;
w_p1 = w_esr;
w_z2 = w_sw / 50;
w_p2 = w_sw / 2;

% Term 1
z1 = [w_z1];
n1 = [1 0];
tf1 = tf(z1, n1);

% Term 2
z2 = [1/w_z1 1];
n2 = [1/w_p1 1];
tf2 = tf(z2, n2);

% Term 3
z3 = [1/w_z2 1];
n3 = [1/w_p2 1];
tf3 = tf(z3,n3);

% Zusammengesetzte Übertragungsfunktion
r_s = K_r * tf1 * tf2 * tf3;
save("mem.mat", "r_s", '-append', '-nocompression');

opts = bodeoptions();
opts.XLim={[10e2 10e6]};
bode(r_s, opts), grid;


% Mit Knickfrequenzen
 asymp(r_s, 10e2, 10e6);

