// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Square$RescriptReactIntro from "./Square.bs.js";

import './Board.css'
;

function Board(Props) {
  return React.createElement("div", undefined, React.createElement("div", {
                  className: "status"
                }, "Next player: X"), React.createElement("div", {
                  className: "board-row"
                }, React.createElement(Square$RescriptReactIntro.make, {}), React.createElement(Square$RescriptReactIntro.make, {}), React.createElement(Square$RescriptReactIntro.make, {})), React.createElement("div", {
                  className: "board-row"
                }, React.createElement(Square$RescriptReactIntro.make, {}), React.createElement(Square$RescriptReactIntro.make, {}), React.createElement(Square$RescriptReactIntro.make, {})), React.createElement("div", {
                  className: "board-row"
                }, React.createElement(Square$RescriptReactIntro.make, {}), React.createElement(Square$RescriptReactIntro.make, {}), React.createElement(Square$RescriptReactIntro.make, {})));
}

var make = Board;

export {
  make ,
  
}
/*  Not a pure module */