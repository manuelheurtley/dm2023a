import  numpy as np

np.random.seed(151153)

#calcula cuantos encestes logra un jugador con indice de enceste prob
#que hace qyt tiros libres

def ftirar(prob, qty):
  return sum(np.random.rand(qty) < prob)



#defino los jugadores
jugadores = [0.7] * 100


#vectorizo la funcion  ftirar
vec_ftirar = np.vectorize(ftirar)

suma_diferencias = 0

for i in range(10000):
  vaciertos = vec_ftirar(jugadores, 100) #10 tiros libres cada jugador
  mejor = np.argmax(vaciertos)
  aciertos_torneo = vaciertos[mejor]
  aciertos_segunda = vec_ftirar(jugadores[mejor], 100)
  suma_diferencias += (aciertos_torneo - aciertos_segunda)



print(suma_diferencias/10000)
