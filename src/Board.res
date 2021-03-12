%%raw(`
import './Board.css'
`)

@react.component
let make = () => {
  let status = "Next player: X"

  <div>
    <div className="status">{React.string(status)}</div>
    <div className="board-row">
      <Square />
      <Square />
      <Square />
    </div>
    <div className="board-row">
      <Square />
      <Square />
      <Square />
    </div>
    <div className="board-row">
      <Square />
      <Square />
      <Square />
    </div>
  </div>
}
