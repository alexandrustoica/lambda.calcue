declare
functor Substitute
export
   substitute:Substitute
define

fun {Substitute Binding InExpression}
   local R in
      [R] = {Module.apply [Rename]}
      case Binding of nil then nil
      [] Id#Expression then
         {R.replaceIn {R.rename InExpression} Id Expression}
      end
   end
end

end
