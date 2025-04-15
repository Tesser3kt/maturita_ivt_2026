import { useState, useEffect } from "react";
import axios from "axios";
import Graph from "./graph.jsx";

export default function ViewJudge() {
  const [name, setName] = useState("");
  const [userData, setUserData] = useState(null);
  const [error, setError] = useState(null);
  const [options, setOptions] = useState([]);

  useEffect(() => {
    const allItems = async () => {
      try {
        const items = await axios.get("api/alljudges");
        setOptions(items.data.names);
      } catch (err) {
        console.log(err.message);
      }
    };
    allItems();
  },[]);

  const filteredItems = options.filter((item) =>
    item.toLowerCase().includes(name.toLowerCase()),
  );

  const handleChange = (e) => {
    setName(e.target.value); // Update the name state
  };

  const handleSubmit = async (e) => {
    e.preventDefault(); // Prevent form reload

    try {
      console.log(name);
      const response = await axios.get(`api/getjudge?name=${name}`);

      // If successful, set the user data to be displayed
      setUserData(response.data);
      setError(null); // Clear any previous error messages
      setName("");
    } catch (err) {
      // If error, display error message
      setUserData(null);
      setError("User not found");
      console.error(err);
    }
  };

  return (
    <div>
      <h1>Search for User</h1>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          name="name"
          list="options"
          value={name}
          onChange={handleChange}
          placeholder="Jakého chceš soudce"
          autoComplete="off"
          required
        />

        <datalist id="options">
          {filteredItems.map((item, index) => (
            <option key={index} value={item} />
          ))}
        </datalist>

        <button type="submit">Search</button>
      </form>
      {error && <div>{error}</div>}
      // display the user data in some way
    </div>
  );
}
