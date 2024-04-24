"use client";

import React, { useState, useEffect } from "react";
import useLayout from "../../../hooks/layoutMaster";
import ExistingTickets from "../../../Components/ExisitingTickets";
import getTickets from "@/Components/GetTickets";

export default function Page() {
  const [tickets, setTickets] = useState(null);
  const getLayout = useLayout();
  useEffect(() => {
    const fetchData = async () => {
      const data = await getTickets();
      setTickets(data);
    };
    fetchData();
  }, []);

  const pageContent = tickets ? (
    <ExistingTickets tickets={tickets} />
  ) : (
    <div>Loading...</div>
  );

  return getLayout(pageContent);
}
