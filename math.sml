(*
Modules expose all of their contents by default, but what is exported may be
controlled by defining a signature of the exports for the module.

Example:
    - use "math.sml";
    [opening math.sml]
    structure math : sig val e : real end
    val it = () : unit
    - math.e;
    val it = 2.7182 : real
    - math.pi;
    stdIn:1.2-77.6 Error: unbound variable or constructor: pi in path math.pi
*)

structure math : sig
    val e : real
end = struct
    val e : real  = 2.7182
    val pi : real = 3.1415
end