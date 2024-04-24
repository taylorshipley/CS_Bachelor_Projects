import React from "react";

const EmployeeLayout = ({ children }) => {
  return (
    <div className="employee-layout">
      <aside>You are in the Employee Layout</aside>
      <main>{children}</main>
    </div>
  );
};

export default EmployeeLayout;
