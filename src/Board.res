%%raw(`
import './Board.css'
`)

@react.component
let make = () => {
  let status = "Next player: X"

  let renderSquare = i => {
    <Square value={React.int(i)} />
  }

  <div>
    <div className="status"> {React.string(status)} </div>
    <div className="board-row"> {Belt.Array.map([1, 2, 3], renderSquare)->React.array} </div>
    <div className="board-row">
      {renderSquare(4)}
      {renderSquare(5)}
      {renderSquare(6)}
    </div>
    <div className="board-row">
      <Square value={React.int(7)} />
      <Square value={React.int(8)} />
      <Square value={React.int(9)} />
    </div>
  </div>
}
