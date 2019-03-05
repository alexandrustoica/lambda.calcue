declare

local S in
   [S] = {Module.apply [Substitute]}
   {Browse {S.substitute x#lam(y z) apply(x lam(z apply(x z)))}}
end
