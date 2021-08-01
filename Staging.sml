(*
    Provide a list of names and have the program evenly distrubte the names as much as possible
    among all the relevant days in a month (Sundays and Wednesdays)
*)
(* 
    The following values should be assigned in the console by the user:
*)

val names = ["John","Mark","Hap","Jack"];
val targetMonth : string = "September";
val wednesdays = [1,8,15,22,29];

(* 
    needs to exist outside of the get RandomNumber function for some reason...
*)
val r = Random.rand(1,1);

fun GetRndN(min : int, max :int)=
    let val nextInt = Random.randRange(min,max)
    in
        nextInt r
    end;

fun GetRndName(lOfNames : string list)=
    List.nth(lOfNames, GetRndN(0, length names - 1))

val test = GetRndName(names);

(* 
    Goal:
    assigns 1 man to each Wednesday
    Args: a list of wednesdays represented by an int

    Returns a list of concated strings where 1 man is assigned to each wed provided in the args 
*)

(* fun AssignListOfWeds(weds : int list)=
    let val name = GetRndName(names)
    in
        let fun GetWed(xs : int list)=
            if null (tl xs)
            then hd xs
            else GetWed(tl xs)
        in
        end
        (* "Wednesday, " ^ targetMonth ^ " " ^ Int.toString(wed) ^ " - " ^ name *)
    end

    val test = AssignListOfWeds(wednesdays); *)

(* fun GetWed(xs : int list)=
            if null (tl xs)
            then hd xs
            else GetWed(tl xs)

val test = GetWed(wednesdays); *)

(*
    mini version of the above where it just assigns one man to one wed

    Example output:
    Wednesday, July 7 - Hap
*)

fun AssignMultiWed(weds : int list)=
    if null (tl weds)
    then []
    else 
        let fun AssignSingleWed(wed : int)=
            let val name = GetRndName(names)
            in
                "Wednesday, " ^ targetMonth ^ " " ^ Int.toString(wed) ^ " - " ^ name
            end
        in
            AssignSingleWed(hd weds)::AssignMultiWed(tl weds)
        end

val test = AssignMultiWed(wednesdays);

(* fun AssignSingleWed(wed : int)=
    let val name = GetRndName(names)
    in
        "Wednesday, " ^ targetMonth ^ " " ^ Int.toString(wed) ^ " - " ^ name
    end

val test = AssignSingleWed(8); *)