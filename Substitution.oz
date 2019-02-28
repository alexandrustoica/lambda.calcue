declare
functor Substitute
export
   substitute:Substitute
define

fun {Substitute Binding InExpression}
   local Rename in
      [Rename] = {Module.apply [RenameModule]}
      case Binding of nil then nil
      [] Id#Expression then {Rename.replaceIn
          {Rename.rename InExpression} Id Expression}
      end
   end
end

end
