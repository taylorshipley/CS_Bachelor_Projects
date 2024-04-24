"use client";
import { useContext } from "react";
import AuthProvider, { AuthContext } from "../app/AuthProvider";
import AdminLayout from "@/Components/AdminLayout";
import RepLayout from "@/Components/RepLayout";
import EmployeeLayout from "@/Components/EmployeeLayout";
import UserSwitcher from "@/Components/UserSwitcherTest";

const useLayout = (props) => {
  const { user } = useContext(AuthContext);

  const getLayout = (page) => {
    console.log("In GetLayout");

    if (user && user.role) {
      switch (user.role) {
        case "admin":
          return (
            <AdminLayout key={user.role}>
              <UserSwitcher />
              {page}
            </AdminLayout>
          );
        case "rep":
          return (
            <RepLayout key={user.role}>
              <UserSwitcher />
              {page}
            </RepLayout>
          );
        case "employee":
          return (
            <EmployeeLayout key={user.role}>
              <UserSwitcher />
              {page}
            </EmployeeLayout>
          );
        default:
          // needs to handle case where role is not defined
          return (
            <EmployeeLayout key={user.role}>
              <UserSwitcher />
              {page}
            </EmployeeLayout>
          );
      }
    }
    // Return default or loading layout if user is null
    return (
      <div>
        <EmployeeLayout>
          <UserSwitcher />
          {page}
        </EmployeeLayout>
      </div>
    );
  };

  return getLayout;
};

export default useLayout;
