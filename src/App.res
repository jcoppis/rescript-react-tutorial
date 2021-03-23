%%raw(`
import './App.css'
`)

type board = {squares: array<string>}

type state = {
  history: array<board>,
  stepNumber: int,
  xIsNext: bool,
}

@react.component
let make = () => {
  let (state, setState) = React.useState(_ => {
    history: [{squares: Belt.Array.make(9, "")}],
    stepNumber: 0,
    xIsNext: true,
  })

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
    let history = Js.Array.slice(state.history, ~start=0, ~end_=state.stepNumber+1)
    let current = history[Js.Array.length(history)-1]

    let lSquares = Js.Array.slice(
      current.squares,
      ~start=0,
      ~end_=Js.Array.length(current.squares),
    )
    
    Js.log2("squares", lSquares)
    
    switch calculateWinner(lSquares) {
    | Some(_) => ()
    | _ =>
      if lSquares[i] === "" {
        lSquares[i] = nextPlayer
        setState(prev => {
          history: Js.Array2.concat(history, [{squares: lSquares}]),
          stepNumber: Js.Array.length(history),
          xIsNext: !prev.xIsNext,
        })
      }
    }
  }

  let jumpTo = (step) => 
    setState(prev => {
      ...prev,
      stepNumber: step,
      xIsNext: mod(step, 2) === 0
    })

  let renderMoves = Js.Array.mapi((_, move) => {
    let desc = move !== 0 ? `Go to move #${Js.Int.toString(move)}` : "Go to game start"
    <li key={Js.Int.toString(move)++ "A"}><button onClick={_ => jumpTo(move)} >{React.string(desc)}</button></li>
  }, state.history);

  let currentSquares = state.history[state.stepNumber].squares
  let status = switch calculateWinner(currentSquares) {
  | Some(winner) => `Winner: ${winner}`
  | None => `Next player: ${nextPlayer}`
  }
  
  <div className="game">
    <div className="game-board">
      <Board squares={currentSquares} onClick={i => handleClick(i)} />
    </div>
    <div className="game-info">
      <div>{React.string(status)}</div>
      <ol>{React.array(renderMoves)}</ol>
    </div>
  </div>
}
