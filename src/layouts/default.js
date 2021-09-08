import React from "react";
import { Footer } from "../components/Footer";
import { Navbar } from "../components/Navbar";

export const Default = ({ children, style }) => {
  return (
    <main>
      <Navbar />

      <div style={{ position: "relative", backgroundColor: "transparent" }}>
        <div lang="en" className="main-container" style={style}>
          {children}
        </div>
        <br />
      </div>

      <Footer />
    </main>
  );
};
