import React, { useContext, useState } from "react";
import { AuthContext } from "../app/AuthProvider";

const UserSwitcher = (props) => {
  const { setUser, dummyUsers } = useContext(AuthContext);
  const [isDrawerOpen, setIsDrawerOpen] = useState(false);

  console.log("Dummy Users:", dummyUsers);

  const handleUserChange = (newUser) => {
    console.log("Switching user to:", newUser);
    setUser(newUser);
  };

  const toggleDrawer = () => {
    setIsDrawerOpen(!isDrawerOpen);
  };

  return (
    <div>
      <button onClick={toggleDrawer} className="toggle-drawer-button">
        {isDrawerOpen ? "Hide Users" : "Show Users"}
      </button>
      <div
        className={`user-switcher-drawer ${isDrawerOpen ? "open" : "closed"}`}
      >
        {dummyUsers.map((user) => (
          <button
            key={user.id}
            className="user-switcher-button"
            onClick={() => handleUserChange(user)}
          >
            Switch to {user.username}
          </button>
        ))}
      </div>
      <style jsx>{`
        .toggle-drawer-button {
          position: absolute;
          top: 10px;
          right: 10px;
          background-color: #4a5568;
          color: #e2e8f0;
          padding: 8px 16px;
          border: none;
          cursor: pointer;
          transition: all 0.3s ease;
          z-index: 1000;
        }

        .user-switcher-drawer {
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          background-color: #4a5568;
          overflow: hidden;
          max-height: 0;
          transition: max-height 0.3s ease-in-out;
          z-index: 999;
        }

        .user-switcher-drawer.open {
          max-height: 100px; /* Adjust based on content */
        }

        .user-switcher-button {
          background-color: #2d3748;
          color: white;
          padding: 8px 16px;
          margin: 5px;
          border: none;
          cursor: pointer;
          transition: all 0.3s ease;
        }
      `}</style>
    </div>
  );
};

export default UserSwitcher;
