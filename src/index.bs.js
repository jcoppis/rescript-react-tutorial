// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as ReactDom from "react-dom";
import * as Caml_option from "bs-platform/lib/es6/caml_option.js";
import * as App$RescriptReactIntro from "./App.bs.js";

var rootQuery = document.querySelector("#root");

if (!(rootQuery == null)) {
  ReactDom.render(React.createElement(React.StrictMode, {
            children: React.createElement(App$RescriptReactIntro.make, {})
          }), rootQuery);
}

var rootQuery$1 = (rootQuery == null) ? undefined : Caml_option.some(rootQuery);

export {
  rootQuery$1 as rootQuery,
  
}
/* rootQuery Not a pure module */
