// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import LogoSvg from "./logo.svg";

import './App.css'
;

var logo = LogoSvg;

function App(Props) {
  return React.createElement("div", {
              className: "App"
            }, React.createElement("header", {
                  className: "App-header"
                }, React.createElement("img", {
                      className: "App-logo",
                      alt: "logo",
                      src: logo
                    }), React.createElement("p", undefined, "Edit ", React.createElement("code", undefined, "src/App.js"), " and save to reload."), React.createElement("a", {
                      className: "App-link",
                      href: "https://reactjs.org",
                      rel: "noopener noreferrer",
                      target: "_blank"
                    }, "Learn React")));
}

var make = App;

export {
  logo ,
  make ,
  
}
/*  Not a pure module */
