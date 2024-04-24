"use client";

import React, { createContext, useState, useContext, useEffect } from "react";

export const AuthContext = createContext({
  user: null,
  setUser: () => {},
  login: () => {},
  logout: () => {},
  loading: true,
  dummyUsers: [],
});

const dummyUsers = [
  { id: 1, username: "adminUser", role: "admin" },
  { id: 2, username: "repUser", role: "rep" },
  { id: 3, username: "employeeUser", role: "employee" },
  { id: 7, username: "zachUser", role: "admin" },
  { id: 8, username: "irvinUser", role: "rep" },
];

export default function AuthProvider({ children }) {
  const [user, setUser] = useState(() => {
    if (typeof window !== 'undefined') {
      // Check if window (client side) is defined
      const savedUser = sessionStorage.getItem("user");
      const userData = savedUser ? JSON.parse(savedUser) : null;
      console.log("Restored user: ", userData);
      return userData;
    } else {
      return null; // Handle the case when running on the server
    }
  });

  const [loading, setLoading] = useState(true);

  const login = async (username, password) => {
    setLoading(true);

    if (dummyUsers[username]) {
      setUser(dummyUsers[username]);
    }

    setLoading(false);
  };

  const logout = () => {
    setUser(null);
    sessionStorage.removeItem("user");
  };

  useEffect(() => {
    if (user) {
      sessionStorage.setItem("user", JSON.stringify(user));
    }
    console.log("Current User: ", user);
    setLoading(false);
  }, [user]);

  return (
    <AuthContext.Provider
      value={{ user, setUser, login, logout, loading, dummyUsers }}
    >
      {children}
    </AuthContext.Provider>
  );
}
