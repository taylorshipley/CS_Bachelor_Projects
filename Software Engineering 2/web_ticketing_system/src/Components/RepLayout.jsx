import React from "react";

const RepLayout = ({ children }) => {
  return (
    <div className="rep-layout">
      <aside>You are in the Representative Layout</aside>
      <main>{children}</main>
    </div>
  );
};

export default RepLayout;
