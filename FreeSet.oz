declare
functor FreeVarsModule
export FreeSet
define

fun {FreeVars Expression FreeVariables}
   case Expression of nil then FreeVariables
   [] let(Left#Right Result) then
      {List.filter
       {List.flatten FreeVariables |
        {FreeVars Right nil} |
        {FreeVars Result nil}}
       fun {$ X} {Not X == Left} end}
   [] lam(Id Body) then
      {List.filter {FreeVars Body FreeVariables}
       fun {$ X} {Not X == Id} end}
   [] apply(Left Right) then
      {List.flatten FreeVariables |
       {FreeVars Left nil} |
       {FreeVars Right nil}}
   [] Id then Id|FreeVariables
   end
end

fun {FreeSet Expression}
   {FreeVars Expression nil}
end

end
