%%raw(`
import './Board.css'
`)

@react.component
let make = (~squares, ~onClick) => {
  let renderSquare = i => {
    <Square
      key={Js.Int.toString(i)}
      value={React.string(squares[i])}
      onClick={_ => onClick(i)}
    />
  }

  <div>
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
