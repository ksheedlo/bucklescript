let ((>::),
     (>:::)) = OUnit.((>::),(>:::))

let (=~) = OUnit.assert_equal    

let printer_string = fun x -> x 


let suites = 
  __FILE__ >::: 
  [
    __LOC__ >:: begin fun _ ->
      OUnit.assert_bool "not found " (Ext_string.rindex_neg "hello" 'x' < 0 )
    end;

    __LOC__ >:: begin fun _ -> 
      Ext_string.rindex_neg "hello" 'h' =~ 0 ;
      Ext_string.rindex_neg "hello" 'e' =~ 1 ;
      Ext_string.rindex_neg "hello" 'l' =~ 3 ;
      Ext_string.rindex_neg "hello" 'l' =~ 3 ;
      Ext_string.rindex_neg "hello" 'o' =~ 4 ;
    end;
    __LOC__ >:: begin 
      fun _ -> 
      let nl cur s = Ext_string.extract_until s cur '\n' in 
      nl (ref 0) "hello\n" =~ "hello";
      nl (ref 0) "\nhell" =~ "";
      nl (ref 0) "hello" =~ "hello";
      let cur = ref 0 in 
      let b = "a\nb\nc\nd" in 
      nl cur b =~ "a";
      nl cur b =~ "b";
      nl cur b =~ "c";
      nl cur b =~ "d";
      nl cur b =~ "" ;
      nl cur b =~ "" ;
      cur := 0 ;
      let b = "a\nb\nc\nd\n" in 
      nl cur b =~ "a";
      nl cur b =~ "b";
      nl cur b =~ "c";
      nl cur b =~ "d";
      nl cur b =~ "" ;
      nl cur b =~ "" ;
    end ;
    __LOC__ >:: begin fun _ -> 
      let b = "a\nb\nc\nd\n" in
      let a = Ext_string.index_count in 
      a b 0 '\n' 1 =~ 1 ;
      a b 0 '\n' 2 =~ 3;
      a b 0 '\n' 3 =~ 5;
      a b 0 '\n' 4 =~ 7; 
      a b 0 '\n' 5 =~ -1; 
    end ;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool "empty string" (Ext_string.rindex_neg "" 'x' < 0 )
    end;

    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__
        (not (Ext_string.for_all_from "xABc"1
                (function 'A' .. 'Z' -> true | _ -> false)));
      OUnit.assert_bool __LOC__
        ( (Ext_string.for_all_from "xABC" 1
             (function 'A' .. 'Z' -> true | _ -> false)));
      OUnit.assert_bool __LOC__
        ( (Ext_string.for_all_from "xABC" 1_000
             (function 'A' .. 'Z' -> true | _ -> false)));             
    end; 

    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ @@
      List.for_all (fun x -> Ext_string.is_valid_source_name x = Good)
        ["x.ml"; "x.mli"; "x.re"; "x.rei"; 
         "A_x.ml"; "ab.ml"; "a_.ml"; "a__.ml";
         "ax.ml"];
      OUnit.assert_bool __LOC__ @@ not @@
      List.exists (fun x -> Ext_string.is_valid_source_name x = Good)
        [".re"; ".rei";"..re"; "..rei"; "..ml"; ".mll~"; 
         "...ml"; "_.mli"; "_x.ml"; "__.ml"; "__.rei"; 
         ".#hello.ml"; ".#hello.rei"; "a-.ml"; "a-b.ml"; "-a-.ml"
        ; "-.ml"
        ]
    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ @@
      List.for_all Ext_namespace.is_valid_npm_package_name
        ["x"; "@angualr"; "test"; "hi-x"; "hi-"]
      ;
      OUnit.assert_bool __LOC__ @@
      List.for_all 
        (fun x -> not (Ext_namespace.is_valid_npm_package_name x))
        ["x "; "x'"; "Test"; "hI"]
      ;
    end;
    __LOC__ >:: begin fun _ -> 
      Ext_string.find ~sub:"hello" "xx hello xx" =~ 3 ;
      Ext_string.rfind ~sub:"hello" "xx hello xx" =~ 3 ;
      Ext_string.find ~sub:"hello" "xx hello hello xx" =~ 3 ;
      Ext_string.rfind ~sub:"hello" "xx hello hello xx" =~ 9 ;
    end;
    __LOC__ >:: begin fun _ -> 
      Ext_string.non_overlap_count ~sub:"0" "1000,000" =~ 6;
      Ext_string.non_overlap_count ~sub:"0" "000000" =~ 6;
      Ext_string.non_overlap_count ~sub:"00" "000000" =~ 3;
      Ext_string.non_overlap_count ~sub:"00" "00000" =~ 2
    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ (Ext_string.contain_substring "abc" "abc");
      OUnit.assert_bool __LOC__ (Ext_string.contain_substring "abc" "a");
      OUnit.assert_bool __LOC__ (Ext_string.contain_substring "abc" "b");
      OUnit.assert_bool __LOC__ (Ext_string.contain_substring "abc" "c");
      OUnit.assert_bool __LOC__ (Ext_string.contain_substring "abc" "");
      OUnit.assert_bool __LOC__ (not @@ Ext_string.contain_substring "abc" "abcc");
    end;
    __LOC__ >:: begin fun _ -> 
      Ext_string.trim " \t\n" =~ "";
      Ext_string.trim " \t\nb" =~ "b";
      Ext_string.trim "b \t\n" =~ "b";
      Ext_string.trim "\t\n b \t\n" =~ "b";            
    end;
    __LOC__ >:: begin fun _ -> 
      Ext_string.starts_with "ab" "a" =~ true;
      Ext_string.starts_with "ab" "" =~ true;
      Ext_string.starts_with "abb" "abb" =~ true;
      Ext_string.starts_with "abb" "abbc" =~ false;
    end;
    __LOC__ >:: begin fun _ -> 
      let (=~) = OUnit.assert_equal ~printer:(fun x -> string_of_bool x ) in 
      let k = Ext_string.ends_with in 
      k "xx.ml" ".ml" =~ true;
      k "xx.bs.js" ".js" =~ true ;
      k "xx" ".x" =~false;
      k "xx" "" =~true
    end;  
    __LOC__ >:: begin fun _ -> 
      Ext_string.ends_with_then_chop "xx.ml"  ".ml" =~ Some "xx";
      Ext_string.ends_with_then_chop "xx.ml" ".mll" =~ None
    end;
    (* __LOC__ >:: begin fun _ -> 
       Ext_string.starts_with_and_number "js_fn_mk_01" ~offset:0 "js_fn_mk_" =~ 1 ;
       Ext_string.starts_with_and_number "js_fn_run_02" ~offset:0 "js_fn_mk_" =~ -1 ;
       Ext_string.starts_with_and_number "js_fn_mk_03" ~offset:6 "mk_" =~ 3 ;
       Ext_string.starts_with_and_number "js_fn_mk_04" ~offset:6 "run_" =~ -1;
       Ext_string.starts_with_and_number "js_fn_run_04" ~offset:6 "run_" =~ 4;
       Ext_string.(starts_with_and_number "js_fn_run_04" ~offset:6 "run_" = 3) =~ false 
       end; *)
    __LOC__ >:: begin fun _ -> 
      Ext_string.for_all "____" (function '_' -> true | _ -> false)
        =~ true;
      Ext_string.for_all "___-" (function '_' -> true | _ -> false)
        =~ false;
      Ext_string.for_all ""  (function '_' -> true | _ -> false)        
        =~ true
    end;
    __LOC__ >:: begin fun _ -> 
      Ext_string.tail_from "ghsogh" 1 =~ "hsogh";
      Ext_string.tail_from "ghsogh" 0 =~ "ghsogh"
    end;
    (* __LOC__ >:: begin fun _ -> 
       Ext_string.digits_of_str "11_js" ~offset:0 2 =~ 11 
       end; *)
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ 
        (Ext_string.replace_backward_slash "a:\\b\\d" = 
         "a:/b/d"
        ) ;
      OUnit.assert_bool __LOC__ 
        (Ext_string.replace_backward_slash "a:\\b\\d\\" = 
         "a:/b/d/"
        ) ;
      OUnit.assert_bool __LOC__ 
        (Ext_string.replace_slash_backward "a:/b/d/"= 
         "a:\\b\\d\\" 
        ) ;  
      OUnit.assert_bool __LOC__ 
        (let old = "a:bd" in 
         Ext_string.replace_backward_slash old == 
         old
        ) ;
      OUnit.assert_bool __LOC__ 
        (let old = "a:bd" in 
         Ext_string.replace_backward_slash old == 
         old
        ) ;

    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash "ahgoh" );
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash "" );            
      OUnit.assert_bool __LOC__ 
        (not (Ext_string.no_slash "ahgoh/" ));
      OUnit.assert_bool __LOC__ 
        (not (Ext_string.no_slash "/ahgoh" ));
      OUnit.assert_bool __LOC__ 
        (not (Ext_string.no_slash "/ahgoh/" ));            
    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ (Ext_string.compare "" ""  = 0);
      OUnit.assert_bool __LOC__ (Ext_string.compare "0" "0"  = 0);
      OUnit.assert_bool __LOC__ (Ext_string.compare "" "acd" < 0);
      OUnit.assert_bool __LOC__ (Ext_string.compare  "acd" "" > 0);
      for i = 0 to 256 do 
        let a = String.init i (fun _ -> '0') in 
        let b = String.init i (fun _ -> '0') in 
        OUnit.assert_bool __LOC__ (Ext_string.compare  b a = 0);
        OUnit.assert_bool __LOC__ (Ext_string.compare a b = 0)
      done ;
      for i = 0 to 256 do 
        let a = String.init i (fun _ -> '0') in 
        let b = String.init i (fun _ -> '0') ^ "\000"in 
        OUnit.assert_bool __LOC__ (Ext_string.compare a b < 0);
        OUnit.assert_bool __LOC__ (Ext_string.compare  b a  > 0)
      done ;

    end;
    __LOC__ >:: begin fun _ -> 
      let slow_compare x y  = 
        let x_len = String.length x  in 
        let y_len = String.length y in 
        if x_len = y_len then 
          String.compare x y 
        else 
          Pervasives.compare x_len y_len  in 
      let same_sign x y =
        if x = 0 then y = 0 
        else if x < 0 then y < 0 
        else y > 0 in 
      for i = 0 to 3000 do
        let chars = [|'a';'b';'c';'d'|] in 
        let x = Ounit_data_random.random_string chars 129 in 
        let y = Ounit_data_random.random_string chars 129 in 
        let a = Ext_string.compare  x y  in 
        let b = slow_compare x y in 
        if same_sign a b then OUnit.assert_bool __LOC__ true 
        else failwith ("incosistent " ^ x ^ " " ^ y ^ " " ^ string_of_int a ^ " " ^ string_of_int b)
      done 
    end ;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ 
        (Ext_string.equal
           (Ext_string.concat3 "a0" "a1" "a2") "a0a1a2"
        );
      OUnit.assert_bool __LOC__ 
        (Ext_string.equal
           (Ext_string.concat3 "a0" "a11" "") "a0a11"
        );

      OUnit.assert_bool __LOC__ 
        (Ext_string.equal
           (Ext_string.concat4 "a0" "a1" "a2" "a3") "a0a1a2a3"
        );
      OUnit.assert_bool __LOC__ 
        (Ext_string.equal
           (Ext_string.concat4 "a0" "a11" "" "a33") "a0a11a33"
        );   
    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ 
        (Ext_string.equal
           (Ext_string.inter2 "a0" "a1") "a0 a1"
        );
      OUnit.assert_bool __LOC__ 
        (Ext_string.equal
           (Ext_string.inter3 "a0" "a1" "a2") "a0 a1 a2"
        );
      OUnit.assert_bool __LOC__ 
        (Ext_string.equal
           (Ext_string.inter4 "a0" "a1" "a2" "a3") "a0 a1 a2 a3"
        );
    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx "" < 0);
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx "xxx" < 0);
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx "xxx/" = 3);
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx "xxx/g/" = 3);
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx "/xxx/g/" = 0)
    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx_from "xxx" 0 < 0);
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx_from "xxx/" 1 = 3);
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx_from "xxx/g/" 4 = 5);
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx_from "xxx/g/" 3 = 3);  
      OUnit.assert_bool __LOC__ 
        (Ext_string.no_slash_idx_from "/xxx/g/" 0 = 0)
    end;
    __LOC__ >:: begin fun _ -> 
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [||])
           Ext_string.empty
        );
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [|"a0"|])
           "a0"
        );
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [|"a0";"a1"|])
           "a0 a1"
        );   
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [|"a0";"a1"; "a2"|])
           "a0 a1 a2"
        );   
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [|"a0";"a1"; "a2";"a3"|])
           "a0 a1 a2 a3"
        );    
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [|"a0";"a1"; "a2";"a3";""; "a4"|])
           "a0 a1 a2 a3  a4"
        );      
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [|"0";"a1"; "2";"a3";""; "a4"|])
           "0 a1 2 a3  a4"
        );        
      OUnit.assert_bool __LOC__
        (Ext_string.equal 
           (Ext_string.concat_array Ext_string.single_space [|"0";"a1"; "2";"3";"d"; ""; "e"|])
           "0 a1 2 3 d  e"
        );        

    end;

    __LOC__ >:: begin fun _ ->
      Ext_namespace.namespace_of_package_name "bs-json"
      =~ "BsJson"
    end;
    __LOC__ >:: begin fun _ ->
      let (=~) = OUnit.assert_equal ~printer:(fun x -> x) in
      Ext_namespace.namespace_of_package_name
        "reason-react"
      =~ "ReasonReact";
      Ext_namespace.namespace_of_package_name
        "reason"
      =~ "Reason";
      Ext_namespace.namespace_of_package_name 
        "@aa/bb"
        =~"AaBb";
      Ext_namespace.namespace_of_package_name 
        "@A/bb"
        =~"ABb"        
    end;
    __LOC__ >:: begin fun _ -> 
      Ext_namespace.js_name_of_basename false "a-b"
      =~ "a.js";
      Ext_namespace.js_name_of_basename false "a-"
      =~ "a.js";
      Ext_namespace.js_name_of_basename false "a--"
      =~ "a-.js";
      Ext_namespace.js_name_of_basename false "AA-b"
      =~ "AA.js";
      Ext_namespace.js_name_of_modulename 
        Little_js "AA-b"
      =~ "aA.js";
      Ext_namespace.js_name_of_modulename 
        Upper_js "AA-b"
      =~ "AA.js";
      Ext_namespace.js_name_of_modulename 
        Upper_bs "AA-b"
      =~ "AA.bs.js";
    end;
    __LOC__ >:: begin   fun _ -> 
      let (=~) = OUnit.assert_equal ~printer:(fun x -> 
          match x with 
          | None -> ""
          | Some (a,b) -> a ^","^ b
        ) in  
      Ext_namespace.try_split_module_name "Js-X" =~ Some ("X","Js");
      Ext_namespace.try_split_module_name "Js_X" =~ None
    end;
    __LOC__ >:: begin fun _ ->
      let (=~) = OUnit.assert_equal ~printer:(fun x -> x) in  
      let f = Ext_string.capitalize_ascii in
      f "x" =~ "X";
      f "X" =~ "X";
      f "" =~ "";
      f "abc" =~ "Abc";
      f "_bc" =~ "_bc";
      let v = "bc" in
      f v =~ "Bc";
      v =~ "bc"
    end;
    __LOC__ >:: begin fun _ -> 
      let (=~) = OUnit.assert_equal ~printer:printer_string in 
      Ext_path.chop_all_extensions_if_any "a.bs.js" =~ "a" ; 
      Ext_path.chop_all_extensions_if_any "a.js" =~ "a";
      Ext_path.chop_all_extensions_if_any "a" =~ "a";
      Ext_path.chop_all_extensions_if_any "a.x.bs.js" =~ "a"
    end;
    let (=~) = OUnit.assert_equal ~printer:(fun x -> x) in 
    __LOC__ >:: begin fun _ ->
      let k = Ext_modulename.js_id_name_of_hint_name in 
      k "xx" =~ "Xx";
      k "react-dom" =~ "ReactDom";
      k "a/b/react-dom" =~ "ReactDom";
      k "a/b" =~ "B";
      k "a/" =~ "A/" ; (*TODO: warning?*)
      k "#moduleid" =~ "Moduleid";
      k "@bundle" =~ "Bundle";
      k "xx#bc" =~ "Xxbc";
      k "hi@myproj" =~ "Himyproj";
      k "ab/c/xx.b.js" =~ "XxBJs"; (* improve it in the future*)
      k "c/d/a--b"=~ "AB";
      k "c/d/ac--" =~ "Ac"
    end 
  ]
