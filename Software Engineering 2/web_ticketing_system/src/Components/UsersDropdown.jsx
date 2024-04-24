import React, { useState, useEffect } from "react";
import getUsers from "./GetUsers";

const UserDropdown = ({ onChange, selectedUserId }) => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const fetchedUsers = await getUsers();
        setUsers(fetchedUsers);
      } catch (error) {
        console.error("Error Fetching Users:", error);
      }
    };
    fetchUsers();
  }, []);

  return (
    <select onChange={onChange} value={selectedUserId || ""}>
      <option value="">Select User To Assign</option>
      {users.map((user) => (
        <option key={user.userId} value={user.userId}>
          {user.firstName} {user.lastName} - {user.userRoleId}
        </option>
      ))}
    </select>
  );
};

export default UserDropdown;
