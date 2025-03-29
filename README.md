# Ejemplo de Aplicación Flutter con Patrón BLoC

Este repositorio contiene una implementación básica de una aplicación Flutter utilizando el patrón **BLoC** (Business Logic Component) para manejar el estado de la aplicación de manera eficiente y reactiva.

## Descripción

Este proyecto muestra cómo gestionar el estado en una aplicación Flutter utilizando **Streams** y **Sinks** mediante el patrón BLoC. La aplicación es un contador simple donde puedes incrementar o decrementar un valor, demostrando cómo los eventos son procesados y cómo los estados son manejados de manera separada de la interfaz de usuario.

## Estructura del Proyecto

- `lib/`: Contiene el código de la aplicación.
  - `main.dart`: El archivo principal de Flutter.
  - `blocs/`: Contiene los archivos de la lógica de negocio del patrón BLoC (evento y estado).
    - `counter_bloc.dart`: Implementación del BLoC que maneja los eventos y actualiza el estado.
    - `counter_event.dart`: Define los eventos que el BLoC manejará.
  - `screens/`: Contiene la UI de la aplicación.
    - `counter_screen.dart`: La pantalla principal que muestra el contador y los botones para incrementar y decrementar.

## Instrucciones para Ejecutar el Proyecto

1. Clona este repositorio en tu máquina local:
    ```bash
    git clone https://github.com/davidet/my_flutter_bloc_example.git
    ```

2. Navega al directorio del proyecto:
    ```bash
    cd my_flutter_bloc_example
    ```

3. Instala las dependencias:
    ```bash
    flutter pub get
    ```

4. Corre la aplicación en un emulador o dispositivo físico:
    ```bash
    flutter run
    ```

## Explicación del Código

### 1. Eventos
Los eventos representan las acciones que ocurren en la aplicación, como incrementar o decrementar el contador. Estos eventos son procesados por el BLoC.

```dart
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}
