declare
functor FreeVarsModule
export FreeSet
define

fun {FreeVars Expression FreeVariables}
   case Expression of nil then FreeVariables
   [] let(Left#Right Result) then {List.filter {Append FreeVariables {FreeVars Right nil}} fun {$ X} {Not X == Left} end}
   [] lam(Id Body) then {List.filter {FreeVars Body FreeVariables} fun {$ X} {Not X == Id} end}
   [] apply(Left Right) then {List.flatten FreeVariables | {FreeVars Left nil} | {FreeVars Right nil}}
   [] Id then Id|FreeVariables
   end
end

fun {TakeUnique Vars Result}
   case Vars of nil then Result
   [] H|T then if {List.member H Result} then Result else H|Result end
   end
end

fun {FreeSet Expression}
   {TakeUnique {FreeVars Expression nil} nil}
end

end
