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

(* 
    Example Read from console:
*)
val my_text : string = TextIO.input TextIO.stdIn;

print my_text;

(* 
    This stray value needs to exist outside of the get GetRndN function for some reason.
    Or at least, I can't get it to work nested in a let expression.
    See https://stackoverflow.com/questions/22067535/generating-a-random-number-in-sml
*)
val r = Random.rand(1,1);

fun GetRndN(min : int, max :int)=
    let val nextInt = Random.randRange(min,max)
    in
        nextInt r
    end;

fun GetRndName(lOfNames : string list)=
    List.nth(lOfNames, GetRndN(0, length names - 1))

(* 
    Returns a list of concated strings where a man is assigned to each Wed provided as an int list in the args 
*)
fun AssignWedList(weds : int list)=
    if null (weds)
    then []
    else 
        let fun AssignWed(wed : int)=
            let val name = GetRndName(names)
            in
                "Wednesday, " ^ targetMonth ^ " " ^ Int.toString(wed) ^ " - " ^ name
            end
        in
            AssignWed(hd weds)::AssignWedList(tl weds)
        end

val test = AssignWedList(wedsInMonth);