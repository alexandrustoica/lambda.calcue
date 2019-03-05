declare
functor Rename
export
   replaceIn:ReplaceIn
   rename:Rename
define

Generator = {NewCell 0}
fun {NewId}
   Generator := @Generator + 1
   {VirtualString.toAtom "id<" # {Int.toString @Generator} # ">"}
end

fun {ReplaceIn Expression Id WithId}
   case Expression of nil then Expression
   [] let(L#R Result) then
      let({ReplaceIn L Id WithId}#{ReplaceIn R Id WithId}
          {ReplaceIn Result Id WithId})
   [] lam(T Body) then
      lam({ReplaceIn T Id WithId} {ReplaceIn Body Id WithId})
   [] apply(Left Right) then
      apply({ReplaceIn Left Id WithId} {ReplaceIn Right Id WithId})
   [] T then if T == Id then WithId else T end
   end
end

fun {Refactor Expression FreeVars}
   case Expression of nil then Expression
   [] let(L#R Result) then
      local NewIdForL in NewIdForL = {NewId}
         let({ReplaceIn L L NewIdForL}#{Refactor R FreeVars}
             {Refactor {ReplaceIn Result L NewIdForL} FreeVars})
      end
   [] lam(T Body) then
      local NewIdForT in NewIdForT = {NewId}
         lam({ReplaceIn T T NewIdForT}
             {Refactor {ReplaceIn Body T NewIdForT} FreeVars})
      end
   [] apply(L R) then apply({Refactor L FreeVars} {Refactor R FreeVars})
   [] Id then
      if {List.sub "id<" {Atom.toString Id}} then Id
      elseif {List.member Id FreeVars} then Id
      else {ReplaceIn Expression Id {NewId}} end
   end
end

fun {Rename Expression}
   local Free in
      [Free] = {Module.apply [Free]}
      {Refactor Expression {Free.variables Expression}}
   end
end

end
