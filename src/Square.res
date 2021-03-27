%%raw(`
import './Square.css'
`)

@react.component
let make = (~value, ~onClick) => {
  <button className="square" onClick={onClick}> {value} </button>
}
