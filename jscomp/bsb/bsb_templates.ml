(* This file has been generated by ocp-ocamlres *)
let root = OCamlRes.Res.([
  Dir ("basic", [
    Dir ("src", [
      File ("demo.ml",
        "\n\
         \n\
         let () = Js.log \"Hello, BuckleScript\"")]) ;
    File ("README.md",
      "\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Watch\n\
       \n\
       ```\n\
       npm run watch\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"watch\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"sources\": [\n\
      \    \"src\"\n\
      \  ],\n\
      \  \"bs-dependencies\" : [\n\
      \      // add your bs-dependencies here \n\
      \  ]\n\
       }") ;
    Dir (".vscode", [
      File ("tasks.json",
        "{\n\
        \    \"version\": \"${bsb:proj-version}\",\n\
        \    \"command\": \"npm\",\n\
        \    \"options\": {\n\
        \        \"cwd\": \"${workspaceRoot}\"\n\
        \    },\n\
        \    \"isShellCommand\": true,\n\
        \    \"args\": [\n\
        \        \"run\",\n\
        \        \"watch\"\n\
        \    ],\n\
        \    \"showOutput\": \"always\",\n\
        \    \"isBackground\": true,\n\
        \    \"problemMatcher\": {\n\
        \        \"fileLocation\": \"absolute\",\n\
        \        \"owner\": \"ocaml\",\n\
        \        \"watching\": {\n\
        \            \"activeOnStart\": false,\n\
        \            \"beginsPattern\": \">>>> Start compiling\",\n\
        \            \"endsPattern\": \">>>> Finish compiling\"\n\
        \        },\n\
        \        \"pattern\": [\n\
        \            {\n\
        \                \"regexp\": \"^File \\\"(.*)\\\", line (\\\\d+)(?:, characters (\\\\d+)-(\\\\d+))?:$\",\n\
        \                \"file\": 1,\n\
        \                \"line\": 2,\n\
        \                \"column\": 3,\n\
        \                \"endColumn\": 4\n\
        \            },\n\
        \            {\n\
        \                \"regexp\": \"^(?:(?:Parse\\\\s+)?(Warning|[Ee]rror)(?:\\\\s+\\\\d+)?:)?\\\\s+(.*)$\",\n\
        \                \"severity\": 1,\n\
        \                \"message\": 2,\n\
        \                \"loop\": true\n\
        \            }\n\
        \        ]\n\
        \    }\n\
         }")]) ;
    File (".gitignore",
      "*.exe\n\
       *.obj\n\
       *.out\n\
       *.compile\n\
       *.native\n\
       *.byte\n\
       *.cmo\n\
       *.annot\n\
       *.cmi\n\
       *.cmx\n\
       *.cmt\n\
       *.cmti\n\
       *.cma\n\
       *.a\n\
       *.cmxa\n\
       *.obj\n\
       *~\n\
       *.annot\n\
       *.cmj\n\
       *.bak\n\
       lib/bs\n\
       *.mlast\n\
       *.mliast\n\
       .vscode\n\
       .merlin")]) ;
  Dir ("basic-reason", [
    File ("tasks.json",
      "{\n\
      \    \"version\": \"${bsb:proj-version}\",\n\
      \    \"command\": \"npm\",\n\
      \    \"options\": {\n\
      \        \"cwd\": \"${workspaceRoot}\"\n\
      \    },\n\
      \    \"isShellCommand\": true,\n\
      \    \"args\": [\n\
      \        \"run\",\n\
      \        \"watch\"\n\
      \    ],\n\
      \    \"showOutput\": \"always\",\n\
      \    \"isBackground\": true,\n\
      \    \"problemMatcher\": {\n\
      \        \"fileLocation\": \"absolute\",\n\
      \        \"owner\": \"ocaml\",\n\
      \        \"watching\": {\n\
      \            \"activeOnStart\": false,\n\
      \            \"beginsPattern\": \">>>> Start compiling\",\n\
      \            \"endsPattern\": \">>>> Finish compiling\"\n\
      \        },\n\
      \        \"pattern\": [\n\
      \            {\n\
      \                \"regexp\": \"^File \\\"(.*)\\\", line (\\\\d+)(?:, characters (\\\\d+)-(\\\\d+))?:$\",\n\
      \                \"file\": 1,\n\
      \                \"line\": 2,\n\
      \                \"column\": 3,\n\
      \                \"endColumn\": 4\n\
      \            },\n\
      \            {\n\
      \                \"regexp\": \"^(?:(?:Parse\\\\s+)?(Warning|[Ee]rror)(?:\\\\s+\\\\d+)?:)?\\\\s+(.*)$\",\n\
      \                \"severity\": 1,\n\
      \                \"message\": 2,\n\
      \                \"loop\": true\n\
      \            }\n\
      \        ]\n\
      \    }\n\
       }") ;
    Dir ("src", [
      File ("demo.re",
        "Js.log \"Hello, BuckleScript and Reason!\";\n\
         ")]) ;
    File ("README.md",
      "# Basic Reason Template\n\
       \n\
       Hello! This project allows you to quickly get started with Reason and BuckleScript. If you wanted a more sophisticated version, try the `react` template (`bsb -theme react -init .`).\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Build + Watch\n\
       \n\
       ```\n\
       npm run watch\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically\n\
       ") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"start\": \"bsb -make-world -w\",\n\
      \    \"clean\": \"bsb -clean-world\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"${bsb:bs-version}\"\n\
      \  }\n\
       }\n\
       ") ;
    File ("bsconfig.json",
      "// This is the configuration file used by BuckleScript's build system bsb. Its documentation lives here: http://bucklescript.github.io/bucklescript/docson/#build-schema.json\n\
       // BuckleScript comes with its own parser for bsconfig.json, which is normal JSON, with the extra support of comments and trailing commas.\n\
       {\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"bsc-flags\": [\"-bs-super-errors\"],\n\
      \  \"sources\": [\n\
      \    \"src\"\n\
      \  ],\n\
      \  \"bs-dependencies\" : [\n\
      \      // add your dependencies here. You'd usually install them normally through `npm install my-dependency`. If my-dependency has a bsconfig.json too, then everything will work seamlessly.\n\
      \  ],\n\
      \  \"namespace\": true,\n\
       }\n\
       ") ;
    File (".gitignore",
      ".DS_Store\n\
       .merlin\n\
       npm-debug.log\n\
       /lib/bs/\n\
       /node_modules/\n\
       ")]) ;
  Dir ("generator", [
    Dir ("src", [
      File ("test.cpp.ml",
        "\n\
         (* \n\
         #define FS_VAL(name,ty) external name : ty = \"\" [@@bs.module \"fs\"]\n\
         \n\
         \n\
         FS_VAL(readdirSync, string -> string array)\n\
        \ *)\n\
         \n\
         \n\
        \ let ocaml = OCAML") ;
      File ("demo.ml",
        "\n\
         \n\
         let () = Js.log \"Hello, BuckleScript\"")]) ;
    File ("README.md",
      "\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Watch\n\
       \n\
       ```\n\
       npm run watch\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"watch\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"sources\": [\n\
      \    {\n\
      \      \"dir\": \"src\",\n\
      \      \"generators\": [\n\
      \        {\n\
      \          \"name\": \"cpp\",\n\
      \          \"edge\": [\n\
      \            \"test.ml\", \":\", \"test.cpp.ml\"\n\
      \          ]\n\
      \        }\n\
      \      ]\n\
      \    }\n\
      \    \n\
      \  ],\n\
      \  \"generators\": [\n\
      \    {\n\
      \      \"name\" : \"cpp\",\n\
      \      \"command\": \"sed 's/OCAML/3/' $in > $out\"\n\
      \    }\n\
      \  ],\n\
      \  \"bs-dependencies\" : [\n\
      \      // add your bs-dependencies here \n\
      \  ]\n\
       }") ;
    File (".gitignore",
      "*.exe\n\
       *.obj\n\
       *.out\n\
       *.compile\n\
       *.native\n\
       *.byte\n\
       *.cmo\n\
       *.annot\n\
       *.cmi\n\
       *.cmx\n\
       *.cmt\n\
       *.cmti\n\
       *.cma\n\
       *.a\n\
       *.cmxa\n\
       *.obj\n\
       *~\n\
       *.annot\n\
       *.cmj\n\
       *.bak\n\
       lib/bs\n\
       *.mlast\n\
       *.mliast\n\
       .vscode\n\
       .merlin")]) ;
  Dir ("minimal", [
    Dir ("src", [ File ("main.ml", "")]) ;
    File ("README.md",
      "\n\
      \  # ${bsb:name}") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"start\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"sources\": [\"src\"]\n\
       }") ;
    File (".gitignore",
      "lib\n\
       node_modules\n\
       .merlin\n\
       npm-debug.log")]) ;
  Dir ("node", [
    Dir ("src", [
      File ("demo.ml",
        "\n\
         \n\
         let () = Js.log \"Hello, BuckleScript\"")]) ;
    File ("README.md",
      "\n\
       \n\
       # Build\n\
       ```\n\
       npm run build\n\
       ```\n\
       \n\
       # Watch\n\
       \n\
       ```\n\
       npm run watch\n\
       ```\n\
       \n\
       \n\
       # Editor\n\
       If you use `vscode`, Press `Windows + Shift + B` it will build automatically") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"scripts\": {\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"watch\": \"bsb -make-world -w\"\n\
      \  },\n\
      \  \"keywords\": [\n\
      \    \"BuckleScript\"\n\
      \  ],\n\
      \  \"license\": \"MIT\",\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"${bsb:bs-version}\"\n\
      \  }\n\
       }") ;
    File ("bsconfig.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"sources\": [\n\
      \    \"src\"\n\
      \  ],\n\
      \  \"package-specs\":\n\
      \    {\n\
      \      \"module\": \"commonjs\",\n\
      \      \"in-source\": true\n\
      \    }\n\
      \  ,\n\
      \  \"bs-dependencies\" : [\n\
      \      // add your bs-dependencies here \n\
      \  ]\n\
       }") ;
    File (".gitignore",
      "*.exe\n\
       *.obj\n\
       *.out\n\
       *.compile\n\
       *.native\n\
       *.byte\n\
       *.cmo\n\
       *.annot\n\
       *.cmi\n\
       *.cmx\n\
       *.cmt\n\
       *.cmti\n\
       *.cma\n\
       *.a\n\
       *.cmxa\n\
       *.obj\n\
       *~\n\
       *.annot\n\
       *.cmj\n\
       *.bak\n\
       lib/bs\n\
       *.mlast\n\
       *.mliast\n\
       .vscode\n\
       .merlin")]) ;
  Dir ("react", [
    File ("webpack.config.js",
      "const path = require('path');\n\
       \n\
       module.exports = {\n\
      \  entry: {\n\
      \    async: './lib/js/src/async/counterRoot.js',\n\
      \    simple: './lib/js/src/simple/simpleRoot.js',\n\
      \    interop: './src/interop/interopRoot.js',\n\
      \  },\n\
      \  output: {\n\
      \    path: path.join(__dirname, \"bundledOutputs\"),\n\
      \    filename: '[name].js',\n\
      \  },\n\
       };\n\
       ") ;
    Dir ("src", [
      Dir ("simple", [
        File ("simpleRoot.re",
          "ReactDOMRe.renderToElementWithId <Page message=\"Hello!\" /> \"index\";\n\
           ") ;
        File ("page.re",
          "/* This is the basic component. */\n\
           let component = ReasonReact.statelessComponent \"Page\";\n\
           \n\
           /* Your familiar handleClick from ReactJS. This mandatorily takes the payload,\n\
          \   then the `self` record, which contains state (none here), `handle`, `reduce`\n\
          \   and other utilities */\n\
           let handleClick _event _self => Js.log \"clicked!\";\n\
           \n\
           /* `make` is the function that mandatorily takes `children` (if you want to use\n\
          \   `JSX). `message` is a named argument, which simulates ReactJS props. Usage:\n\
           \n\
          \   `<Page message=\"hello\" />`\n\
           \n\
          \   Which desugars to\n\
           \n\
          \   `ReasonReact.element (Page.make message::\"hello\" [||])` */\n\
           let make ::message _children => {\n\
          \  ...component,\n\
          \  render: fun self =>\n\
          \    <div onClick=(self.handle handleClick)> (ReasonReact.stringToElement message) </div>\n\
           };\n\
           ") ;
        File ("index.html",
          "<!DOCTYPE html>\n\
           <html lang=\"en\">\n\
           <head>\n\
          \  <meta charset=\"UTF-8\">\n\
          \  <title>Pure Reason Example</title>\n\
           </head>\n\
           <body>\n\
          \  <div id=\"index\"></div>\n\
          \  <script src=\"../../bundledOutputs/simple.js\"></script>\n\
           </body>\n\
           </html>\n\
           ")]) ;
      Dir ("interop", [
        File ("README.md",
          "## Interoperate with Existing ReactJS Components\n\
           \n\
           This subdirectory demonstrate the ReasonReact <-> ReactJS interop APIs.\n\
           \n\
           The entry point, `interopRoot.js`, illustrates ReactJS requiring a ReasonReact component, `GreetingRe`.\n\
           \n\
           `GreetingRe` itself illustrates ReasonReact requiring a ReactJS component, `myBanner.js`, through the Reason file `myBannerRe.re`.\n\
           ") ;
        File ("myBannerRe.re",
          "/* ReactJS used by ReasonReact */\n\
           \n\
           /* This component wraps a ReactJS one, so that ReasonReact components can consume it */\n\
           \n\
           /* Typing the myBanner.js component's output as a `reactClass`. */\n\
           /* Note that this file's JS output is located at reason-react-example/lib/js/src/interop/myBannerRe.js; we're specifying the relative path to myBanner.js in the string below */\n\
           external myBanner : ReasonReact.reactClass = \"../../../../src/interop/myBanner\" [@@bs.module];\n\
           \n\
           /* This is like declaring a normal ReasonReact component's `make` function, except the body is a the interop hook wrapJsForReason */\n\
           let make ::show ::message children =>\n\
          \  ReasonReact.wrapJsForReason\n\
          \    reactClass::myBanner\n\
          \    props::{\n\
          \      \"show\": Js.Boolean.to_js_boolean show, /* ^ don't forget to convert an OCaml bool into a JS boolean! */\n\
          \      \"message\": message /* OCaml string maps to JS string, no conversion needed here */\n\
          \    }\n\
          \    children;\n\
           ") ;
        File ("myBanner.js",
          "// This file isn't used directly by JS; it's used to myBanner.re, which is then\n\
           // used by the ReasonReact component GreetingRe.\n\
           \n\
           var ReactDOM = require('react-dom');\n\
           var React = require('react');\n\
           \n\
           var App = React.createClass({\n\
          \  displayName: \"MyBanner\",\n\
          \  render: function() {\n\
          \    if (this.props.show) {\n\
          \      return React.createElement('div', null,\n\
          \        'Here\\'s the message from the owner: ' + this.props.message\n\
          \      );\n\
          \    } else {\n\
          \      return null;\n\
          \    }\n\
          \  }\n\
           });\n\
           \n\
           module.exports = App;\n\
           ") ;
        File ("interopRoot.js",
          "var ReactDOM = require('react-dom');\n\
           var React = require('react');\n\
           \n\
           // Import a ReasonReact component! `comp` is the exposed, underlying ReactJS class\n\
           var PageReason = require('../../lib/js/src/interop/greetingRe').jsComponent;\n\
           \n\
           var App = React.createClass({\n\
          \  displayName: 'exampleInteropRoot',\n\
          \  render: function() {\n\
          \    return React.createElement('div', null,\n\
          \      React.createElement(PageReason, {message: 'Hello!'})\n\
          \    );\n\
          \    // didn't feel like dragging in Babel. Here's the equivalent JSX:\n\
          \    // <div><PageReason message=\"Hello!\"></div>\n\
          \  }\n\
           });\n\
           \n\
           ReactDOM.render(React.createElement(App), document.getElementById('index'));\n\
           ") ;
        File ("index.html",
          "<!DOCTYPE html>\n\
           <html lang=\"en\">\n\
           <head>\n\
          \  <meta charset=\"UTF-8\">\n\
          \  <title>Pure Reason Example</title>\n\
           </head>\n\
           <body>\n\
          \  <div id=\"index\"></div>\n\
          \  <script src=\"../../bundledOutputs/interop.js\"></script>\n\
           </body>\n\
           </html>\n\
           ") ;
        File ("greetingRe.re",
          "/* ReasonReact used by ReactJS */\n\
           \n\
           /* This is just a normal stateless component. The only change you need to turn\n\
          \   it into a ReactJS-compatible component is the wrapReasonForJs call below */\n\
           let component = ReasonReact.statelessComponent \"PageReason\";\n\
           \n\
           let make ::message ::extraGreeting=? _children => {\n\
          \  ...component,\n\
          \  render: fun _self => {\n\
          \    let greeting =\n\
          \      switch extraGreeting {\n\
          \      | None => \"How are you?\"\n\
          \      | Some g => g\n\
          \      };\n\
          \    <div> <MyBannerRe show=true message=(message ^ \" \" ^ greeting) /> </div>\n\
          \  }\n\
           };\n\
           \n\
           /* This exposes a `jsComponent` that the ReactJS side can use as\n\
          \   require('greetingRe.js').jsComponent\n\
           \n\
          \   if **you know what you're doing** and have\n\
          \   the correct babel/webpack setup, you can also do `let default = ...` and use it\n\
          \   on the JS side as a default export. */\n\
           let jsComponent =\n\
          \  ReasonReact.wrapReasonForJs\n\
          \    ::component\n\
          \    (\n\
          \      fun jsProps =>\n\
          \        make\n\
          \          message::jsProps##message\n\
          \          extraGreeting::?(Js.Null_undefined.to_opt jsProps##extraGreeting)\n\
          \          [||]\n\
          \    );\n\
           ")]) ;
      Dir ("async", [
        File ("index.html",
          "<!DOCTYPE html>\n\
           <html lang=\"en\">\n\
           <head>\n\
          \  <meta charset=\"UTF-8\">\n\
          \  <title>Counter</title>\n\
           </head>\n\
           <body>\n\
          \  <div id=\"index\"></div>\n\
          \  <script src=\"../../bundledOutputs/async.js\"></script>\n\
           </body>\n\
           </html>\n\
           ") ;
        File ("counterRoot.re",
          "ReactDOMRe.renderToElementWithId <Counter /> \"index\";\n\
           ") ;
        File ("counter.re",
          "/* This is a stateful component. In ReasonReact, we call them reducer components */\n\
           \n\
           /* A list of state transitions, to be used in self.reduce and reducer */\n\
           type action =\n\
          \  | Tick;\n\
           \n\
           /* The component's state type. It can be anything, including, commonly, being a record type */\n\
           type state = {\n\
          \  count: int,\n\
          \  timerId: ref (option Js.Global.intervalId)\n\
           };\n\
           \n\
           let component = ReasonReact.reducerComponent \"Counter\";\n\
           \n\
           let make _children => {\n\
          \  ...component,\n\
          \  initialState: fun () => {count: 0, timerId: ref None},\n\
          \  reducer: fun action state =>\n\
          \    switch action {\n\
          \    | Tick => ReasonReact.Update {...state, count: state.count + 1}\n\
          \    },\n\
          \  didMount: fun self => {\n\
          \    /* this will call `reduce` every second */\n\
          \    self.state.timerId := Some (Js.Global.setInterval (self.reduce (fun _ => Tick)) 1000);\n\
          \    ReasonReact.NoUpdate\n\
          \  },\n\
          \  render: fun {state: {count}} => {\n\
          \    let timesMessage = count == 1 ? \"second\" : \"seconds\";\n\
          \    let greeting = {j|You've spent $count $timesMessage on this page!|j};\n\
          \    <div> (ReasonReact.stringToElement greeting) </div>\n\
          \  }\n\
           };\n\
           ")])]) ;
    File ("README.md",
      "This is a repo with examples usages of [ReasonReact](https://github.com/reasonml/reason-react).\n\
       Have something you don't understand? Join us on [Discord](https://discord.gg/reasonml)!\n\
       \n\
       Run this project:\n\
       \n\
       ```\n\
       npm install\n\
       npm start\n\
       # in another tab\n\
       npm run webpack\n\
       ```\n\
       \n\
       After you see the webpack compilation succeed (the `npm run webpack` step), open up the nested html files in `src/*` (**no server needed!**). Then modify whichever file in `src` and refresh the page to see the changes.\n\
       ") ;
    File ("package.json",
      "{\n\
      \  \"name\": \"${bsb:name}\",\n\
      \  \"private\": true,\n\
      \  \"version\": \"${bsb:proj-version}\",\n\
      \  \"description\": \"\",\n\
      \  \"main\": \"index.js\",\n\
      \  \"scripts\": {\n\
      \    \"build\": \"bsb -make-world\",\n\
      \    \"start\": \"bsb -make-world -w\",\n\
      \    \"clean\": \"bsb -clean-world\",\n\
      \    \"test\": \"echo \\\"Error: no test specified\\\" && exit 1\",\n\
      \    \"webpack\": \"webpack -w\"\n\
      \  },\n\
      \  \"keywords\": [],\n\
      \  \"author\": \"\",\n\
      \  \"license\": \"ISC\",\n\
      \  \"dependencies\": {\n\
      \    \"react\": \"^15.4.2\",\n\
      \    \"react-dom\": \"^15.4.2\",\n\
      \    \"reason-react\": \">=0.2.1\"\n\
      \  },\n\
      \  \"devDependencies\": {\n\
      \    \"bs-platform\": \"^${bsb:bs-version}\",\n\
      \    \"webpack\": \"^1.14.0\"\n\
      \  }\n\
       }\n\
       ") ;
    File ("bsconfig.json",
      "/* This is the BuckleScript configuration file. Note that this is a comment;\n\
      \  BuckleScript comes with a JSON parser that supports comments and trailing\n\
      \  comma. If this screws with your editor highlighting, please tell us by filing\n\
      \  an issue! */\n\
       {\n\
      \  \"name\" : \"${bsb:name}\",\n\
      \  \"reason\" : {\"react-jsx\" : 2},\n\
      \  \"bsc-flags\": [\"-bs-super-errors\"],\n\
      \  \"bs-dependencies\": [\"reason-react\"],\n\
      \  \"sources\": [\n\
      \    {\n\
      \      \"dir\": \"src\",\n\
      \      \"subdirs\": [\"async\", \"interop\", \"simple\"]\n\
      \    }\n\
      \  ],\n\
      \  \"namespace\": true,\n\
       }\n\
       ") ;
    File (".gitignore",
      ".DS_Store\n\
       .merlin\n\
       npm-debug.log\n\
       /lib/bs/\n\
       /node_modules/\n\
       ")])
])
