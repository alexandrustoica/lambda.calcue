functor
import Application System
define
   ArgSpec =
   record(
      expr(type:string single optional:false char:&e))
   Args = {Application.getArgs ArgSpec}
   Expression = {String.toAtom Args.expr}
   {System.showInfo Expression}
   {Application.exit 0}
end
