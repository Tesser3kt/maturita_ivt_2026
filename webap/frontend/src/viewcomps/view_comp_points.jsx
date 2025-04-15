import { useState, useEffect } from "react";
import axios from "axios";
import Graph from "./graph.jsx";

export default function ViewCompPoints() {
  const [numbers, setNumbers] = useState({});

  //udelat dycky ten stejnej request na vraceni vsech soutezi podle toho kdy se stali
  //poslat je jako argument grafove komponente.
  //vlastne to bude mega easy komponenta a vetsinu prace za ni dela zbytek.

  useEffect(() => {
    const request = async () => {
      try {
        const response = await axios.get("api/allcomppoints");

        setNumbers(response.data);
      } catch (err) {
        console.log(err);
        alert("aaaaaaaaaaaa");
      }
    };
    request();
  }, []);
  return (
    <>
      <h1> Toto je tvuj graf </h1>
      <Graph data={numbers.data} special={numbers.lines} />
    </>
  );
}
