"use client";

import { useContext } from "react";
import useLayout from "../../../hooks/layoutMaster";
import TicketForm from "@/Components/TicketForm";
import { AuthContext } from "../../AuthProvider";

export default function Page() {
  const getLayout = useLayout();
  const { user } = useContext(AuthContext);
  const pageContent = (
    <div>
      <TicketForm />
    </div>
  );

  return getLayout(pageContent);
}
