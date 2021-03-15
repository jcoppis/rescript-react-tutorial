%%raw(`
import './Board.css'
`)

type state = {xIsNext: bool, squares: array<string>}

@react.component
let make = () => {
  let (state, setState) = React.useState(_ => {xIsNext: true, squares: Belt.Array.make(9, "")})
  let nextPlayer = state.xIsNext ? "X" : "O"

  let calculateWinner = squares => {
    let lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ]

    let res =
      lines |> Js.Array.find(([a, b, c]) =>
        squares[a] !== "" && squares[a] === squares[b] && squares[a] === squares[c]
      )

    switch res {
    | Some([a, _, _]) => Some(squares[a])
    | _ => None
    }
  }

  let handleClick = i => {
    let squares = Js.Array2.slice(state.squares, ~start=0, ~end_=Js.Array2.length(state.squares))
    switch calculateWinner(squares) {
    | Some(_) => ()
    | _ =>
      if squares[i] === "" {
        squares[i] = nextPlayer
        setState(prev => {xIsNext: !prev.xIsNext, squares: squares})
      }
    }
  }

  let renderSquare = i => {
    <Square
      key={Belt.Int.toString(i)}
      value={React.string(state.squares[i])}
      onClick={_ => handleClick(i)}
    />
  }

  let status = switch calculateWinner(state.squares) {
  | Some(winner) => `Winner: ${winner}`
  | None => `Next player: ${nextPlayer}`
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
