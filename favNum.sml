(*
Every Standard ML program is composed of modules. Modules group together a set
of definitions. Here, we define a module named Modules by using the structure
keyword, with one definition, fun favouriteNum ().

Example:
    - use "favNum.sml";
    [opening favNum.sml]
    structure favNum :
    sig
        type char = char
        ...
    val it = () : unit
    - favNum.favouriteNum();
    My favourite number is 0
    val it = () : unit
*)

structure favNum = struct
    open String
    structure R = Random

    fun favouriteNum () =
        let
            val seed = R.rand (0, 10)
            val myInt = R.randRange (0, 100) seed
            in print ("My favourite number is " ^ (Int.toString myInt) ^ "\n")
        end
end