import React from "react";

const AdminLayout = ({ children }) => {
  return (
    <div className="admin-layout">
      <aside>You are in the Admin Layout</aside>
      <main>{children}</main>
    </div>
  );
};

export default AdminLayout;
