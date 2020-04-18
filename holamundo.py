import random
res = input("Â¿desea lanzar los dados?: SI/NO ")
while( res == 'SI' or 'si'):
    dado1 = random.choice([1,2,3,4,5,6])
    dado2 = random.choice([1,2,3,4,5,6])

    print("El dado uno ha caido en: " + (dado1) + " y el dado dos ha caido en: " + (dado2))
    print("La suma de los dos dados lanzados es: " + str(dado1 + dado2) + "\n")

    res = input("desea lanzar los dados nuevamente?: SI/NO")