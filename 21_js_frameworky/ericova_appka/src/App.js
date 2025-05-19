import { useState } from "react";
export default function Square() {
  const [value, setValue] = useState("YES");
  var board = [];
  function handleClick(index) {
    setValue("X");
  }
  // const number = 5;
  // const [foo, setFoo] = useState([]);
  // var array = [];
  // for (var i = 1; i <= number; i++) {
  //   array.push(i);
  // }
  return (
    // <>
    //   {array.map((x) => (
    //     <div className="board-row">
    //       {array.map((y) => (
    //         <button className="square" onClick={() => handleClick((x, y))}>
    //           {y}
    //         </button>
    //       ))}
    //     </div>
    //   ))}
    // </>
    <>
      <div className={` mydiv${value == "YES" ? "" : "2"}`}>
        {value == "YES" ? <h1> Nadpis 1 </h1> : <h1> Nadpis 2 </h1>}
      </div>
      <button
        className="square"
        onClick={() => setValue(`${value == "YES" ? "NO" : "YES"}`)}
      >
        {" "}
      </button>
    </>
  );
}

// https://codesandbox.io/p/sandbox/react-dev-forked-ftvw6k?file=%2Fsrc%2FApp.js%3A7%2C4