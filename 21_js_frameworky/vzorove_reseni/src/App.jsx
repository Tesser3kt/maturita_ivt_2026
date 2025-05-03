import { useState } from "react";
import "./App.css";

function App() {
  const colorNames = ["Red", "Blue", "Green"];
  const colorCodes = ["#C83636", "#1385C3", "#397C3C"];
  const [index, setIndex] = useState(0);

  return (
    <div className="content" style={{ backgroundColor: colorCodes[index] }}>
      <h1 className="color-name">{colorNames[index]}</h1>
      <button
        className="change-color"
        onClick={() => setIndex((index + 1) % 3)}
      >
        Change Color
      </button>
    </div>
  );
}

export default App;
