(*
let val x = 5
in
    (let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
end
*)

(* ---------- *)

fun countup_from1 (x:int) =
    let fun count (from:int, to:int) =
        if from=to
        then to::[]
        else from :: count(from+1,to)
    in
        count(1,x)
    end
    val z = countup_from1(15);

fun countup_from1_better (x:int) =
    let fun count (from:int) =
        if from=x
        then x::[]
        else from :: count(from+1)
    in
        count 1
    end
    val z = countup_from1_better(15)

fun better_max (xs : int list) =
    if null xs
    then NONE
    else let (* fine to assume argument nonempty because it is local *)
        fun max_nonempty (xs : int list) =
            if null (tl xs) (* xs must not be [] *)
            then hd xs
            else let val tl_ans = max_nonempty(tl xs)
                in
                    if hd xs > tl_ans
                    then hd xs
                    else tl_ans
                end
        in
            SOME (max_nonempty xs)
        end
    val a = better_max(countup_from1_better(25))
    val b = better_max([1,9,39,3,5,13])