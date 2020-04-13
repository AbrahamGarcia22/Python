import random
def throw():
    return (int((random.random()*10)%6+1))
respuesta=True
while (respuesta):
    a=throw()
    b=throw()
    print('\nEl primer numero es',a)
    print('El segundo numero es',b)
    print('La suma es',a+b)
    resp=input('\n¿Quieres voler a tirar? (\'s\' para continuar o cualquier otra tecla para finalizar \n')
    if(resp!='s'):
        respuesta=False
    else:
        pass
