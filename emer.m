load('ENB2012_data.csv');

X = [ENB2012_data(:,1:5)];
y = [ENB2012_data(:,10)];

opt = genfisOptions('GridPartition');
opt.NumMembershipFunctions = [2 2 2 2 2];
opt.InputMembershipFunctionType = ["gbellmf" "gbellmf" "gbellmf" "gbellmf" "gbellmf"];
modelo = genfis(X,y,opt);

%ENTRENAMIENTO

modelo = anfis([X,y], modelo, 500); %entrena el modelo por medio de anfis 500 generaciones
showfis(modelo)

%EVALUACION DEL MODELO CON LOS DATOS ENTRENADOS
testoutput = evalfis(X, modelo);
compara = [testoutput ENB2012_data(:,5) ENB2012_data(:,3)]; %genera una matriz de comparacion de valores
                                     %obtenidos contra deseados
plot(compara);                       %plotea el resultado
title('Comparacion de salidas')
xlabel('Muestra')
ylabel('Velocidad (RPM)')
legend('Difusa','Esperada','F-T');
disp('pulse una tecla para continuar...')
pause

error=testoutput-y; %calcula el error como la diferencia de la salida obtenida %contra la deseada

comparae = [error];
plot(error);                       %plotea el resultado
title('Comparacion de errores')
xlabel('Muestras')
ylabel('Error Velocidad (RPM)')
disp('pulse una tecla para continuar...')
pause

errorp=abs(error)./y;                                         %contra la deseada
errorlp=abs(errorl)./y;
comparaep = [errorp errorlp];
plot(comparaep);                       %plotea el resultado
title('Comparacion de errores')
xlabel('Muestras')
ylabel('Error Velocidad (RPM)')
legend('Difuso','F-T');
disp('pulse una tecla para continuar...')
pause


%EVALUACION DEL MODELO CON LOS DATOS NO ENTRENADOS
testoutputn = evalfis([test(:,1) test(:,4)], modelo);
comparan = [testoutputn test(:,5) test(:,3)]; %genera una matriz de comparacion de valores
                                     %obtenidos contra deseados
plot(comparan);                       %plotea el resultado
title('Comparacion de salidas')
xlabel('Muestras')
ylabel('Velocidad (RPM)')
legend('Difusa','Esperada','F-T');
disp('pulse una tecla para continuar...')
pause

errorn=testoutputn-test(:,5);       %calcula el error como la diferencia de la salida obtenida                                         %contra la deseada
errorln=test(:,3)-test(:,5);
comparaen = [errorn errorln];
plot(comparaen);                       %plotea el resultado
title('Comparacion de errores')
xlabel('Muestras')
ylabel('Error Velocidad (RPM)')
legend('Difuso','F-T');
disp('pulse una tecla para continuar...')
pause

errorpn=abs(errorn)./test(:,5);                         %contra la deseada
errorlpn=abs(errorln)./test(:,5);
comparaepn = [errorpn errorlpn];
plot(comparaepn);                       %plotea el resultado
title('Comparacion de errores')
xlabel('Muestra')
ylabel('Error Velocidad (RPM)')
legend('Difuso','F-T');
disp('pulse una tecla para continuar...')
pause

% Ver el modelo en fuzzy             
fuzzy(modelo)
