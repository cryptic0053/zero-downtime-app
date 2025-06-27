import { useEffect, useState } from "react"
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [version, setVersion] = useState("");

  useEffect(() => {
    fetch("http://127.0.0.1:8000/api/version/")
      .then((res) => res.json())
      .then((data) => setVersion(data.version))
      .catch((err) => console.error("Error fetching version:", err));
  }, []);

  return (
    <div className="App" style={{ textAlign: "center", marginTop: "50px" }}>
      <h1>🚀 Zero Downtime Deployment</h1>
      <p>📦 Version: {version || "Loading..."}</p>
    </div>
  );
}

export default App;