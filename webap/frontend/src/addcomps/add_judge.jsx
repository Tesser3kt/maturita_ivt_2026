import { useState } from "react";
import axios from "axios";

export default function AddJudge() {
  const [formData, setFormData] = useState({ name: "" });

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post("api/addjudge", formData);
      alert(response.data.name);
      setFormData({ name: "" }); // Reset form after submit
    } catch (error) {
      console.error("Error submitting form:", error);
      //TODO create special eror for duplicate name entry.
      alert("co se kurva deje");
    }
  };

  return (
    <>
      <form
        onSubmit={handleSubmit}
        style={{
          display: "flex",
          flexDirection: "column",
          gap: "10px",
          maxWidth: "300px",
        }}
      >
        <input
          type="text"
          name="name"
          value={formData.name}
          onChange={handleChange}
          placeholder="Name"
          required
        />
        <button type="submit">Submit</button>
      </form>
      <p> asdfajskl </p>
      <p> asfasta </p>
    </>
  );
}
