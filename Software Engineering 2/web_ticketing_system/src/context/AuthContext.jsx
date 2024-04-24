"use client";
import React, { createContext, useState, useEffect } from "react";

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
  const [user, setUser] = useState(null);
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
  };

  useEffect(() => {
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
