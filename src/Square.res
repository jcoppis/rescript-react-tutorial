%%raw(`
import './Square.css'
`)

@react.component
let make = (~value) => {
  let (text, setText) = React.useState(_ => "")

  let click = evt => {
    ReactEvent.Mouse.preventDefault(evt)
    setText(prev => if prev === "X" { "Y" } else { "X" })
  }

  <button className="square" onClick={ evt => click(evt) } >
    {value} {React.string(text)}
  </button>
}
