declare

fun {IsMember Environment Id}
   case Environment of nil then false
   [] Env then {List.member Id {List.map Env fun {$ X} X.1 end}}
   end
end

fun {Fetch Environment Id}
   local Variable in
      Variable = {List.filter Environment fun {$ Binding} Binding.1 == Id end}
      case Variable of nil then Id
      [] H|_ then H.2
      end
   end
end

fun {Adjoin Environment Binding}
   Binding | {List.filter Environment fun {$ Item} {Not Item.1 == Binding.1} end}
end

