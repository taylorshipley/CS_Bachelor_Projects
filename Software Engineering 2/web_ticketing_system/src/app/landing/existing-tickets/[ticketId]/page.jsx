"use client";

import React, { useState, useEffect } from "react";
import GetTicket from "@/Components/GetTicket";
import useLayout from "../../../../hooks/layoutMaster";
import TicketDetails from "@/Components/TicketDetails";

// Define the Page component
export default function Page({ params }) {
  const [ticket, setTicket] = useState(null);
  const getLayout = useLayout();

  useEffect(() => {
    const fetchData = async () => {
      if (params && params.ticketId) {
        const data = await GetTicket(params.ticketId);
        setTicket(data);
      }
    };

    fetchData();
  }, [params]); // Dependency on params ensures this runs when params change

  const pageContent = (
    <div className="ticket-page-background">
      {ticket ? (
        <div className="ticket-container">
          <TicketDetails ticket={ticket} />
        </div>
      ) : (
        <div>Loading...</div>
      )}
      <style jsx>{`
        .ticket-page-background {
          display: flex;
          justify-content: center;
          align-items: center;
          height: 100vh;
          background-color: #471aa0;
        }
        .ticket-container {
          max-width: 900px; // Adjust this value as needed
          width: 100%; // Ensure it takes the full width up to the max-width
        }
      `}</style>
    </div>
  );

  // Wrap the page content with the appropriate layout
  return getLayout(pageContent);
}
