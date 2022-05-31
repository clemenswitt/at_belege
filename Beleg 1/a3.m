% Zu Beginn a1.m & a2.m ausführen!

% Funktionen aus A1 & A2 laden
load("mem.mat");

% Multiplikation der Kennlinien = graphische Addition auf DB-Skala
l_s = gps_1 * r_s;

opts = bodeoptions();
opts.XLim={[10e2 10e6]};
bode(gps_1, tf_all, l_s, opts), grid;
legend("Aufgabe 1", "Aufgabe 2", "Kombiniert")

%Mit Knickfrequenzen
%asymp(l_s, 10e2, 10e6);
