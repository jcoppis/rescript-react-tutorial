%%raw(`
import './Board.css'
`)

type state = {squares: array<string>}

@react.component
let make = () => {
  let (state, setState) = React.useState(_ => {squares: Belt.Array.make(9, "")})
  let status = "Next player: X"

  let handleClick = i => {
    let squares = Js.Array2.slice(state.squares, ~start=0, ~end_=Js.Array2.length(state.squares))
    squares[i] = squares[i] === "X" ? "Y" : "X"
    setState(_ => {squares: squares})
  }

  let renderSquare = i => {
    <Square
      key={Belt.Int.toString(i)}
      value={React.string(state.squares[i])}
      onClick={_ => handleClick(i)}
    />
  }

  <div>
    <div className="status"> {React.string(status)} </div>
    <div className="board-row">
      {Js.Array2.map(Belt.Array.range(0, 2), renderSquare)->React.array}
    </div>
    <div className="board-row">
      {Js.Array2.map(Belt.Array.range(3, 5), renderSquare)->React.array}
    </div>
    <div className="board-row">
      {Js.Array2.map(Belt.Array.range(6, 8), renderSquare)->React.array}
    </div>
  </div>
}
