# Tutorial de Chris
# f(u,p,t) = α u
# Decaimiento exponencial
using DifferentialEquations
f(u,p,t) = 0.98u 
u₀ = 1.0
tspan = (0.0,1.0)
prob = ODEProblem(f,u₀,tspan)

sol = solve(prob)

using Plots
gr()

plot(sol,lw = 2,tittle="Solucion de la ecuacion diferencial",xaxis="Tiempo(t)",yaxis="u(t)(en μm)",label = "Linea gruesa")

plot!(sol.t, t->1.0*exp(0.98t),lw=2,ls=:dash,label="Solucion verdadera")

sol.t # son los valores del tiempo que la solucion usa
sol.u # lo mismo pero de u

sol
sol = solve(prob,abstol = 1e-8,reltol = 1e-8)

sol = solve(prob,saveat = 0.1)
scatter(sol)


# Como elegir el algoritmo