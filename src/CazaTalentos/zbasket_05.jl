using Random

Random.seed!(151153)

#calcula cuantos encestes logra un jugador con indice de enceste prob
#que hace qyt tiros libres

function ftirar(prob, qty)
  return  sum( rand() < prob for i in 1:qty )
end


#defino los jugadores
jugadores = fill( 0.7, 100 )





global suma_diferencias = 0

for i = 1:10000
  vaciertos = ftirar.(jugadores, 100)  #10 tiros libres cada jugador
  mejor = findmax( vaciertos )[2]
  aciertos_torneo = vaciertos[ mejor ] 

  aciertos_segunda = ftirar.( jugadores[ mejor ], 100 )

  global suma_diferencias += ( aciertos_torneo - aciertos_segunda )
end

println(  suma_diferencias/10000 )
