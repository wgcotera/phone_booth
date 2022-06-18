# Cabina Telefónica

Este proyecto consiste en implementar un programa en lenguaje ensamblador que simule el funcionamiento de una cabina telefónica.

- El usuario puede ingresar monedas de diferentes denominaciones desde 5 centavos, y puede ingresar tantas monedas cómo desee.
- El usuario ingresa el número al que desea llamar. (Validar)
- El costo de la llamada por minuto será generado de manera aleatoria entre un valor de 10 y 40 centavos de dólar.
- Luego se deberá simular la llamada, y el usuario podrá colgar, o la llamada puede terminar debido a que se le terminó el saldo.
- La cabina deberá mostrar una alerta cuando el saldo sea menor a $ 0.05
- La cabina dará vuelto en caso de ser necesario. Recuerde que la mínima denominación son monedas de 5 centavos.

## Ejemplo 1:

```
Ingrese monedas: 0.10
Ingrese monedas: 0.10
Ingrese monedas: 0.25
Ingrese monedas: 0.56 – Moneda Incorrecta
Ingrese monedas:-1

Saldo: $ 0.45

Ingrese el número a llamar: 0986782563

Costo de llamada: $ 0.12

¿Iniciar llamada? Si

1. Llamada en curso . . . Presiona C para colgar
2. Llamada en curso . . . Presiona C para colgar
3. Llamada en curso . . . Presiona C para colgar
4. Llamada en curso . . . Presiona C para colgar
5. Llamada en curso . . . Presiona C para colgar
6. Llamada en curso . . . Presiona C para colgar
7. Llamada en curso . . . Presiona C para colgar
8. Llamada en curso . . . Presiona C para colgar
9. Llamada en curso . . . Presiona C para colgar

C

Duración de la llamada: 00:00:10

Costo de la llamada: $ 0.02

Cambio: $ 0.40
```
