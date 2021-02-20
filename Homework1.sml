fun is_older(date1 : int * int * int, date2 : int * int * int) =
    if #1 date1 = #1 date2
    then
        if #2 date1 = #2 date2
        then
            if #3 date1 = #3 date2
            then false
            else #3 date1 < #3 date2
        else #2 date1 < #2 date2
    else #1 date1 < #1 date2

fun number_in_month(date_list : (int * int * int) list, month : int) =
    let
        fun check_month(x : int, y : int) =
            if x=y
            then 1
            else 0
    in
        if null date_list
        then 0
        else check_month( #2 (hd(date_list)), month ) + number_in_month(tl(date_list), month)
    end

(* Tests - delete before upload *)
val t1 = is_older((1961, 4, 30), (2020, 8, 4));
val t2 = is_older((2020, 8, 4), (1961, 4, 30));
val t3 = is_older((2020, 8, 4), (2020, 8, 4));

val t4 = number_in_month([(2020,1,1),(2020,2,1),(2020,2,2),(2020,2,3),(2020,3,1)],2)