import { useState } from "react";
import "./App.css";

function App() {
  const colorNames = ["Red", "Blue", "Green"];
  const colorCodes = ["#C83636", "#1385C3", "#397C3C"];

  /* Vyrobte si proměnnou, která bude uchovávat index aktuální barvy pozadí.
  Kliknutí na tlačítko index posune (případně vrátí na začátek) a způsobí překreslení. */

  return (
    <div
      className="content"
      style={
        {
          /* Sem vypište CSS pravidlo (v JSX syntaxi samozřejmě) pro aktuální barvu pozadí. */
        }
      }
    >
      <h1 className="color-name">
        {/* Sem vypište jméno aktuální barvy pozadí. */}
      </h1>

      {/* Při kliknutí na toto tlačíto se barva posune na další. */}
      <button className="change-color">Change Color</button>
    </div>
  );
}

export default App;
