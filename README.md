# Sistema ANFIS para Predicción de ENB2012

## Descripción

Este proyecto implementa un **Sistema de Inferencia Neuro-Difusa Adaptativa (ANFIS)** en MATLAB para predecir variables relacionadas con la eficiencia energética de edificios, utilizando el dataset `ENB2012_data.csv`.

El modelo utiliza **5 variables de entrada** y predice la **carga de enfriamiento**.

## Características

- Generación de FIS mediante partición por cuadrícula
- Funciones de pertenencia: campana gaussiana (gbellmf)
- Entrenamiento por 500 épocas
- Evaluación y visualización de resultados
- Cálculo de errores absolutos y relativos

## Requisitos

- **MATLAB**
- Toolboxes necesarios:
  - Fuzzy Logic Toolbox
  - Statistics and Machine Learning Toolbox
