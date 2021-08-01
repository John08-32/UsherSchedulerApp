(*
    A console app for generating a schedule of who's on usher duty for a given month. 
    Ideally it should allow the user to enter the names seperated by commas and a list of dates to assign.
    
    So far only the Wednesday night slot is implemented.
*)

(* 
    These values should be assigned in the console by the user:
*)
val names = ["John","Mark","Hap","Jack"];
val targetMonth : string = "September";
val wedsInMonth = [1,8,15,22,29];
val sundaysInMonth = [5,12,19,26];

(* 
    Example Read from console:
*)
(* val my_text : string = TextIO.input TextIO.stdIn;

print my_text; *)

(* 
    This stray value needs to exist outside of the get getRndN function for some reason.
    Or at least, I can't get it to work nested in a let expression.
    See https://stackoverflow.com/questions/22067535/generating-a-random-number-in-sml
*)
val r = Random.rand(1,1);

fun getRndN(min : int, max : int)=
    let val nextInt = Random.randRange(min,max)
    in
        nextInt r
    end;

fun getRndName(lOfNames : string list)=
    List.nth(lOfNames, getRndN(0, length names - 1))

(* 
    Returns a list of concated strings where a man is assigned to each Wed provided as an int list in the args 
*)
fun assignWedList(weds : int list)=
    if null (weds)
    then []
    else 
        let fun assignWed(wed : int)=
            let val timeSlot = "Wednesday, " ^ targetMonth ^ " " ^ Int.toString(wed) ^ " - "
            in
                timeSlot ^ getRndName(names)
            end
        in
            assignWed(hd weds)::assignWedList(tl weds)
        end

val weds = assignWedList(wedsInMonth);

(* 
    Returns a list of concated strings where 4 men are assigned to each sunday (both AM & PM meetings) provided as an int list in the args 
*)

fun assignSunList(suns : int list)=
    if null (suns)
    then []
    else 
        let fun assignSun(sun : int)=
            let val timeSlot = "Sunday, " ^ targetMonth ^ " " ^ Int.toString(sun) ^ " - " ^ "AM: "
            in
                timeSlot ^ getRndName(names) ^ " & " ^ getRndName(names) ^ " / PM: " ^ getRndName(names) ^ " & " ^ getRndName(names)
            end
        in
            assignSun(hd suns)::assignSunList(tl suns)
        end

val suns = assignSunList(sundaysInMonth);