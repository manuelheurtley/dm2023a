import  numpy as np

np.random.seed(151153)

#calcula cuantos encestes logra un jugador con indice de enceste prob
#que hace qyt tiros libres

def ftirar(prob, qty):
  return sum(np.random.rand(qty) < prob)



#defino los jugadores
peloton = np.array(range(501, 600)) / 1000
jordan = 0.85
jugadores = [0.6] * 99
jugadores = np.append(jordan, peloton)

#vectorizo la funcion  ftirar
vec_ftirar = np.vectorize(ftirar)

for i in range(10):
  vaciertos = vec_ftirar(jugadores, 100) #10 tiros libres cada jugador
  mejor = np.argmax(vaciertos)
  aciertos_torneo = vaciertos[mejor]
  aciertos_segunda = vec_ftirar(jugadores[mejor], 100)
  print(aciertos_torneo, "\t", aciertos_segunda)


