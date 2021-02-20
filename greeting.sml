(*
    - use "greeting.sml";
    [opening greeting.sml]
    Hello.
    Valar morghulis.
    signature GREETING = sig val greeting : string end
    functor Greeter(G: sig val greeting : string end) :
                sig val greet : unit -> unit end
    structure EnglishGreeting : GREETING
    structure ValyrianGreeting : GREETING
    structure englishGreeter : sig val greet : unit -> unit end
    structure essosGreeter : sig val greet : unit -> unit end
    val it = () : unit
*)

signature GREETING = sig
  val greeting : string
end

functor Greeter (G : GREETING) = struct
  fun greet () = print G.greeting
end

structure EnglishGreeting : GREETING = struct
  val greeting = "Hello.\n"
end

structure ValyrianGreeting : GREETING = struct
  val greeting = "Valar morghulis.\n"
end

structure englishGreeter = Greeter(EnglishGreeting)
structure essosGreeter = Greeter(ValyrianGreeting)

val _ = englishGreeter.greet ()
val _ = essosGreeter.greet ()