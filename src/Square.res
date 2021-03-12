%%raw(`
import './Square.css'
`)

@react.component
let make = (~value) => {
  <button className="square">
    {value}
  </button>
}
