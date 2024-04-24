"use client";
import { useContext } from "react";
import TicketDashboard from "@/Components/TicketDashboard";
import useLayout from "../../hooks/layoutMaster";
import { AuthContext } from "../AuthProvider";

export default function Page({ Component, pageProps }) {
  const getLayout = useLayout();
  const { user } = useContext(AuthContext);
  const pageContent = (
    <div>
      <TicketDashboard />
    </div>
  );

  return getLayout(pageContent);
}
